package edu.wccnet.ctbriggs.springMVC.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelExtensionsKt;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;
import edu.wccnet.ctbriggs.springMVC.domain.ItemSearch;
import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;
import edu.wccnet.ctbriggs.springMVC.domain.OrderSearch;
import edu.wccnet.ctbriggs.springMVC.domain.Stock;
import edu.wccnet.ctbriggs.springMVC.domain.User;
import edu.wccnet.ctbriggs.springMVC.service.StockService;
import edu.wccnet.ctbriggs.springMVC.service.UserService;

@Controller
public class MainController {
	@Autowired
	private StockService stockService;
	
	@Autowired
	private UserService userService;
	
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
        model.addAttribute("stock", new Stock());
        model.addAttribute("stockList", stockService.getStocks());
        
        return "stock";
    }
	
	@RequestMapping("/employees")
	public String employees(Model model) {
		model.addAttribute("employee", new User());
		model.addAttribute("employeeList", userService.getUsers());
		return "employees";
	}
	
	@RequestMapping("updateEmployee")
	public String updateEmployee(Model model, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		model.addAttribute("employee", employee);
		return "editEmployee";
	}
	
	@InitBinder
	public void initialBinderForTrimmingSpaces(WebDataBinder webDataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

}
