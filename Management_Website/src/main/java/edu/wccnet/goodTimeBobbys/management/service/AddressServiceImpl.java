package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import edu.wccnet.goodTimeBobbys.management.dao.AddressDAO;
import edu.wccnet.goodTimeBobbys.management.entity.Address;

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
