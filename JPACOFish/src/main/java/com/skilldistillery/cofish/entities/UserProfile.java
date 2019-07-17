package com.skilldistillery.cofish.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class UserProfile {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String city;
	
	private String state;
	
	@Column(name="about_me")
	private String aboutMe;
	
	@Column(name="date_created")
	private LocalDateTime dateCreated;
	
	@Column(name="image_url")
	private String imageUrl;
	
	@ManyToMany
	@JoinTable(name="favorite_location",
		joinColumns = @JoinColumn(name = "user_profile_id"),
		inverseJoinColumns = @JoinColumn(name = "location_id"))
	private List<Location> favoriteLocations;
	
	@OneToMany(mappedBy="userProfileId")
	private List<LocationComment> locationComments;
	
	@OneToMany(mappedBy="user_id_profile")
	private List<Rating> ratings;

	// M E T H O D S
	
	
	
	public int getId() {
		return id;
	}

	public List<Location> getFavoriteLocations() {
		return favoriteLocations;
	}

	public void setFavoriteLocations(List<Location> favoriteLocations) {
		this.favoriteLocations = favoriteLocations;
	}

	public List<LocationComment> getLocationComments() {
		return locationComments;
	}

	public void setLocationComments(List<LocationComment> locationComments) {
		this.locationComments = locationComments;
	}

	public List<Rating> getRatings() {
		return ratings;
	}

	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}

	public void setId(int id) {
		this.id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAboutMe() {
		return aboutMe;
	}

	public void setAboutMe(String aboutMe) {
		this.aboutMe = aboutMe;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
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
		UserProfile other = (UserProfile) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "UserProfile [id=" + id + ", firstName=" + firstName + ", lastName=" + lastName + ", city=" + city
				+ ", state=" + state + ", aboutMe=" + aboutMe + ", dateCreated=" + dateCreated + ", imageUrl="
				+ imageUrl + "]";
	}

	// C T O R S 
	public UserProfile() {
		super();
	}

	public UserProfile(int id, User user, String firstName, String lastName, String city, String state, String aboutMe,
			LocalDateTime dateCreated, String imageUrl) {
		super();
		this.id = id;
		this.user = user;
		this.firstName = firstName;
		this.lastName = lastName;
		this.city = city;
		this.state = state;
		this.aboutMe = aboutMe;
		this.dateCreated = dateCreated;
		this.imageUrl = imageUrl;
	}
	
	
	
	
	
	
}