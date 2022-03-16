package com.wccnet.goodTimeBobbys.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wccnet.goodTimeBobbys.dao.IRestaurantDAO;
import com.wccnet.goodTimeBobbys.dao.UserDAO;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.User;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private IRestaurantDAO restaurantDAO;
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/")
	public String loginOne(Model model) {
		return "loginOne";
	}
	
	@RequestMapping("/showUsers")
	public String userHome(Model model, @ModelAttribute("user") User user, @ModelAttribute("lucifer") User alex, BindingResult result) {
		model.addAttribute("user", userDAO.getUsers());
		model.addAttribute("lucifer", userDAO.getUserByID(1004));
	
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

	@RequestMapping("/filteredIngredientList")
	public String getFilteredIngredientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient,
			BindingResult result) {
		model.addAttribute("ingredient", restaurantDAO.getMenuItemIngredients());
		System.out.println("Getting the filtered ingredient list");
		return "filteredIngredientList";
	}

	@RequestMapping("/menuItemList")
	public String getMenuItems(Model model, @ModelAttribute("menuItems") MenuItem menuItem, BindingResult bindingResult) {
		model.addAttribute("menuItem", restaurantDAO.getMenuItems());
		model.addAttribute("ingredients", menuItem.getIngredients());
		
		
		
		System.out.println("in controller menu item list right before foreach");
		for (Ingredient ingredient : menuItem.getIngredients()) {
			System.out.println("\n" + ingredient);
		}
		
		System.out.println("right after foreach");
		return "menuItemList";
	}
	
}
