package com.skilldistillery.cofish.entities;

import java.io.Serializable;

import javax.persistence.Id;

public class RatingId implements Serializable {
	
	//fields
    private static final long serialVersionUID = 1L;
    private int userProfileId;
    private int locationId;
    
    //methods
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
	public static long getSerialversionuid() {
		return serialVersionUID;
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
		RatingId other = (RatingId) obj;
		if (locationId != other.locationId)
			return false;
		if (userProfileId != other.userProfileId)
			return false;
		return true;
	}
	public RatingId() {
		super();
	}
	public RatingId(int userProfileId, int locationId) {
		super();
		this.userProfileId = userProfileId;
		this.locationId = locationId;
	}
    
    

}
