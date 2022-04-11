package com.wccnet.goodTimeBobbys.dao;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.transaction.Transactional;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.wccnet.goodTimeBobbys.entity.ItemOrdered;
import com.wccnet.goodTimeBobbys.entity.OrderInfo;

@Repository
public class OrderProcessingImpl {

	@Autowired
	private SessionFactory sessionFactory;

	@Transactional
	public void addItemOrderedToDatabase(ItemOrdered itemOrdered) {

		Session session = sessionFactory.getCurrentSession();

		if (itemOrdered != null) {
			session.persist(itemOrdered);
		} else {
			System.out.println("Hey DINGUS your ItemOrdered is NULL!!!");
		}

	}

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

}
