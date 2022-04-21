package edu.wccnet.ctbriggs.springMVC.service;

import java.util.List;

import edu.wccnet.ctbriggs.springMVC.domain.Address;

public interface AddressService {
	public Address getAddress(int id);
	public void saveAddress(Address address);
}
