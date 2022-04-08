package edu.wccnet.ctbriggs.springMVC.controller;

import java.util.ArrayList;
import java.util.List;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.mysql.cj.xdevapi.JsonArray;
import com.mysql.cj.xdevapi.JsonValue;

import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;
import edu.wccnet.ctbriggs.springMVC.domain.ItemSearch;
import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;
import edu.wccnet.ctbriggs.springMVC.domain.OrderSearch;
import edu.wccnet.ctbriggs.springMVC.domain.Stock;
import edu.wccnet.ctbriggs.springMVC.domain.User;
import edu.wccnet.ctbriggs.springMVC.service.IngredientService;
import edu.wccnet.ctbriggs.springMVC.service.MenuService;
import edu.wccnet.ctbriggs.springMVC.service.StockService;
import edu.wccnet.ctbriggs.springMVC.service.UserService;

@Controller
@RequestMapping("/management")
public class MainController {
	@Autowired
	private StockService stockService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private IngredientService ingredientService;
	
	/*
	 * @RequestMapping("/") public String home() { return "home"; }
	 */

	@RequestMapping("/menu")
	public String showForm(Model model) {
		List<MenuItem> menuItems = menuService.getMenu();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("menuItems", menuItems);
		return "menuList";
	}
	
	@RequestMapping("/ingredients")
	public String showIngredients(Model model) {
		List<IngredientItem> ingredientList = ingredientService.getIngredients();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("ingredientList", ingredientList);
		return "ingredientList";
	}
	
	@RequestMapping("/addNewMenuItem")
	public String addNewMenuItem(Model model) {
		model.addAttribute("menuItem", new MenuItem());
		model.addAttribute("ingredientList", ingredientService.getIngredients());
		List<List<IngredientItem> > categorizedIngredients= new ArrayList<List<IngredientItem>>();
		List<String> ingredientCategories = ingredientService.getCategories();
		for(String s : ingredientCategories) {
			categorizedIngredients.add(ingredientService.getIngredients(s));
		}
		model.addAttribute("categories", ingredientCategories);
		model.addAttribute("categorizedIngredients", categorizedIngredients);
		return "addNewMenuItem";
	}
	
	@RequestMapping("/processNewItem")
	public String processNewItem(Model model, @ModelAttribute("menuItem") MenuItem newMenuItem, @RequestParam("ingredientList") ArrayList<Integer> ingredients) {
		System.out.println(newMenuItem);
		System.out.println(ingredients);
		for(Integer i : ingredients) {
			IngredientItem ingredient = ingredientService.getIngredient(i);
			newMenuItem.addIngredient(ingredient);
		}
		menuService.save(newMenuItem);
		System.out.println(newMenuItem);
		return "redirect:/management/menu";
	}
	
	@RequestMapping("/addNewIngredient")
	public ModelAndView addNewIngredient() {
		return new ModelAndView("addNewIngredient", "ingredientItem", new IngredientItem());
	}
	@RequestMapping("/modifyIngredient")
	public String modifyIngredient(Model model, @RequestParam("ingredientId") int id) {
		model.addAttribute("ingredientItem", ingredientService.getIngredient(id));
		return "addNewIngredient";
	}
	
	@RequestMapping("/processIngredient")
	public String processIngredient(Model model, @ModelAttribute("ingredientItem") IngredientItem newIngredient){
		System.out.println(newIngredient);
		ingredientService.add(newIngredient);
		return "redirect:/management/ingredients";
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
	public String stockList(Model model, @RequestParam(name = "type", required = false, defaultValue = "MenuItem") String itemType) {
        model.addAttribute("stock", new Stock());
		if(itemType.equals(IngredientItem.class.getSimpleName())) {	
			 model.addAttribute("stockList", ingredientService.getIngredients());
		}
		else{
			 model.addAttribute("stockList", menuService.getMenu());
		}
       
        
        return "stock";
    }
	
	@RequestMapping("/stockMenu")
    public String stockMenuList(Model model) {
        model.addAttribute("stock", new Stock());
        model.addAttribute("stockList", menuService.getMenu());
        
        return "stock";
    }
	@RequestMapping("/updateStock")
	public String updateStock(Model model, @RequestParam("stockId") int stockId, @RequestParam("stock") String newCount, @RequestParam("type") String itemType){
		int count = Integer.parseInt(newCount);
		System.out.println("StockId: " + stockId);
		System.out.println("New Count:" + newCount);
		System.out.println("ItemType:" + itemType);
		
		//determines whether to call menuService or IngredientService
		if(itemType.equals(IngredientItem.class.getSimpleName())) {	
			System.out.println("this is a ingredient");
			ingredientService.updateStock(stockId, count);
		}
		else if(itemType.equals(MenuItem.class.getSimpleName())){
			System.out.println("this is a menu item");
			menuService.updateStock(stockId, count);
		}
		stockService.updateCount(stockId, count);
		return "redirect:/management/stock?type="+itemType;
	}
	
	@GetMapping("/employees")
	public String employees(Model model) {
		model.addAttribute("employee", new User());
		model.addAttribute("employeeList", userService.getUsers());
		JSONArray json = new JSONArray(userService.getUsers());
		System.out.println(json);
		String jsonStr = json.toString();
		model.addAttribute("dataJson", jsonStr);  
		return "employees";
	}
	
	@PostMapping("/addEmployee")
	public String addEmployee(Model model) {
		User employee = new User();
		model.addAttribute("employee", employee);
		return "addNewEmployee";
	}
	
	@PostMapping("/processEmployee")
	public String processEmployee(
			@ModelAttribute("employee") User employee) {
		System.out.println(employee);
		userService.saveUser(employee);
		return "redirect:/management/employees";
	}
	
	@RequestMapping("/updateEmployee")
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