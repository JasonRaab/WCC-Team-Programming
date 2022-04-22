package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.ctbriggs.springMVC.dao.AddressDAO;
import edu.wccnet.ctbriggs.springMVC.domain.Address;

@Service
public class AddressServiceImpl implements AddressService {
	
	@Autowired
	private AddressDAO addressDAO;
	
	@Override
	@Transactional
	public Address getAddress(int id) {
		return addressDAO.getAddress(id);
	}
	
	@Override
	@Transactional
	public void saveAddress(Address address) {
		addressDAO.saveAddress(address);
	}
}
