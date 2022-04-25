package edu.wccnet.goodTimeBobbys.management.dao;

import edu.wccnet.goodTimeBobbys.management.entity.Address;

public interface AddressDAO {
	public Address getAddress(int id);
	public void saveAddress(Address address);
}
