package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "address")
public class Address {

	// to use table @manyToOne Address id -> user table
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "address_id")
	private int addressId;

	@Column(name = "street_address")
	private String streetAddress;

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "zip")
	private String zip;

	@ManyToMany(fetch = FetchType.EAGER)
	@JoinTable(
			name = "user_address", 
			joinColumns = @JoinColumn(name = "address_id"), 
			inverseJoinColumns = @JoinColumn(name = "user_id")
			)
			private List<User> users = new ArrayList<User>();

	public Address() {

	}

	public Address(String street_address, String city, String state, String zip) {
		super();
		this.streetAddress = street_address;
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

	public void addUser(User user) {
		users.add(user);
	}

	// set isActive to 0
	public void removeUser(User user) {
		// Update this method to change the isActive column in the DB to 0 from 1
		users.remove(user);
	}

	@Override
	public String toString() {
		return "{ Address Table }\naddress id: " + addressId + "\nstreet address: " + streetAddress + "\ncity: " + city
				+ "\nstate: " + state + "\nstate: " + state;
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

	public String getStreet_address() {
		return streetAddress;
	}

	public void setStreet_address(String street_address) {
		this.streetAddress = street_address;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getZip() {
		return zip;
	}

	public void setZip(String zip) {
		this.zip = zip;
	}

}
