package com.wccnet.goodTimeBobbys.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

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
import com.wccnet.goodTimeBobbys.dao.OrderProcessingImpl;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.ItemOrdered;
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

	@Autowired
	private OrderProcessingImpl orderProcessingImpl;

	// used to store the itemNumber value for the cart, itemOrdered, and orderInfo
	// table
	int itemNumber = 0;

	@RequestMapping("/")
	public String loginOne(Model model) {
		OrderInfo order = new OrderInfo();
		restaurantDAO.saveOrder(order);
		model.addAttribute("users", userDAO.getUsers());
		model.addAttribute("order", order);
		return "login";
	}

	// Display all Menu items and their ingredients
	@RequestMapping("/menu")
	public String getMenuItems(Model model, @RequestParam(name = "userID", defaultValue = "0") int userID,
			@RequestParam(name = "orderID") int orderID) {

		// TODO: create insert of UserID where orderId = orderID
		orderProcessingImpl.createOrderInfo(orderID, userID);

		model.addAttribute("user", userDAO.getUserByID(userID));
		model.addAttribute("orderID", restaurantDAO.getOrderInfoByID(orderID).getOrderId());
		model.addAttribute("fullMenuItemList", restaurantDAO.getMenuItems());

		return "menu";
	}

	@RequestMapping("/addMenuItemToCart")
	public String addMenuItemToCart(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "menuItemID") int menuItemID, @RequestParam(name = "orderID") int orderID) {

		int userIdInt = userID;
		int orderIdInt = orderID;

		// adds 1 to the class property (instance variable) each time we enter this
		// method (each menuItem added to cart)
		itemNumber += 1;

		orderListCreator.menuItemIdListCreator(menuItemID);

		model.addAttribute("itemNumber", itemNumber);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemIdList", orderListCreator.getItemIdList());

		return "redirect:/menu";

	}

	@RequestMapping("/backToCart")
	public String backToCart(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			@ModelAttribute(name = "subtotal") String subtotal, BindingResult bindingResult) {

		int userIdInt = userID;
		int orderIdInt = orderID;

		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemIdList", orderListCreator.getItemIdList());
		return "redirect:/cart";
	}

	@RequestMapping("/cart")
	public String itemIdList(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			@ModelAttribute(name = "subtotal") String priceTotal, BindingResult bindingResult) {

		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);

		int orderIDint = orderInfo.getOrderId();
		int setItemNumber = 0;

		// getTheItemIdList then iterate thru the list. ForEach menuItem increase
		// itemNumber by one
		// and add it to orderProcessingImpl.addMenuItemInCart
//		ArrayList<MenuItem> menuItemListHolder = new ArrayList<>();

		for (Integer menuItemId : orderListCreator.getItemIdList()) {
			MenuItem menuItemHolder = restaurantDAO.getMenuItemByID(menuItemId);
			setItemNumber += 1;
			menuItemHolder.setItemNumber(setItemNumber);
			orderProcessingImpl.addMenuItemInCart(menuItemHolder);
			// menuItemList.add(menuItemHolder);
		}

		model.addAttribute("user", user);
		model.addAttribute("orderID", orderIDint);
//		model.addAttribute("itemNumber", menuService.getItemNumber(menuItemList));
		model.addAttribute("itemNumber", menuService.getItemNumber(orderProcessingImpl.getMenuItemInCart()));
//		model.addAttribute("menuItemListHolder", menuItemListHolder);
		model.addAttribute("menuItemList", orderProcessingImpl.getMenuItemInCart());
		model.addAttribute("subtotal", menuService.getSubTotal(orderProcessingImpl.getMenuItemInCart()));
		// model.addAttribute("subtotal", menuService.getSubTotal(menuItemList));

		return "cart";

	}

	@RequestMapping("/modify")
	public String modifyItem(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID, @RequestParam(name = "menuItemID") int menuItemID,
			@RequestParam(name = "itemNumber") int itemNumber) {
		// @RequestParam(name = "menuItemListHolder") ArrayList<MenuItem>
		// menuItemListHolder,
		// @RequestParam(name = "menuItemList") ArrayList<MenuItem> menuItemList,
		// @ModelAttribute(name = "defaultIngredientList") Ingredient
		// defaultIngredientList,
		// @ModelAttribute(name = "ingredients") Ingredient ingredients,
		// BindingResult bindingResult) {

		// ArrayList<MenuItem> menuItemListHolder = menuItemList;

//		for (MenuItem menuItemIterator : menuItemList) {
//			System.out.println(menuItemIterator);
//			if (menuItemIterator.getItemId() == menuItemID) {
//				menuItem = menuItemIterator;
//			}
//		}

//		if (model.containsAttribute("menuItemList")) {
//			System.out.println("yes the Modify model contains the menuItemList");
//		} else {
//			System.out.println("NO Modify doesn't contain menuItemList");
//		}

		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemID);
		User user = userDAO.getUserByID(userID);
		// restaurantDAO.getMenuItemByID(menuItemID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);

		int orderIDint = orderInfo.getOrderId();
		int itemNumberInt = itemNumber;

		List<Ingredient> defaultIngredientIDList = ingredientDAO.getIngredientListByMenuItemID(menuItem.getItemId());
		List<Ingredient> fullIngredientList = ingredientDAO.getAllIngredients();
		List<Ingredient> ingredientsToRemove = new ArrayList<Ingredient>();

		for (Ingredient ingredient : fullIngredientList) {
			for (Ingredient defaultIngredient : defaultIngredientIDList) {

				if (ingredient.getIngredientId() == defaultIngredient.getIngredientId()) {
					ingredientsToRemove.add(ingredient);
				}
			}
		}
		fullIngredientList.removeAll(ingredientsToRemove);

		model.addAttribute("user", user);
		// model.addAttribute("menuItemList", menuItemListHolder);
		model.addAttribute("menuItemID", menuItem.getItemId());
		model.addAttribute("itemNumber", itemNumberInt);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("defaultIngredientList", defaultIngredientIDList);
		model.addAttribute("ingredients", fullIngredientList);

		return "modify";
	}

	@RequestMapping(value = "/testing", method = RequestMethod.POST)
	public String usedForTesting(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "menuItemID") int menuItemID,
