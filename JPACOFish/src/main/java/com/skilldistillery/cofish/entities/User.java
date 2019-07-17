package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.validation.constraints.Email;

@Entity
public class User {

	// F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "username")
	private String userName;
	
	private String password;
	
	@Email
	private String email;
	
	private String role;
	
	private boolean active;
	
	@OneToOne(mappedBy="user")
	private UserProfile userProfile;
	
	
	// M E T H O D S
	
	
	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public int getId() {
		return id;
	}
	
	public void setId(int id) {
		this.id = id;
	}
	
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public boolean isActive() {
		return active;
	}
	
	public void setActive(boolean active) {
		this.active = active;
	}
	
	
	@Override
	public String toString() {
		return "User [id=" + id + ", userName=" + userName + ", password=" + password + ", email=" + email + ", role="
				+ role + ", active=" + active + ", userProfile=" + userProfile + "]";
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + id;
		return result;
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		User other = (User) obj;
		if (id != other.id)
			return false;
		return true;
	}

	// C T O R S
	public User() {
		super();
	}

	public User(int id, String userName, String password, @Email String email, String role, boolean active) {
		super();
		this.id = id;
		this.userName = userName;
		this.password = password;
		this.email = email;
		this.role = role;
		this.active = active;
	}

	
	
}
