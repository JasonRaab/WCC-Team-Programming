package edu.wccnet.ctbriggs.springMVC.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import edu.wccnet.ctbriggs.springMVC.domain.Address;
import edu.wccnet.ctbriggs.springMVC.domain.IngredientItem;
import edu.wccnet.ctbriggs.springMVC.domain.ItemOrdered;
import edu.wccnet.ctbriggs.springMVC.domain.ItemSearch;
import edu.wccnet.ctbriggs.springMVC.domain.MenuItem;
import edu.wccnet.ctbriggs.springMVC.domain.Order;
import edu.wccnet.ctbriggs.springMVC.domain.Stock;
import edu.wccnet.ctbriggs.springMVC.domain.User;
import edu.wccnet.ctbriggs.springMVC.service.AddressService;
import edu.wccnet.ctbriggs.springMVC.service.IngredientService;
import edu.wccnet.ctbriggs.springMVC.service.ItemOrderedService;
import edu.wccnet.ctbriggs.springMVC.service.MenuService;
import edu.wccnet.ctbriggs.springMVC.service.OrderService;
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
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private ItemOrderedService itemOrderService;
	
	@Autowired
	private AddressService addressService;
	
	/*
	 * @RequestMapping("/") public String home() { return "home"; }
	 */

	@RequestMapping("/menu")
	public String showMenu(Model model) {
		List<MenuItem> menuItems = menuService.getMenu();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("menuItems", menuItems);
		model.addAttribute("menuStatus", "active");
		return "menuList";
	}
	@RequestMapping("/inactiveMenu")
	public String showInactiveMenu(Model model) {
		List<MenuItem> menuItems = menuService.getInactiveMenu();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("menuItems", menuItems);
		model.addAttribute("menuStatus", "inactive");
		return "menuList";
	}

	@RequestMapping("/deactivateMenuItem")
	public String deactivateMenuItem(Model model, @RequestParam("menuId") int id) {
		menuService.deactivate(id);
		return "redirect:/management/menu";
	}
	@RequestMapping("/activateMenuItem")
	public String activateMenuItem(Model model, @RequestParam("menuId") int id) {
		menuService.activate(id);
		return "redirect:/management/inactiveMenu";
	}
	@RequestMapping("/ingredients")
	public String showIngredients(Model model) {
		List<IngredientItem> ingredientList = ingredientService.getIngredients();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("ingredientList", ingredientList);
		model.addAttribute("ingredientStatus", "active");
		return "ingredientList";
	}
	@RequestMapping("/inactiveIngredients")
	public String showInactiveIngredients(Model model) {
		List<IngredientItem> ingredientList = ingredientService.getInactiveIngredients();
		model.addAttribute("itemSearch", new ItemSearch());
		model.addAttribute("ingredientList", ingredientList);
		model.addAttribute("ingredientStatus", "inactive");
		return "ingredientList";
	}
	@RequestMapping("/deactivateIngredient")
	public String deactivateIngredient(Model model, @RequestParam("ingredientId") int id) {
		ingredientService.deactivate(id);
		return "redirect:/management/ingredients";
	}
	@RequestMapping("/activateIngredient")
	public String activateIngredient(Model model, @RequestParam("ingredientId") int id) {
		ingredientService.activate(id);
		return "redirect:/management/inactiveIngredients";
	}
	
	@RequestMapping("/addNewMenuItem")
	public String addNewMenuItem(Model model) {
		model.addAttribute("menuItem", new MenuItem());
		model.addAttribute("currentIngredients", new ArrayList<Integer>());	//this is empty because it is used for modifying and existing menu item
		model.addAttribute("ingredientList", ingredientService.getIngredients());
		//creates a list of lists where each list represents a list of ingredients under one ingredient category
		// ingredient categories is a list of all the different categories of ingredients in the Database
		List<List<IngredientItem> > categorizedIngredients= new ArrayList<List<IngredientItem>>();
		List<String> ingredientCategories = ingredientService.getCategories();
		for(String s : ingredientCategories) {
			categorizedIngredients.add(ingredientService.getIngredients(s));
		}
		model.addAttribute("categories", ingredientCategories);
		model.addAttribute("categorizedIngredients", categorizedIngredients);
		return "addNewMenuItem";
	}
	@RequestMapping("updateMenuItem")
	public String updateMenuItem(Model model, @RequestParam("menuId") int id) {
		model.addAttribute("menuItem", menuService.getMenuItem(id));
		List<Integer> ingredientIds = new ArrayList<Integer>();
		menuService.getMenuItem(id).getIngredients().forEach(ingredient -> ingredientIds.add(ingredient.getId()));
		model.addAttribute("currentIngredients", ingredientIds);	//used to fill out ingredients checkboxes with what's currently on the item
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
		List<IngredientItem> ingredientList = new ArrayList<IngredientItem>();
		for(Integer i : ingredients) {
			ingredientList.add(ingredientService.getIngredient(i));
		}
		newMenuItem.setIngredients(ingredientList);
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

	    List<Order> orderList = orderService.getOrders();
	   
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr;
		try {
			jsonStr = mapper.writer().writeValueAsString(orderList);
			 model.addAttribute("dataJson", jsonStr);	
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	   
	    return "orders";
	}
	
	@RequestMapping("/completeOrder")
	public String completeOrder(@RequestParam("orderId")int id) {
		orderService.completeOrder(id);
		return "redirect:/management/orders";
	}
	
	@RequestMapping("/viewCompletedOrders")
	public String viewCompletedOrders(Model model) {

	    List<Order> orderList = orderService.getCompletedOrders();
	   
		ObjectMapper mapper = new ObjectMapper();
		String jsonStr;
		try {
			jsonStr = mapper.writer().writeValueAsString(orderList);
			 model.addAttribute("dataJson", jsonStr);	
		} catch (JsonProcessingException e) {
			e.printStackTrace();
		}
	   
	    return "orders";
	}
	
	@RequestMapping("/orderDetail")
	public String orderDetails(Model model, @RequestParam("orderId")int id) {
		Order order = orderService.getOrder(id);
		model.addAttribute("order", order);
		List<List<ItemOrdered>> listOfItemsMods = new ArrayList<List<ItemOrdered>>();
		for(Integer i : itemOrderService.getNumberOfItems(id)){
		listOfItemsMods.add(itemOrderService.getModifications(id, i));
		}
		model.addAttribute("itemList", listOfItemsMods);
		
		//map allows jsp to access the ingriedent object by using the ingredient_id
		Map<Integer,IngredientItem> ingredients =new HashMap<Integer,IngredientItem>();
		ingredientService.getIngredients().forEach(eachIngredient -> ingredients.put(eachIngredient.getId(), eachIngredient));
		model.addAttribute("ingredients", ingredients);
		
		return "orderDetail";
	}
	
	@RequestMapping("/stock")
	public String stockList(Model model, @RequestParam(name = "type", required = true, defaultValue = "MenuItem") String itemType) {
        model.addAttribute("stock", new Stock());
        ObjectMapper mapper = new ObjectMapper();
		String jsonStr;
		if(itemType.equals(IngredientItem.class.getSimpleName())) {	
			List<IngredientItem> stockList = ingredientService.getIngredients();
			 model.addAttribute("stockList", stockList);
			 try {
					jsonStr = mapper.writer().writeValueAsString(stockList);
					 model.addAttribute("dataJson", jsonStr);	
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
			 
		}
		else{
			List<MenuItem> stockList = menuService.getMenu();
			 model.addAttribute("stockList", menuService.getMenu());
			 try {
					jsonStr = mapper.writer().writeValueAsString(stockList);
					 model.addAttribute("dataJson", jsonStr);	
				} catch (JsonProcessingException e) {
					e.printStackTrace();
				}
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
		List<User> employees = userService.getEmployees();
		model.addAttribute("employee", new User());
		model.addAttribute("employeeList", employees);
		JSONArray json = new JSONArray(employees);
		System.out.println(json);
		String jsonStr = json.toString();
		model.addAttribute("dataJson", jsonStr);  
		return "employees";
	}
	
	@GetMapping("/previousEmployees")
	public String previousEmployees(Model model) {
		List<User> employees = userService.getPreviousEmployees();
		model.addAttribute("employee", new User());
		model.addAttribute("employeeList", employees);
		JSONArray json = new JSONArray(employees);
		System.out.println(json);
		String jsonStr = json.toString();
		model.addAttribute("dataJson", jsonStr);  
		return "previousEmployees";
	}
	
	@PostMapping("/addEmployee")
	public String addEmployee(Model model) {
		User employee = new User();
		employee.setIsActive(1);
		model.addAttribute("employee", employee);
		return "editEmployee";
	}
	
	@RequestMapping("/processEmployee")
	public String processEmployee(
			@ModelAttribute("employee") User employee) {
		
		List<Address> currentAddresses = userService.getUser(employee.getUserId()).getAddresses();
		
		employee.setAddresses(currentAddresses);
		userService.saveUser(employee);
		return "redirect:/management/employees";
	}
	
	@RequestMapping("/updateEmployee")
	public String updateEmployee(Model model, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		List<Address> addresses = employee.getAddresses();
		List<Address> currentAddresses = new ArrayList<Address>();
		
		for (Address address : addresses) {
			if (address.getIsActive() == 1)
				currentAddresses.add(address);
		}
		
		model.addAttribute("addressList", currentAddresses);
		model.addAttribute("employee", employee);
		return "editEmployee";
	}
	
	@RequestMapping("/activateEmployee")
	public String activateEmployee(Model model, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		employee.setIsActive(1);
		userService.saveUser(employee);
		return "redirect:/management/previousEmployees";
	}
	
	@RequestMapping("/deactivateEmployee")
	public String deactivateEmployee(Model model, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		employee.setIsActive(0);
		userService.saveUser(employee);
		return "redirect:/management/employees";
	}
	
	@RequestMapping("/addAddress")
	public String addAddress(Model model, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		Address address = new Address();
		model.addAttribute("employee", employee);
		model.addAttribute("address", address);
		return "addNewAddress";
	}
	
	@RequestMapping("/processAddress")
	public String processAddress(@ModelAttribute("address") Address address, @RequestParam("employeeID") int id) {
		User employee = userService.getUser(id);
		employee.addAddress(address);
		addressService.saveAddress(address);
		userService.saveUser(employee);
		return "redirect:/management/employees";
	}
	
	@RequestMapping("/removeAddress")
	public String removeAddress(@RequestParam("addressID") int id) {
		Address address = addressService.getAddress(id);
		address.setIsActive(0);
		addressService.saveAddress(address);
		
		return "redirect:/management/employees";
	}
	
	@InitBinder
	public void initialBinderForTrimmingSpaces(WebDataBinder webDataBinder) {
		StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
		webDataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
	}

}
