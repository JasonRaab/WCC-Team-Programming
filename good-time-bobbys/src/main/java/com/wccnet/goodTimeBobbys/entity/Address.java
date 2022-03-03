package com.wccnet.goodTimeBobbys.entity;

import java.util.ArrayList;
import java.util.List;

<<<<<<< HEAD
import javax.persistence.CascadeType;
=======
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
import javax.persistence.Column;
import javax.persistence.Entity;
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

<<<<<<< HEAD
	// To user table @OneToMany AddressId -> User Address Table
=======
	// to use table @manyToOne Address id -> user table
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "address_id")
	private int addressId;

	@Column(name = "street_address")
<<<<<<< HEAD
	private String streetAddress;
=======
	private String street_address;
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e

	@Column(name = "city")
	private String city;

	@Column(name = "state")
	private String state;

	@Column(name = "zip")
	private String zip;

	@ManyToMany
<<<<<<< HEAD
	@JoinTable(name = "user_address", joinColumns = @JoinColumn(name = "address_id"), inverseJoinColumns = @JoinColumn(name = "user_id"))
	private List<User> users = new ArrayList<User>();
	
	public void addUser(User user) {
		users.add(user);
	}
	
	//set isActive to 0
	public void removeUser(User user) {
		//Update this method to change the isActive column in the DB to 0 from 1
		users.remove(user);
	}
=======
	@JoinTable(
			name = "user_address", 
			joinColumns = @JoinColumn(name = "address_id"), 
			inverseJoinColumns = @JoinColumn(name = "user_id")
			)
			private List<User> users = new ArrayList<User>();
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e

	public Address() {

	}

<<<<<<< HEAD
	public Address(String streetAddress, String city, String state, String zip) {
		super();
		this.streetAddress = streetAddress;
=======
	public Address(String street_address, String city, String state, String zip) {
		super();
		this.street_address = street_address;
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
		this.city = city;
		this.state = state;
		this.zip = zip;
	}

<<<<<<< HEAD
	@Override
	public String toString() {
		return "{ Address Table } \nAddress ID: " + addressId + "\nUser ID: " + "\nStreet Address: " + streetAddress
				+ "\nCity: " + city + "\nState: " + state;
=======
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
		return "{ Address Table }\naddress id: " + addressId + "\nstreet address: " + street_address + "\ncity: " + city
				+ "\nstate: " + state + "\nstate: " + state;
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
	}

	public int getAddressId() {
		return addressId;
	}

	public void setAddressId(int addressId) {
		this.addressId = addressId;
	}

<<<<<<< HEAD
	public String getStreetAddress() {
		return streetAddress;
	}

	public void setStreetAddress(String streetAddress) {
		this.streetAddress = streetAddress;
=======
	public String getStreet_address() {
		return street_address;
	}

	public void setStreet_address(String street_address) {
		this.street_address = street_address;
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
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
