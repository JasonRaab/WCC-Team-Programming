package com.wccnet.goodTimeBobbys.dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.wccnet.goodTimeBobbys.entity.Ingredient;
import com.wccnet.goodTimeBobbys.entity.ItemOrdered;
import com.wccnet.goodTimeBobbys.entity.MenuItem;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;

@Repository
public class OrderProcessingImpl {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Autowired
	private IIngredientDAO ingredientDAO;

	ArrayList<MenuItem> menuItemInCart = new ArrayList<>();
	int nextItemNumber = 1;

	public void addMenuItemInCart(MenuItem menuItem) {

		menuItem.setItemNumber(nextItemNumber);
		menuItemInCart.add(menuItem);
		nextItemNumber++;

	}

	public ArrayList<MenuItem> getMenuItemInCart() {
		return menuItemInCart;
	}

	public void setMenuItemInCart(ArrayList<MenuItem> menuItemInCart) {
		this.menuItemInCart = menuItemInCart;
	}

	ArrayList<ItemOrdered> itemOrderedHolder = new ArrayList<ItemOrdered>();
	

	public Ingredient getIngredientInfo(int ingredientID) {
		Ingredient ingredient = ingredientDAO.getIngredientByID(ingredientID);
		
		return ingredient;
	}

	public void addItemOrderedToList(ItemOrdered itemOrdered) {
		if (itemOrdered != null) {
			itemOrderedHolder.add(itemOrdered);
		} else {
			System.out.println("Hey DINGUS your ItemOrdered is NULL!!!");
		}
	}


	public ArrayList<ItemOrdered> getItemOrderedHolder() {
		return itemOrderedHolder;
	}
	
	public void setItemOrderedHolder(ArrayList<ItemOrdered> itemOrderedHolder) {
		this.itemOrderedHolder = itemOrderedHolder;
	}

	@Transactional
	public void processItemsOrdered(ArrayList<ItemOrdered> itemOrderedArrayList) {
		Session session = sessionFactory.getCurrentSession();
		for (ItemOrdered itemOrdered : itemOrderedArrayList) {
			//ItemOrdered sendToDataBase = new ItemOrdered();
			System.out.println("in the forloop to send the items" + itemOrdered);
//			sendToDataBase.setOrderInfo(itemOrdered.getOrderInfo());
//			 sendToDataBase.setItemNumber(itemOrdered.getItemNumber());
//			 sendToDataBase.setMenuItem(itemOrdered.getMenuItem());
//			 sendToDataBase.setIngredientId(itemOrdered.getIngredientId());
//			 sendToDataBase.setModification( itemOrdered.getModification());
			session.merge(itemOrdered);
			
		}
//		session.close();
	}
	@Transactional
	public void processItemsOrdered(ItemOrdered itemOrdered) {
		Session session = sessionFactory.getCurrentSession();
		
	//	Integer ingredientID = itemOrdered.getIngredientId();
		
		session.save(itemOrdered);
		
	}

	// This happens upon User Log-in
	@Transactional
	public void createOrderInfo(int orderID, int userID) {
		Session session = sessionFactory.getCurrentSession();

		Date now = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String currentTime = sdf.format(now);

		OrderInfo orderInfoObject = session.get(OrderInfo.class, orderID);

		if (orderInfoObject.getOrderDate() == null) {
			orderInfoObject.setUserId(userID);
			orderInfoObject.setOrderDate(currentTime);
			orderInfoObject.setIsOpen(1);
			orderInfoObject.setOrderType("pickup");
			session.saveOrUpdate(orderInfoObject);
		}
	}
	
	@Transactional
	public void getAllOrderInformation(int orderID) {
		Session session = sessionFactory.getCurrentSession();
		OrderInfo orderInfoObject = session.get(OrderInfo.class, orderID);
		
	}
	
}