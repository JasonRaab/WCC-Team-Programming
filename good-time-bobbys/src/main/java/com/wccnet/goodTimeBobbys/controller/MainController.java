package com.wccnet.goodTimeBobbys.controller;

import java.text.ParseException;
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

	@RequestMapping("/")
	public String loginOne(Model model) {
	//	beginSession();
		OrderInfo order = new OrderInfo();
		restaurantDAO.saveOrder(order);
		orderProcessingImpl.getMenuItemInCart().clear();
		model.addAttribute("users", userDAO.getUsers());
		model.addAttribute("order", order);
		return "login";
	}

//	public void beginSession() {
//		restaurantDAO.beginSession();
//	}

	@RequestMapping(value = "/loginConfirmation")
	public String loginConfirmationRedirect(Model model, @RequestParam("userEmail") String userEmail,
			@RequestParam(value = "orderID") Integer orderID, @RequestParam("password") String password,
			RedirectAttributes redirectAttribute) {

		Integer orderIdInt = orderID;

		Integer validUserAndPW = userDAO.getUserByEmailAndPassword(userEmail, password);

		if (validUserAndPW != -1) {
			System.out.println("user id " + validUserAndPW);
			redirectAttribute.addAttribute("userID", validUserAndPW);
			redirectAttribute.addAttribute("orderID", orderIdInt);

			return "redirect:/menu";
		} else {
			return "failedLogin";
		}
	}

	@RequestMapping("/addUser")
	public String createUserProfile(Model model) throws ParseException {
		User newUser = new User();

		model.addAttribute("user", newUser);
		return "addUser";
	}

	@RequestMapping("/processUser")
	public String persistUserToDatabase(@ModelAttribute("user") User user, BindingResult bindingResult) {
		userDAO.saveUser(user);
		return "redirect:/";
	}

	@RequestMapping("/readOnlyMenu")
	public String readOnlyMenuPage(Model model) {
		model.addAttribute("fullMenuItemList", restaurantDAO.getMenuItems());
		return "readOnlyMenu";
	}

	// Display all Menu items and their ingredients
	@RequestMapping("/menu")
	public String getMenuItems(Model model, @RequestParam(name = "userID", defaultValue = "0") int userID,
			@RequestParam(name = "orderID") int orderID) {

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
		if (!menuService.getAddedIngredientsByUser().isEmpty()) {
			menuService.getIngredientsAddedPriceTotal();
			menuService.clearAddedIngredientsByUser();
		}

		if (!menuService.getRemovedIngredientsByUser().isEmpty()) {
			menuService.clearRemovedIngredientsByUser();
		}

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
		model.addAttribute("menuItem", menuItem);
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

		for (Integer ingredientID : orderListCreator.getModifiedIngredientIdSet()) {
			if (defaultIngredientIDList.contains(ingredientID)) {

			} else {
				menuService.addToAddedIngredientsByUser(ingredientDAO.getIngredientByID(ingredientID));

				ItemOrdered itemOrdered = new ItemOrdered(orderInfo, itemNumberInt, menuItem, ingredientID, 1);
				orderProcessingImpl.addItemOrderedToList(itemOrdered);
			}
		}
		for (Integer ingredientID : defaultIngredientIDList) {

			if (orderListCreator.getModifiedIngredientIdSet().contains(ingredientID)) {
				// DO NOTHING
				System.out.println("in REMOVED - Do nothing for ingredientID: " + ingredientID);
			} else {
				menuService.addToRemovedIngredientByUser(ingredientDAO.getIngredientByID(ingredientID));
				System.out.println("in REMOVED - add ingredient: " + ingredientID);

				ItemOrdered itemOrdered = new ItemOrdered(orderInfo, itemNumberInt, menuItem, ingredientID, 0);
				orderProcessingImpl.addItemOrderedToList(itemOrdered);
			}
		}
		orderListCreator.clearModifiedIngredientIdSet();

		redirectAttribute.addAttribute("userID", userIdInt);
		redirectAttribute.addAttribute("orderID", orderIDint);

		return "redirect:/backToCart";
	}

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

	@RequestMapping("/processOrder")
	public String processOrder(Model model, @RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "userID") int userID, @RequestParam(name = "itemNumber") int itemNumber,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList, BindingResult bindingResult) {

		menuItemList = orderProcessingImpl.getMenuItemInCart();

		int userIdInt = userID;
		int orderIdInt = orderID;
		int itemNumberInt = itemNumber;

		User user = userDAO.getUserByID(orderIdInt);

		Double subTotalDouble = menuService.getSubTotal(menuItemList);
		Double taxDouble = menuService.getTax(subTotalDouble);

		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		String date = orderInfo.getOrderDate();

		orderInfo.setOrderSubtotal(subTotalDouble);
		orderInfo.setOrderTax(menuService.getTax(subTotalDouble));
		orderInfo.setOrderTotal(menuService.getTotal(subTotalDouble, .06));

		ArrayList<ItemOrdered> itemsOrderedList = orderProcessingImpl.getItemOrderedHolder();
		ArrayList<ItemOrdered> sendItemOrderedList = new ArrayList<>();

		ArrayList<MenuItem> itemsThatHaveBeenOrdered = new ArrayList<>();

		for (ItemOrdered itemOrdered : itemsOrderedList) {
			for (MenuItem menuItem : menuItemList) {
				if (itemOrdered.getItemNumber() == menuItem.getItemNumber()) {
					itemsThatHaveBeenOrdered.add(menuItem);
				}
			}
		}
		for (MenuItem menuItem : itemsThatHaveBeenOrdered) {
			menuItemList.remove(menuItem);
		}

		for (MenuItem menuItem : menuItemList) {
			ItemOrdered nonModifiedItem = new ItemOrdered(orderInfo, menuItem.getItemNumber(), menuItem);
			sendItemOrderedList.add(nonModifiedItem);
		}

		for (ItemOrdered itemOrdered : sendItemOrderedList) {
			System.out.println(itemOrdered + "this is the sendItemOrderedList");
			orderInfo.addItemsOrdered(itemOrdered);
			orderProcessingImpl.processItemsOrdered(itemOrdered);
		}

		for (ItemOrdered itemOrdered : itemsOrderedList) {
			System.out.println(itemOrdered + "this is the itemsOrderedList");

			itemOrdered.getIngredientId();
			orderInfo.addItemsOrdered(itemOrdered);
			orderProcessingImpl.processItemsOrdered(itemOrdered);
		}

		for (ItemOrdered itemOrdered : orderInfo.getItemsOrdered()) {
			System.out.println(itemOrdered);
		}
		System.out.println("orderinfo should be in the DB!");

		model.addAttribute("orderDate", date);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("user", user);
		model.addAttribute("itemNumber", itemNumberInt);
		model.addAttribute("orderInfo", orderInfo);
		model.addAttribute("allItemsOrdered", orderInfo.getItemsOrdered());
		model.addAttribute("ingredientDAO", ingredientDAO);
		model.addAttribute("sendItemOrderedList", sendItemOrderedList);
		model.addAttribute("itemsOrderedList", itemsOrderedList);
		model.addAttribute("subTotal", subTotalDouble);
		model.addAttribute("orderTotalWithTax", menuService.getTotal(subTotalDouble, taxDouble));
		model.addAttribute("orderTax", taxDouble);
		model.addAttribute("menuItemList", menuItemList);
		return "processOrder";
	}

	@RequestMapping("/confirmation")
	public String sendOrderToDatabase(Model model, @RequestParam(name = "orderID") int orderID,
			@RequestParam(name = "userID") int userID, @RequestParam(name = "subTotal") double subTotal,
			@RequestParam(name = "orderTax") double orderTax,
			@RequestParam(name = "orderTotalWithTax") double orderTotal,
			@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList) {
		int userIdInt = userID;
		int orderIdInt = orderID;

		User user = userDAO.getUserByID(userIdInt);
		for (MenuItem menuItem : orderProcessingImpl.getMenuItemInCart()) {
			System.out.println(menuItem);
		}
		Double subTotalDouble = subTotal;
		Double orderTaxDouble = orderTax;
		Double orderTotalDouble = orderTotal;
		OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID);
		String date = orderInfo.getOrderDate();
		orderInfo.setOrderTax(orderTaxDouble);
 		orderInfo.setOrderSubtotal(subTotalDouble);
 		orderInfo.setOrderTotal(orderTotalDouble);

 		restaurantDAO.saveOrder(orderInfo);

		model.addAttribute("randomPickupTime", generateRandom());
		model.addAttribute("user", user);
		model.addAttribute("orderDate", date);
		model.addAttribute("userID", userIdInt);
		model.addAttribute("orderID", orderIdInt);
		model.addAttribute("subTotal", subTotalDouble);
		model.addAttribute("orderTax", orderTaxDouble);
		model.addAttribute("orderTotal", orderTotalDouble);
		model.addAttribute("closeSession", restaurantDAO.closeSession());
		return "confirmation";
	}


	@ModelAttribute
	public int generateRandom() {
		int min = 15;
		int max = 25;
		int randomInt = (int) Math.floor(Math.random() * (max - min + 1) + min);

		return randomInt;
	}

	// ADD THIS TO THE FUNCTION PARAMS WHEN WE ARE ABLE!!!
	@RequestMapping("/filteredIngredientList")
	public String getFilteredIngredientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient,
			BindingResult result) {
		model.addAttribute("ingredients", restaurantDAO.getIngredientsByIngredientCategory("Burger"));
		return "filteredIngredientList";
	}

	@RequestMapping("/fullIngredientList")
	public String getIngerdientList(Model model, @ModelAttribute("ingredient") Ingredient ingredient,
			BindingResult result) {
		model.addAttribute("ingredient", restaurantDAO.getIngredient());
		return "fullIngredientList";
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

}