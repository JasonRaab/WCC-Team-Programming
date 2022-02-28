package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_address")
public class UserAddress {

	//this comes from the user table
	@Id
	@Column(name = "user_id")
	private int userId;

	
	//this comes from the Address table
	@Column(name = "address_id")
	private int addressId;

	// True = 1, False = 0
	@Column(name = "primary")
	private int primary;

	public UserAddress() {

	}

	public UserAddress(int userId, int addressId, int primary) {
		super();
		this.userId = userId;
		this.addressId = addressId;
		this.primary = primary;
	}

	@Override
	public String toString() {
		return "{ UserAddress } \nuserId: " + userId + " \naddressId: " + addressId + ", \nprimary: " + primary;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public int getPrimary() {
		return primary;
	}

	public void setPrimary(int primary) {
		this.primary = primary;
	}

}
