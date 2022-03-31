package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import edu.wccnet.ctbriggs.springMVC.domain.Stock;


@Repository
public class StockDAOImpl implements StockDAO {
	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<Stock> getStocks() {
		Session session = sessionFactory.getCurrentSession();
		Query<Stock> query = session.createQuery("from Stock order by category, item", Stock.class);
		return query.getResultList();
	}

	@Override
	public void updateCount(int stockId, int count) {
		Session session = sessionFactory.getCurrentSession();
		Stock stock = session.get(Stock.class, stockId);
		stock.setStock(count);
		session.saveOrUpdate(stock);
	}

}
