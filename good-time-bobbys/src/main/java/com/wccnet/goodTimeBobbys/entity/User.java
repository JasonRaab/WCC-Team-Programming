package com.wccnet.goodTimeBobbys.entity;

import java.sql.Timestamp;
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
@Table(name = "user")
public class User {

    // This goes to the order info table (one user to many orderInfo) 
	// the user address table (one user to many addresses)
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int userId;

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    @Column(name = "email")
    private String email;

    @Column(name = "password")
    private String password;

    @Column(name = "create_time")
    private Timestamp create_time;

    // This links to the user role table 
    // one role for many users
    @Column(name = "role")
    private int userRole;

    @ManyToMany(fetch = FetchType.EAGER)
    @JoinTable(
            name = "user_address",
            joinColumns = { @JoinColumn(name = "user_id") },
            inverseJoinColumns = {@JoinColumn(name = "address_id")}
            )
            List<Address> addresses = new ArrayList<Address>();
    
    @Override
    public String toString() {
        return "{ User Table } " + "\nUser ID: " + userId + "\nFirst Name:" + firstName + "\nLast Name: " + lastName
                + "\nEmail:" + email + "\nPassword: " + password + "\nUser Role ID: " + userRole;
    }

    public User() {
        this.userRole = 3; // The RoleId is hard coded to auto designate new users as Customers
    }

    /**
     * @param firstName
     * @param lastName
     * @param email
     * @param password
     * @param create_time
     * @param userRoleId
     */
    public User(String firstName, String lastName, String email, String password, Timestamp create_time,
            int userRoleId) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.create_time = create_time;
        this.userRole = 3; // The RoleId is hard coded to auto designate new users as Customers
    }

    /**
     * @param email
     * @param password
     */
    public User(String email, String password) {
        super();
        this.email = email;
        this.password = password;
        this.userRole = 3; // The RoleId is hard coded to auto designate new users as Customers
    }

  
    public User(String firstName, String lastName, String email) {
        super();
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.userRole = 3; // The RoleId is hard coded to auto designate new users as Customers
    }
    

    public void addAddress(Address address) {
        addresses.add(address);
    }

    //set isActive to 0
    public void removeAddress(Address address) {
        //This will need to be changed to isActive = 0 in the database
        addresses.remove(address);
    }
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public Timestamp getCreate_time() {
        return create_time;
    }

    public void setCreate_time(Timestamp create_time) {
        this.create_time = create_time;
    }

    public int getUserRole() {
        return userRole;
    }

    public void setUserRole(int userRoleId) {
        this.userRole = userRoleId;
    }

	public List<Address> getAddresses() {
		return addresses;
	}

	public void setAddresses(List<Address> addresses) {
		this.addresses = addresses;
	}

    

}