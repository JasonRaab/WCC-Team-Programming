package com.wccnet.goodTimeBobbys.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
<<<<<<< HEAD
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

//@Entity
//@Table(name = "user_role")
public class UserRole {
//
//	//One Role to Many Users
//	@Id
//	@Column(name = "role_id")
//	@GeneratedValue(strategy = GenerationType.IDENTITY)
//	private int roleId;
//
//	@Column(name = "role_name")
//	private String roleName;
//
//	@Column(name = "role_description")
//	private String roleDescription;
//
//	public UserRole() {
//
//	}
//
//	public UserRole(String roleName) {
//		super();
//		this.roleName = roleName;
//	}
//
//	public UserRole(String roleName, String roleDescription) {
//		super();
//		this.roleName = roleName;
//		this.roleDescription = roleDescription;
//	}
//
//	public UserRole(int roleId, String roleName, String roleDescription) {
//		super();
//		this.roleId = roleId;
//		this.roleName = roleName;
//		this.roleDescription = roleDescription;
//	}
//
//	public int getRoleId() {
//		return roleId;
//	}
//
//	public void setRoleId(int roleId) {
//		this.roleId = roleId;
//	}
//
//	public String getRoleName() {
//		return roleName;
//	}
//
//	public void setRoleName(String roleName) {
//		this.roleName = roleName;
//	}
//
//	public String getRoleDescription() {
//		return roleDescription;
//	}
//
//	public void setRoleDescription(String roleDescription) {
//		this.roleDescription = roleDescription;
//	}
//
//	@Override
//	public String toString() {
//		return "{ User Role Table } \nRole ID: " + roleId + "\nRole Name: " + roleName + " \nRole Description: "
//				+ roleDescription;
//	}
//
//	private String userNameCheck(int roleId, String roleName) {
//		userNameCheck(this.roleId, this.roleName);
//		return "";
//	}
=======
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "user_role")
public class UserRole {

	@Id
	@Column(name = "role_id")
	private int roleId;

	@Column(name = "role_name")
	private String roleName;

	@Column(name = "role_description")
	private String roleDescription;

	@Override
	public String toString() {
		return "{ UserRole table }\n roleId: " + roleId + "\nrole name: " + roleName + "\nrole description: "
				+ roleDescription;
	}

	public UserRole(int roleId, String roleName, String roleDescription) {
		super();
		this.roleId = roleId;
		this.roleName = roleName;
		this.roleDescription = roleDescription;
	}

	public UserRole(String roleName, String roleDescription) {
		super();
		this.roleName = roleName;
		this.roleDescription = roleDescription;
	}

	public UserRole(String roleName) {
		super();
		this.roleName = roleName;
	}

	public int getRoleId() {
		return roleId;
	}

	public void setRoleId(int roleId) {
		this.roleId = roleId;
	}

	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getRoleDescription() {
		return roleDescription;
	}

	public void setRoleDescription(String roleDescription) {
		this.roleDescription = roleDescription;
	}
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e

}
