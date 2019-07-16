package com.skilldistillery.cofish.entities;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.ws.soap.MTOM;

@Entity
public class Report {
	
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Temporal(TemporalType.TIMESTAMP)
	private LocalDateTime date;
	
	@Column(name="user_id")
	private String userId;
	
	@Column(name="location_id")
	private String locationId;
	
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;


	// M E T H O D S
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public LocalDateTime getDate() {
		return date;
	}
	public void setDate(LocalDateTime date) {
		this.date = date;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getLocationId() {
		return locationId;
	}
	public void setLocationId(String locationId) {
		this.locationId = locationId;
	}
	public String getComment() {
		return comment;
	}
	public void setComment(String comment) {
		this.comment = comment;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	
	@Override
	public String toString() {
		return "Report [id=" + id + ", date=" + date + ", userId=" + userId + ", locationId=" + locationId
				+ ", comment=" + comment + "]";
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
		Report other = (Report) obj;
		if (id != other.id)
			return false;
		return true;
	}
	// C T O R S
	public Report() {
		super();
	}
	
	public Report(int id, LocalDateTime date, String userId, String locationId, String comment, User user) {
		super();
		this.id = id;
		this.date = date;
		this.userId = userId;
		this.locationId = locationId;
		this.comment = comment;
		this.user = user;
	}
	
	
}
