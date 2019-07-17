package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class Report {
	
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="report_date")
	private Date date;
	
//	@Column(name="user_id")
//	private String userId;
	
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location location;
	
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="profile_id")
	private UserProfile user;
	
	@OneToMany(mappedBy="report")
	private List<CaughtFish> caughtFishList;
	
	
	// M E T H O D S
	
	public void addCaughtFish (CaughtFish caughtFish) {
		if (caughtFishList == null) {
			caughtFishList = new ArrayList<>();
		}
		
		if (!caughtFishList.contains(caughtFish)) {
			caughtFishList.add(caughtFish);
			
			if (caughtFish.getReport() != null) {
				caughtFish.getReport().getCaughtFishList().remove(caughtFish);
			}
			caughtFish.setReport(this);
		}
	}
	
	public void removeCaughtFish (CaughtFish caughtFish) {
		caughtFish.setReport(null);
		if (caughtFishList != null) {
			caughtFishList.remove(caughtFish);
		}
	}
	
	
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

//	public String getUserId() {
//		return userId;
//	}
//
//	public void setUserId(String userId) {
//		this.userId = userId;
//	}

	

	
	@Override
	public String toString() {
		return "Report [id=" + id + ", date=" + date + ", comment=" + comment + ", user=" + user + "]";
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	

	public UserProfile getUser() {
		return user;
	}

	public void setUser(UserProfile user) {
		this.user = user;
	}

	public List<CaughtFish> getCaughtFishList() {
		return caughtFishList;
	}

	public void setCaughtFishList(List<CaughtFish> caughtFishList) {
		this.caughtFishList = caughtFishList;
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

	public Report(int id, Date date, Location location, String comment, UserProfile user,
			List<CaughtFish> caughtFishList) {
		super();
		this.id = id;
		this.date = date;
		this.location = location;
		this.comment = comment;
		this.user = user;
		this.caughtFishList = caughtFishList;
	}

	

	
	
	
	
	
}
