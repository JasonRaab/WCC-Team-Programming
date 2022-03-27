package com.wccnet.goodTimeBobbys.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wccnet.goodTimeBobbys.dao.IIngredientDAO;
import com.wccnet.goodTimeBobbys.dao.IRestaurantDAO;
import com.wccnet.goodTimeBobbys.dao.IUserDAO;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
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
		model.addAttribute("users", userDAO.getUsers());
        return "loginOne";
    }
    
    @RequestMapping("/showUsers")
    public String userHome(Model model, @ModelAttribute("user") User user, @ModelAttribute("lucifer") User alex, @RequestParam(name = "userID", defaultValue = "0") int userID, BindingResult result) {
    	
        model.addAttribute("user", userDAO.getUsers());
        System.out.println("got the user list");
        
        
        model.addAttribute("lucifer", userDAO.getUserByID(1004));
        
        System.out.println("Got Lucifer Address");
        System.out.println("smelly CONTROLLER");
        System.out.println(userID);
        return "showUsers";
    }

    @RequestMapping("/fullIngredientList")
    public String getIngerdientList(Model model, @ModelAttribute("ingredient") Ingredient ingredient,
            BindingResult result) {
        model.addAttribute("ingredient", restaurantDAO.getIngredient());
        System.out.println("in controller.getIngretientList");

        return "fullIngredientList";
    }

    //Get Ingredients by IngredientCategory
    //Used for when a menu item is selected,
    //in the .jsp it will show all available ingredients for that menu item based on its menu item category.
    //we would like to be able to have the ingredients that already exist on that item be checked
    //and the ones that are available for add-on will be unchecked with add-on price displayed.
    //Allowing the user to add items to their menu item
    
    
    //ADD THIS TO THE FUNCTION PARAMS WHEN WE ARE ABLE!!! @RequestParam("ingredientCatagory") String ingredientCategotry,
    @RequestMapping("/filteredIngredientList")
    public String getFilteredIngredientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient, 
            BindingResult result) {
        model.addAttribute("ingredients", restaurantDAO.getIngredientsByIngredientCategory("Burger"));
        //model.addAttribute("ingredientIndex", ingredient.getIngredientId());
        System.out.println("Getting the filtered ingredient list");
        return "filteredIngredientList";
    }

    //Display all Menu items and their ingredients
    @RequestMapping("/menu")
    public String getMenuItems(Model model, @ModelAttribute("menuItems") MenuItem menuItem,
    		@ModelAttribute("ingredientIDs") Ingredient ingredientID, 
    		@RequestParam(name = "userID", defaultValue = "0") int userID, BindingResult bindingResult) {
    	User user = userDAO.getUserByID(userID);
    	model.addAttribute(user);
    	model.addAttribute("menuItem", restaurantDAO.getMenuItems());
        return "menu";
    }
    
    @RequestMapping("/backToMenu")
    public String backToMenu(Model model, @RequestParam(name = "userID") int userID) {
    	int userId = userID;
    	User user = userDAO.getUserByID(userId);

    	model.addAttribute("user", user);
    	model.addAttribute("menuItem", restaurantDAO.getMenuItems());
        return "menu";
    }
    
    
    @RequestMapping("/addMenuItemToCart")
    public String addMenuItemToCart(Model model, @RequestParam(name = "userID") int userID,
    		@RequestParam(name = "menuItemID") int menuItemID) {
 
    	System.out.println(menuItemID);
    	int user = userID;
    	orderListCreator.listCreator(menuItemID);
    	
    	model.addAttribute("userID", user);    	
    	model.addAttribute("itemIdList", orderListCreator.getItemIdList());
    	
		return "redirect:/menu";
    	
    }
    
    @RequestMapping("itemIdList")
    public String itemIdList(Model model,@RequestParam(name = "userID") int userID, @ModelAttribute(name = "menuItemIdList") ArrayList<Integer> menuItemIdList,
    		@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
    		@ModelAttribute(name = "subtotal") String priceTotal, BindingResult bindingResult) {

    	User user = userDAO.getUserByID(userID);
    	
    	for (Integer menuItemId : orderListCreator.getItemIdList()) {
			menuItemList.add(restaurantDAO.getMenuItemByID(menuItemId));
		}
    	
    	model.addAttribute(user);
    	model.addAttribute("menuItemList", menuItemList);
    	model.addAttribute("subtotal", menuService.getSubTotal(menuItemList));
    	
    	return "cart";
    	
    }
    
    @RequestMapping("/checkout")
    public String checkout(Model model, @RequestParam(name = "userID") int userID,
    		@ModelAttribute(name = "menuItemList") ArrayList<MenuItem> menuItemList,
    		@ModelAttribute(name = "ingredients") Ingredient ingredients,
    		@ModelAttribute(name = "subtotal") String priceTotal,
    		BindingResult bindingResult) {
    	User user = userDAO.getUserByID(userID);
    	model.addAttribute(user);
    	model.addAttribute(menuItemList);
    	model.addAttribute("priceTotal", priceTotal);
    	model.addAttribute("ingredients", ingredientDAO.getIngredientListByMenuItemID(8));
    	
    	return "checkout";
    }

    
    @RequestMapping("/customizeOrderedItem")
    public String getIngredientsForSelectedMenuItem(Model model, BindingResult result) {
    	
    	return "customizeOrderedItem";
    }
    
    
    
    
    
}

//	@RequestMapping("userAddress")
//	public String getUserAddress(Model model, @ModelAttribute("address") Address address, BindingResult result) {
//		model.addAttribute("address", restaurantDAO.getUserAddress());		
//		return "userAddress";
//	}
//
