package com.wccnet.goodTimeBobbys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.wccnet.goodTimeBobbys.dao.IIngredientDAO;
import com.wccnet.goodTimeBobbys.dao.IRestaurantDAO;
import com.wccnet.goodTimeBobbys.dao.IUserDAO;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;
import com.wccnet.goodTimeBobbys.entity.OrderListCreator;
import com.wccnet.goodTimeBobbys.entity.User;
import com.wccnet.goodTimeBobbys.service.IMenuService;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private IRestaurantDAO restaurantDAO;

	@Autowired
	private IUserDAO userDAO;

	@Autowired
	private IIngredientDAO ingredientDAO;

	@Autowired
	private OrderListCreator orderListCreator;

	@Autowired
	private IMenuService menuService;

	@RequestMapping("/")
	public String loginOne(Model model) {
		OrderInfo order = new OrderInfo();
		restaurantDAO.saveOrder(order);
		System.out.println(order.getOrderId());
		model.addAttribute("users", userDAO.getUsers());
		model.addAttribute("order", order);
		return "login";
	}

	// Display all Menu items and their ingredients
	@RequestMapping("/menu")
	public String getMenuItems(Model model, @RequestParam(name = "userID", defaultValue = "0") int userID,
			@RequestParam(name = "orderID") int orderID, @ModelAttribute("menuItems") MenuItem menuItem,
			@ModelAttribute("ingredientIDs") Ingredient ingredientID, BindingResult bindingResult) {
		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);

		int orderIDint = orderInfo.getOrderId();
		// OrderInfo order = restaurantDAO.getOrderInfoByID(orderID);

		model.addAttribute(user);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("menuItem", restaurantDAO.getMenuItems());
		return "menu";
	}

	@RequestMapping("/addMenuItemToCart")
	public String addMenuItemToCart(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "menuItemID") int menuItemID, @RequestParam(name = "orderID") int orderID) {
		int user = userID;
		int orderIDint = orderID;

		// OrderInfo order = restaurantDAO.getOrderInfoByID(orderID);
		orderListCreator.listCreator(menuItemID);

		model.addAttribute("userID", user);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("itemIdList", orderListCreator.getItemIdList());

		return "redirect:/menu";

	}

	@RequestMapping("itemIdList")
	public String itemIdList(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			@ModelAttribute(name = "subtotal") String priceTotal, BindingResult bindingResult) {

		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		for (Integer menuItemId : orderListCreator.getItemIdList()) {
			menuItemList.add(restaurantDAO.getMenuItemByID(menuItemId));
		}

		model.addAttribute("user", user);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("subtotal", menuService.getSubTotal(menuItemList));

		return "cart";

	}

	@RequestMapping("/modify")
	public String modifyItem(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "menuItemID") int menuItemID, @RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "defaultIngredientList") Ingredient defaultIngredientList,
			@ModelAttribute(name = "ingredients") Ingredient ingredients,
			// @ModelAttribute(name = "comparisonSet") Set<Integer> comparisonSet,
			BindingResult bindingResult) {

		User user = userDAO.getUserByID(userID);
		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();
		// Set<Integer> results =
		// ingredientDAO.compareDefaultAndChosenIngredients(menuItemID);
		List<Ingredient> defaultIngredientIDList = ingredientDAO.getIngredientListByMenuItemID(menuItemID);
		List<Ingredient> fullIngredientList = ingredientDAO.getAllIngredients();
		List<Ingredient> ingredientsToRemove= new ArrayList<Ingredient>();

		for (Ingredient ingredient : fullIngredientList) {
			for (Ingredient defaultIngredient : defaultIngredientIDList) {

				if (ingredient.getIngredientId() == defaultIngredient.getIngredientId()) {
					ingredientsToRemove.add(ingredient);
				}
			}
		}
			fullIngredientList.removeAll(ingredientsToRemove);
	
		model.addAttribute(user);
		model.addAttribute("menuItem", menuItem);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("defaultIngredientList", ingredientDAO.getIngredientListByMenuItemID(menuItemID));
		model.addAttribute("ingredients",  fullIngredientList);
		// model.addAttribute("comparisonSet", results);

		return "modify";
	}

	@RequestMapping("/addChangesToItem")
	public String addChangesToItem(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "ingredientAdded") String[] checkboxValue,
			@RequestParam(name = "menuItemID") int menuItemID,
			@ModelAttribute(name = "menuItemIdList") ArrayList<Integer> menuItemIdList,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList, BindingResult bindingResult) {
		// @RequestParam(name = "ingredientChoies") ) {
		int user = userID;

		for (Integer menuItemId : orderListCreator.getItemIdList()) {
			menuItemList.add(restaurantDAO.getMenuItemByID(menuItemId));
		}
		for (String string : checkboxValue) {
			Integer ingredientID = Integer.parseInt(string);
			orderListCreator.ingredientIdSetCreator(ingredientID);
		}

		model.addAttribute("userID", user);
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("subtotal", menuService.getSubTotal(menuItemList));

		return "redirect:/cart";
	}

	@RequestMapping("/backToMenu")
	public String backToMenu(Model model,
			@RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID) {
		int userId = userID;
		User user = userDAO.getUserByID(userID);

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		model.addAttribute("orderID", orderIDint);
		model.addAttribute("user", user);
		model.addAttribute("menuItem", restaurantDAO.getMenuItems());
		return "menu";
	}

	@RequestMapping("/fullIngredientList")
	public String getIngerdientList(Model model, @ModelAttribute("ingredient") Ingredient ingredient,
			BindingResult result) {
		model.addAttribute("ingredient", restaurantDAO.getIngredient());
		System.out.println("in controller.getIngretientList");

		return "fullIngredientList";
	}

	// ADD THIS TO THE FUNCTION PARAMS WHEN WE ARE ABLE!!!
	// @RequestParam("ingredientCatagory") String ingredientCategotry,
	@RequestMapping("/filteredIngredientList")
	public String getFilteredIngredientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient,
			BindingResult result) {
		model.addAttribute("ingredients", restaurantDAO.getIngredientsByIngredientCategory("Burger"));
		// model.addAttribute("ingredientIndex", ingredient.getIngredientId());
		System.out.println("Getting the filtered ingredient list");
		return "filteredIngredientList";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "comparisonSet") Set<Integer> comparisonSet,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			@ModelAttribute(name = "ingredients") Ingredient ingredients,
			@ModelAttribute(name = "subtotal") String priceTotal, BindingResult bindingResult,
			RedirectAttributes redirectAttribute) {
		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		model.addAttribute(user);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute(menuItemList);
		model.addAttribute(comparisonSet);
		model.addAttribute("priceTotal", priceTotal);
		model.addAttribute("ingredients", ingredientDAO.getIngredientListByMenuItemID(8));

		return "checkout";
	}

	@RequestMapping(value = "/testing", method = RequestMethod.POST)
	public String usedForTesting(Model model,
			@RequestParam(name = "userID") int userID,
			@RequestParam(name = "menuItemID") int menuItemID,
			@RequestParam(name = "ingredientAdded") String[] checkboxValue,
			@RequestParam(name = "orderID") int orderID,
			RedirectAttributes redirectAttribute) {
		
		int userIdInt = userID;
		User user = userDAO.getUserByID(userIdInt);
		
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();
		
		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemID);
		
		
		for (String string : checkboxValue) {
			System.out.println(string);
			Integer ingredientID = Integer.parseInt(string);
			orderListCreator.ingredientIdSetCreator(ingredientID);
		}


		for (Integer ingSet : orderListCreator.getModifiedIngredientIdSet()) {
			int ingredientID = ingSet;
			orderListCreator.modifiedIngredientList(ingredientDAO.getIngredientByID(ingredientID));
		}
		
		

		model.addAttribute("user", user);
		model.addAttribute("menuItem", menuItem);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("ingredientAdded", orderListCreator.getModifiedIngredientList());
		//model.addAttribute("modifiedIngredientSet", orderListCreator.getModifiedIngredientIdSet());
		//redirectAttribute.addAttribute("poopy", user).addFlashAttribute("message", "Account created!");
		   
		return "testing";
	}
}
