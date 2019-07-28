package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.hibernate.annotations.CreationTimestamp;

@Entity
public class Report {
	
	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Temporal(TemporalType.TIMESTAMP)
	@Column(name="report_date")
	@CreationTimestamp
	private Date date;
	
//	@Column(name="user_id")
//	private String userId;
	
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location location;
	
	private String comment;
	
	@ManyToOne
	@JoinColumn(name="profile_id")
	private UserProfile userProfile;
	
	@OneToMany(mappedBy="report",fetch=FetchType.EAGER)
	private List<CaughtFish> caughtFishList;
	
	private boolean active;
	
	
	// M E T H O D S
	
	public void addCaughtFish (CaughtFish caughtFish) {
		System.err.println("==============================================");
		System.err.println("caught fish top of addCF " + caughtFish);
		if (caughtFishList == null) {
			caughtFishList = new ArrayList<>();
		}
		
		if (!caughtFishList.contains(caughtFish)) {
			caughtFishList.add(caughtFish);
			System.err.println("caught fish after add.CF " + caughtFish);
			if (caughtFish.getReport() != null) {
				caughtFish.getReport().getCaughtFishList().remove(caughtFish);
			}
			caughtFish.setReport(this);
		}
		System.err.println("caught fish list fter add.CF " + caughtFishList);
	}
	
	public void removeCaughtFish (CaughtFish caughtFish) {
		caughtFish.setReport(null);
		if (caughtFishList != null) {
			caughtFishList.remove(caughtFish);
		}
	}
	
	public boolean isActive() {
		return active;
	}

	public void setActive(boolean active) {
		this.active = active;
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
		StringBuilder builder = new StringBuilder();
		builder.append("Report [id=").append(id).append(", date=").append(date).append(", comment=").append(comment).append(", Fish Caught=").append(caughtFishList)
				.append("]");
		return builder.toString();
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

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
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
		this.userProfile = user;
		this.caughtFishList = caughtFishList;
	}	
}
