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

//	int itemNumber = 0;

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

		orderListCreator.menuItemIdListCreator(menuItemID);

		MenuItem menuItemHolder = restaurantDAO.getMenuItemByID(menuItemID);
		orderProcessingImpl.addMenuItemInCart(menuItemHolder);

		model.addAttribute("itemNumber", menuItemHolder.getItemNumber());
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemIdList", orderListCreator.getItemIdList());

		return "redirect:/menu";

	}

	@RequestMapping("/backToMenu")
	public String backToMenu(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID) {

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();
		int userIdInt = userID;

		model.addAttribute("orderID", orderIDint);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("user", userDAO.getUserByID(userID));
		model.addAttribute("fullMenuItemList", restaurantDAO.getMenuItems());
		return "menu";
	}

	@RequestMapping("/backToCart")
	public String backToCart(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList, BindingResult bindingResult) {
//			@ModelAttribute(name = "subtotal") String subTotal) {

		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIdInt = orderInfo.getOrderId();
		int userIdInt = userID;
		menuItemList = orderProcessingImpl.getMenuItemInCart();
		double subTotalDouble = menuService.getSubTotal(menuItemList);

		model.addAttribute("user", user);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemNumber", menuService.getItemNumber(menuItemList));
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("subTotal", subTotalDouble);
		return "cart";
	}

	@RequestMapping("/cart")
	public String itemIdList(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList) {

		User user = userDAO.getUserByID(userID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();
		int userIdInt = user.getUserId();
		menuItemList = orderProcessingImpl.getMenuItemInCart();
		double subTotalDouble = menuService.getSubTotal(menuItemList);

		model.addAttribute("user", user);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("itemNumber", menuService.getItemNumber(menuItemList));
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("subTotal", subTotalDouble);

		return "cart";

	}

	@RequestMapping("/modify")
	public String modifyItem(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID, @RequestParam(name = "menuItemID") int menuItemID,
			@RequestParam(name = "itemNumber") int itemNumber) {

		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemID);
		User user = userDAO.getUserByID(userID);
		// restaurantDAO.getMenuItemByID(menuItemID);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);

		int orderIDint = orderInfo.getOrderId();
		int itemNumberInt = itemNumber;
		int userIdInt = userID;

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
		model.addAttribute("userID", userIdInt);
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
			@RequestParam(name = "ingredientAdded") String[] checkboxValue, @RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "itemNumber") int itemNumber, RedirectAttributes redirectAttribute) {

		int userIdInt = userID;
		User user = userDAO.getUserByID(userIdInt);

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		int orderIDint = orderInfo.getOrderId();

		int menuItemIdInt = menuItemID;
		MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemIdInt);
		int itemNumberInt = itemNumber;
		// iterates thru the checkbox list<String> and parses the ingredientId's (int's)
		// out of it
		for (String string : checkboxValue) {
			Integer ingredientID = Integer.parseInt(string);
			orderListCreator.ingredientIdSetCreator(ingredientID);
		}

		for (Integer ingSet : orderListCreator.getModifiedIngredientIdSet()) {
			int ingredientID = ingSet;
			orderListCreator.addToModifiedIngredientList(ingredientDAO.getIngredientByID(ingredientID));
		}

		Set<Integer> defaultIngredientIDList = ingredientDAO.getDefaultIngredientIDs(menuItemIdInt);

		// Gets Ingredients Added by user
		// List<Ingredient> addedIngredientsByUser = new ArrayList<Ingredient>();
		for (Integer ingredientID : orderListCreator.getModifiedIngredientIdSet()) {
			if (defaultIngredientIDList.contains(ingredientID)) {

				System.out.println("in ADD - Do Nothing for ingredientID: " + ingredientID);
			} else {
				menuService.addToAddedIngredientsByUser(ingredientDAO.getIngredientByID(ingredientID));
				System.out.println("in ADD - add ingredient: " + ingredientID);

				ItemOrdered itemOrdered = new ItemOrdered(orderInfo, itemNumberInt, menuItem, ingredientID, 1);
				// orderProcessingImpl.addItemOrderedToDatabase(itemOrdered);
				orderProcessingImpl.addItemOrderedToList(itemOrdered);

				menuItem.clearItemsOrderedList();
				orderInfo.clearItemsOrderedList();
			}
		}
