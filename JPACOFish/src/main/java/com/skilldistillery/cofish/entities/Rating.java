package com.skilldistillery.cofish.entities;

import java.time.LocalDateTime;

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
	@Column(name="user_profile_id")
	private int userProfileId;
	
	@Id
	@Column(name="location_id")
	private int locationId;
	
	private LocalDateTime date;
	
	private int rating; // rated 1-5 fish! :D
	
	@ManyToOne
	@JoinColumn(name="user_profile_id")
	private UserProfile userProfile;
	
	@ManyToOne
	@JoinColumn(name="location_id")
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

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
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

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + locationId;
		result = prime * result + userProfileId;
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
		Rating other = (Rating) obj;
		if (locationId != other.locationId)
			return false;
		if (userProfileId != other.userProfileId)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "Rating [userProfileId=" + userProfileId + ", locationId=" + locationId + ", date=" + date + "]";
	}
	
	// C T O R S
	
	public Rating() {
		super();
	}
	
	public Rating(int userProfileId, int locationId, LocalDateTime date, int rating, UserProfile userProfile,
			Location location) {
		super();
		this.userProfileId = userProfileId;
		this.locationId = locationId;
		this.date = date;
		this.rating = rating;
		this.userProfile = userProfile;
		this.location = location;
	}
	

}
