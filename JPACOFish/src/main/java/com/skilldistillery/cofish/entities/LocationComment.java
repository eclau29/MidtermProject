package com.skilldistillery.cofish.entities;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
@Table(name = "location_comment")
public class LocationComment {

	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_profile_id")
	private UserProfile userProfile;

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@Column(name = "comment_date")
	@Temporal(TemporalType.TIMESTAMP)
	private Date commentDate;
	
	@Column(name="comment_text")
	private String commentText;

	// M E T H O D S

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public UserProfile getUserProfile() {
		return userProfile;
	}

	public void setUserProfileId(UserProfile userProfile) {
		this.userProfile = userProfile;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public Date getCommentDate() {
		return commentDate;
	}

	public void Date(Date commentDate) {
		this.commentDate = commentDate;
	}

	public String getCommentText() {
		return commentText;
	}

	public void setCommentText(String commentText) {
		this.commentText = commentText;
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
		LocationComment other = (LocationComment) obj;
		if (id != other.id)
			return false;
		return true;
	}


	public LocationComment(int id, UserProfile userProfile, Location location, Date commentDate,
			String commentText) {
		super();
		this.id = id;
		this.userProfile = userProfile;
		this.location = location;
		this.commentDate = commentDate;
		this.commentText = commentText;
	}

	public LocationComment() {
		super();
	}

}
