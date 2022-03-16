package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_address")
public class UserAddress {
	
//	/*
//	 * To create a UserAddress Object/Record:
//
//		Login -> not current customer? then create user with FName LName EMail Password -> then prompt user to enter Address Info -->
//
//		Then you have a User ID and an Address ID to allow you to create a UserAddress object/record
//	 */
//	
//	//One User to Many Addresses
	@Id
	@Column(name = "user_id")
	private int userId;

	//One Address to many Users
	@Column(name = "address_id")
	private int addressId;

	//True = 1, False = 0
	@Column(name = "primary")
	private int primaryAddress;
	
	public UserAddress() {
		
	}

	public UserAddress(int userId, int addressId, int primary) {
		super();
		this.userId = userId;
		this.addressId = addressId;
		this.primaryAddress = primary;
	}

	@Override
	public String toString() {
		return "{ UserAddress } \nUser ID: " + userId + " \nAddress ID: " + addressId + ", \nPrimary: " + primaryAddress;
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
		return primaryAddress;
	}

	public void setPrimary(int primaryAddress) {
		this.primaryAddress = primaryAddress;
	}

}
