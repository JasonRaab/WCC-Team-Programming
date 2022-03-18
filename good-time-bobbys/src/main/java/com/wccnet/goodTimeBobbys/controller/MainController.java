package com.wccnet.goodTimeBobbys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.wccnet.goodTimeBobbys.dao.IRestaurantDAO;
import com.wccnet.goodTimeBobbys.dao.IUserDAO;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private IRestaurantDAO restaurantDAO;

	@Autowired
	private IUserDAO userDAO;

	@RequestMapping("/")
    public String loginOne(Model model) {
        return "loginOne";
    }
    
    @RequestMapping("/showUsers")
    public String userHome(Model model, @ModelAttribute("user") User user, @ModelAttribute("lucifer") User alex, BindingResult result) {
    	
        model.addAttribute("user", userDAO.getUsers());
        System.out.println("got the user list");
        
        model.addAttribute("lucifer", userDAO.getUserByID(1004));
        
        System.out.println("Got Lucifer Address");
        System.out.println("smelly CONTROLLER");
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
    		@ModelAttribute("rowIndex") Ingredient rowIndex,
            BindingResult result) {
        model.addAttribute("ingredients", restaurantDAO.getIngredientsByIngredientCategory("Burger"));
        //model.addAttribute("ingredientIndex", ingredient.getIngredientId());
        System.out.println("Getting the filtered ingredient list");
        return "filteredIngredientList";
    }

    //Display all Menu items and their ingredients
    @RequestMapping("/menu")
    public String getMenuItems(Model model, @ModelAttribute("menuItems") MenuItem menuItem, @ModelAttribute("itemIngredients") MenuItem itemIngredients, BindingResult bindingResult) {
        
    	//display all menu items
    	//display each items ingredients
    	
    	model.addAttribute("menuItem", restaurantDAO.getMenuItems());
        //model.addAttribute("ingredients", menuItem.getIngredients());
//        model.addAttribute("ingredients", restaurantDAO.getIngredients());
        model.addAttribute("ingredients", restaurantDAO.getMenuItemIngredientsByMenuItemID(7));
        
        System.out.println("in controller menu item list right before foreach");
        for (Ingredient ingredient : menuItem.getIngredients()) {
            System.out.println("\n" + ingredient);
        }
        
        System.out.println("right after foreach");
        return "menu";
    }
}

//	@RequestMapping("userAddress")
//	public String getUserAddress(Model model, @ModelAttribute("address") Address address, BindingResult result) {
//		model.addAttribute("address", restaurantDAO.getUserAddress());		
//		return "userAddress";
//	}
//