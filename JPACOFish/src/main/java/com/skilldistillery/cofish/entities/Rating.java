package com.skilldistillery.cofish.entities;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@Entity
@IdClass(value=RatingId.class)
public class Rating {
	
	// F I E L D S 
	@Id
	@Column(name="user_profile_id", nullable=false)
	private int userProfileId;
	
	@Id
	@Column(name="location_id", nullable=false)
	private int locationId;
	
	@Column(name="rating_date")
	private Date date;
	
	private int rating; // rated 1-5 fish! :D
	
	@ManyToOne
	@JoinColumn(name="user_profile_id", insertable=false, updatable=false)
	private UserProfile userProfile;
	
	@ManyToOne
	@JoinColumn(name="location_id", insertable=false, updatable=false)
	private Location location;
	
	// M E T H O D S

	public int getUserProfileId() {
		return userProfileId;
	}

	public void setUserProfileId(int userProfileId) {
		this.userProfileId = userProfileId;
	}

	public int getLocationId() {
		return locationId;
	}

	public void setLocationId(int locationId) {
		this.locationId = locationId;
	}

	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfile(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	

	
	
	
	
	// C T O R S
	public Rating() {
		super();
	}

	public Rating(int userProfileId, Date date, int rating, UserProfile userProfile, Location location) {
		super();
		this.userProfileId = userProfileId;
		this.date = date;
		this.rating = rating;
		this.userProfile = userProfile;
		this.location = location;
	}
	
	
	

}
