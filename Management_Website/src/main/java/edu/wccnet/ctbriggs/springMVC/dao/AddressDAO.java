package edu.wccnet.ctbriggs.springMVC.dao;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.Address;

public interface AddressDAO {
	public Address getAddress(int id);
	public void saveAddress(Address address);
}
