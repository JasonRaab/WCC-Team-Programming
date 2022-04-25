package edu.wccnet.goodTimeBobbys.management.service;

import java.util.List;

import edu.wccnet.goodTimeBobbys.management.entity.Address;

public interface AddressService {
	public Address getAddress(int id);
	public void saveAddress(Address address);
}
