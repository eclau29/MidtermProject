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
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

@Entity
public class LocationComment {

	// F I E L D S

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@ManyToOne
	@JoinColumn(name = "user_profile_id")
	private UserProfile userProfileId;

	@ManyToOne
	@JoinColumn(name = "location_id")
	private Location location;

	@Column(name = "comment_text")
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

	public UserProfile getUserProfileId() {
		return userProfileId;
	}

	public void setUserProfileId(UserProfile userProfileId) {
		this.userProfileId = userProfileId;
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

<<<<<<< HEAD
	public LocationComment(int id, UserProfile userProfileId, Location location, LocalDateTime commentDate,
=======
	

	public LocationComment(int id, UserProfile userProfileId, Location location, Date commentDate,
>>>>>>> 224461466d92a7f09876e2bc136c57da612194c3
			String commentText) {
		super();
		this.id = id;
		this.userProfileId = userProfileId;
		this.location = location;
		this.commentDate = commentDate;
		this.commentText = commentText;
	}

	public LocationComment() {
		super();
	}

}