//		Double ingredientPriceTotal = 0.00;
//		
//		for (Ingredient ingredient : addedIngredientsByUser) {
//			ingredientPriceTotal += ingredient.getIngredientPrice();
//		}
//		String ingredientPriceString = ingredientPriceTotal.toString();

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

		orderListCreator.clearModifiedIngredientIdSet();

		model.addAttribute("addedIngredientsByUser", menuService.getAddedIngredientsByUser());
		model.addAttribute("removedIngredientsByUser", removedIngredientsByUser);
		model.addAttribute("user", user);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("menuItem", menuItem);
		model.addAttribute("menuItemID", menuItemIdInt);
		model.addAttribute("orderID", orderIDint);
		model.addAttribute("itemNumber", itemNumberInt);

		return "testing";
	}

	// This is under construction - revisit
	@RequestMapping("/addChangesToItem")
	public String addChangesToItem(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "ingredientAdded") String[] checkboxValue,
			@RequestParam(name = "menuItemID") int menuItemID,
			@ModelAttribute(name = "menuItemIdList") ArrayList<Integer> menuItemIdList,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList, BindingResult bindingResult) {
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
		model.addAttribute("subTotal", menuService.getSubTotal(menuItemList));

		return "redirect:/cart";
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
		System.out.println("Getting the filtered ingredient list");
		return "filteredIngredientList";
	}

	@RequestMapping("/checkout")
	public String checkout(Model model, @RequestParam(name = "userID") int userID,
			@RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "comparisonSet") Set<Integer> comparisonSet,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
			@ModelAttribute(name = "ingredients") Ingredient ingredients,
			@ModelAttribute(name = "subTotal") String priceTotal, BindingResult bindingResult,
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

	@RequestMapping("/processOrder")
	public String processOrder(Model model, @RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "userID") int userID, @RequestParam(name = "itemNumber") int itemNumber,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList, BindingResult bindingResult) {

		menuItemList = orderProcessingImpl.getMenuItemInCart();

		int userIdInt = userID;
		int orderIdInt = orderID;
		int itemNumberInt = itemNumber;
		
		Double subTotalDouble = menuService.getSubTotal(menuItemList);
		Double taxDouble = menuService.getTax(subTotalDouble);

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		String date = orderInfo.getOrderDate();
		//Double ingredientsAddedPriceTotalDouble = menuService.getIngredientsAddedPriceTotal();
		
		orderInfo.setOrderSubtotal(subTotalDouble);
		orderInfo.setOrderTax(menuService.getTax(subTotalDouble));
		orderInfo.setOrderTotal(menuService.getTotal(menuItemList, subTotalDouble, .06));

		ArrayList<ItemOrdered> itemsOrderedList = orderProcessingImpl.getItemOrderedHolder();
		ArrayList<ItemOrdered> sendItemOrderedList = new ArrayList<>();

		// what is not in the itemsOrderedList and is in menuItemList send to DB
		for (MenuItem menuItem : menuItemList) {
			if (!itemsOrderedList.isEmpty()) {
				for (ItemOrdered itemOrdered : itemsOrderedList) {
					if (menuItem.getItemNumber() != itemOrdered.getItemNumber()) {
						ItemOrdered nonModifiedItem = new ItemOrdered();
						nonModifiedItem.setOrderInfo(orderInfo);
						nonModifiedItem.setItemNumber(menuItem.getItemNumber());
						nonModifiedItem.setMenuItem(menuItem);
						sendItemOrderedList.add(nonModifiedItem);
						System.out.println("inside for loop: before else statment");
					}
//					else {
//						sendItemOrderedList.add(new ItemOrdered(orderInfo, menuItem.getItemNumber(), menuItem));
//						System.out.println("inside for loop: after else statment");
//					}
				}
				
				//NEED TO UPDATE THIS - NEEDS TO ADD ITEMS TO BE SENT TO DB IF THERES MODIFIED AND NON
			} else {
				sendItemOrderedList.add(new ItemOrdered(orderInfo, menuItem.getItemNumber(), menuItem));
			}
		}

		for (ItemOrdered itemOrdered : sendItemOrderedList) {
			System.out.println(itemOrdered);
		}

		for (ItemOrdered itemOrdered : sendItemOrderedList) {
			orderProcessingImpl.processItemsOrdered(itemOrdered);
		}

		
		
		model.addAttribute("orderDate", date);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemNumber", itemNumberInt);
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("itemsOrderedList", sendItemOrderedList);
		model.addAttribute("orderTotalWithoutTax", subTotalDouble);
		model.addAttribute("orderTotalWithTax", menuService.getTotal(menuItemList, subTotalDouble, taxDouble));
		model.addAttribute("orderTotalTax", taxDouble);
		
		// model.addAttribute("ingredientNameHashMap", ingredientNames);

		return "processOrder";
	}

	@RequestMapping("/sendOrderToDatabase")
	public String sendOrderToDatabase(Model model, @RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "userID") int userID, @RequestParam(name = "itemNumber") int itemNumber,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList) {
		int userIdInt = userID;
		int orderIdInt = orderID;
		int itemNumberInt = itemNumber;
		Double subTotalDouble = menuService.getSubTotal(menuItemList);
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		String date = orderInfo.getOrderDate();
		menuItemList = orderProcessingImpl.getMenuItemInCart();
		ArrayList<ItemOrdered> itemsOrderedList = orderProcessingImpl.getItemOrderedHolder();

		model.addAttribute("orderDate", date);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("itemNumber", itemNumberInt);
		model.addAttribute("subTotal", subTotalDouble);
		model.addAttribute("menuItemList", menuItemList);
		model.addAttribute("itemsOrderedList", itemsOrderedList);

		return "sendOrderToDatabase";
	}

}