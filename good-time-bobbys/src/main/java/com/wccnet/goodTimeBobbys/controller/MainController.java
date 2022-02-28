package com.wccnet.goodTimeBobbys.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.wccnet.goodTimeBobbys.dao.IRestaurantDAO;
import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.User;

@Controller
@RequestMapping("/")
public class MainController {
	
	@Autowired
	private IRestaurantDAO restaurantDAO;
	
	@RequestMapping("/")
	public String home(Model model, @ModelAttribute("user") User user, BindingResult result) {
		model.addAttribute("user", restaurantDAO.getUsers());
		System.out.println("smelly CONTROLLER");
		return "showUsers";
	}
	
	@RequestMapping("fullIngredientList")
	public String getIngerdientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient, BindingResult result) {
		model.addAttribute("ingredient", restaurantDAO.getIngredient());
		System.out.println("in controller.getIngretientList");
		
		return "fullIngredientList";
	}
	
	@RequestMapping("filteredIngredientList")
	public String getFilteredIngredientList(Model model, @ModelAttribute("ingredients") Ingredient ingredient, BindingResult result) {
		model.addAttribute("ingredient", restaurantDAO.getMenuItemIngredients());
		System.out.println("Getting the filtered ingredient list");
		return "filteredIngredientList";
	}
}