//			@RequestParam(name = "menuItem") MenuItem menuItem,
			@RequestParam(name = "ingredientAdded") String[] checkboxValue,
			@RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "itemNumber") int itemNumber,
//			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			RedirectAttributes redirectAttribute) {

		int userIdInt = userID;
		User user = userDAO.getUserByID(userIdInt);

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		// ArrayList<MenuItem> menuItemListHolder = menuItemList;

		int menuItemIdInt = menuItemID;
		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemIdInt);

		// ArrayList<MenuItem> menuItemsList = menuItemList;
		int itemNumberInt = itemNumber;
		// iterates thru the checkbox list<String> and parses the ingredientId's (int's)
		// out of it
		for (String string : checkboxValue) {
			Integer ingredientID = Integer.parseInt(string);
			orderListCreator.ingredientIdSetCreator(ingredientID);
		}

		for (Integer ingSet : orderListCreator.getModifiedIngredientIdSet()) {
			int ingredientID = ingSet;
			orderListCreator.modifiedIngredientList(ingredientDAO.getIngredientByID(ingredientID));
		}

		Set<Integer> defaultIngredientIDList = ingredientDAO.getDefaultIngredientIDs(menuItemIdInt);

		// Gets Ingredients Added by user
		List<Ingredient> addedIngredientsByUser = new ArrayList<Ingredient>();
		for (Integer ingredientID : orderListCreator.getModifiedIngredientIdSet()) {
			if (defaultIngredientIDList.contains(ingredientID)) {

				System.out.println("in ADD - Do Nothing for ingredientID: " + ingredientID);
			} else {
				addedIngredientsByUser.add(ingredientDAO.getIngredientByID(ingredientID));
				System.out.println("in ADD - add ingredient: " + ingredientID);

				ItemOrdered itemOrdered = new ItemOrdered(orderInfo, itemNumberInt, menuItem, ingredientID, 1);
				// orderProcessingImpl.addItemOrderedToDatabase(itemOrdered);
				orderProcessingImpl.addItemOrderedToList(itemOrdered);

				menuItem.clearItemsOrderedList();
				orderInfo.clearItemsOrderedList();

				// orderInfo.clearItemsOrderedList();
			}
		}

		// Gets Ingredients Removed by user
		List<Ingredient> removedIngredientsByUser = new ArrayList<Ingredient>();
		for (Integer ingredientID : defaultIngredientIDList) {

			if (orderListCreator.getModifiedIngredientIdSet().contains(ingredientID)) {
				// DO NOTHING
				System.out.println("in REMOVED - Do nothing for ingredientID: " + ingredientID);
			} else {
				removedIngredientsByUser.add(ingredientDAO.getIngredientByID(ingredientID));
				System.out.println("in REMOVED - add ingredient: " + ingredientID);

				ItemOrdered itemOrdered = new ItemOrdered(orderInfo, itemNumberInt, menuItem, ingredientID, 0);
				// orderProcessingImpl.addItemOrderedToDatabase(itemOrdered);
				orderProcessingImpl.addItemOrderedToList(itemOrdered);
				menuItem.clearItemsOrderedList();
				orderInfo.clearItemsOrderedList();
			}
		}

		// persist to the ItemOrdered table
		// orderProcessingImpl.processItemsOrdered(orderProcessingImpl.getItemOrderedHolder());

		model.addAttribute("addedIngredientsByUser", addedIngredientsByUser);
		model.addAttribute("removedIngredientsByUser", removedIngredientsByUser);
		model.addAttribute("user", user);
		model.addAttribute("menuItem", menuItem);
		model.addAttribute("menuItemID", menuItemIdInt);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("itemNumber", itemNumberInt);
		// model.addAttribute("menuItemList", menuItemList);
		// model.addAttribute("subtotal", priceTotal);
		// model.addAttribute("ingredientAdded",
		// orderListCreator.getModifiedIngredientList());
		// model.addAttribute("modifiedIngredientSet",
		// orderListCreator.getModifiedIngredientIdSet());
		// redirectAttribute.addAttribute("poopy", user).addFlashAttribute("message",
		// "Account created!");

		return "testing";
		// return "redirect:/itemIdList";
	}

	// This is under construction - revisit
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
	public String backToMenu(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID) {

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		model.addAttribute("orderID", orderIDint);
		model.addAttribute("user", userDAO.getUserByID(userID));
		model.addAttribute("fullMenuItemList", restaurantDAO.getMenuItems());
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

//	 Model model,
//	@RequestParam(name = "userID") int userID,
//	@RequestParam(name = "orderID") int orderID,
//	@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
//	@ModelAttribute(name = "subtotal") String priceTotal, BindingResult bindingResult

}
