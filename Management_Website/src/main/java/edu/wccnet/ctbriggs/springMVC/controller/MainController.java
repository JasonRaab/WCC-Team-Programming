package edu.wccnet.ctbriggs.springMVC.controller;

import java.util.ArrayList;

import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelExtensionsKt;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;
import edu.wccnet.ctbriggs.springMVC.domain.ItemSearch;
import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;
import edu.wccnet.ctbriggs.springMVC.domain.OrderSearch;
import edu.wccnet.ctbriggs.springMVC.domain.Stock;

@Controller
public class MainController {
	@RequestMapping("/")
	public String home() {
		return "home";
	}

	@RequestMapping("/menu")
	public ModelAndView showForm() {
		return new ModelAndView("menuList", "itemSearch", new ItemSearch());
	}
	
	@RequestMapping("/ingredients")
	public ModelAndView showIngredients() {
		return new ModelAndView("ingredientList", "itemSearch", new ItemSearch());
	}
	
	@RequestMapping("/addNewMenuItem")
	public ModelAndView addNewMenuItem() {
		return new ModelAndView("addNewMenuItem", "menuItem", new MenuItem());
	}
	@RequestMapping("/addNewIngredient")
	public ModelAndView addNeIngredient() {
		return new ModelAndView("addNewIngredient", "ingredientItem", new IngredientItem());
	}
	
	@RequestMapping("/orders")
	public String orderList(Model model) {
	    OrderSearch a = new OrderSearch();
	    OrderSearch b = new OrderSearch();
	    
	    a.setFname("Michael");
	    a.setLname("Afton");
	    a.setPhone("(313)555-7931");
	    
	    b.setFname("William");
	    b.setLname("Afton");
	    b.setPhone("(734)555-4215");
	    ArrayList<OrderSearch> orderList = new ArrayList<>();
	    orderList.add(a);
	    orderList.add(b);
	    model.addAttribute("orderSearch", new OrderSearch());	//orderSearch is for the searchbar on the page
	    model.addAttribute("orderList", orderList);				//orderList contains the ArrayList of all the orders
	    return "orders";
	}
	
	@RequestMapping("/stock")
    public String stockList(Model model) {
        Stock a = new Stock();
        Stock b = new Stock();
        
        a.setCategory("Cookie");
        a.setItem("Bobby's chocolate supreme");
        a.setStock(14);
        a.setUcAmount(2);
        
        b.setCategory("Burger Ingredient");
        b.setItem("Tomato");
        b.setStock(20);
        b.setUcAmount(2.25);
        
        ArrayList<Stock> stockList = new ArrayList<>();
        stockList.add(a);
        stockList.add(b);
        
        model.addAttribute("stock", new Stock());
        model.addAttribute("stockList", stockList);
        
        return "stock";
    }
	
	//TODO implement employees class
	@RequestMapping("/employees")
	public ModelAndView employees() {
		return new ModelAndView("employees", "orderSearch", new OrderSearch());
	}
	
	@InitBinder
	public void initialBinderForTrimmingSpaces(WebDataBinder webDataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

}
