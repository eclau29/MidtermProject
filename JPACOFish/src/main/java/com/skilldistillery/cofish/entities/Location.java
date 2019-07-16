package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Location {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@OneToOne
	@JoinColumn(name="accessibilty_id")
	private Accessability access;
	
	private double latitude;
	
	private double longitude;
	
	private String name;
	
	@Column(name="water_body")
	private String waterBody;
	
	private String area;
	
	@Column(name="fishing_notes")
	private String fishingNotes;
	
	private String discription;
	
	@Column(name="map_url")
	private String mapUrl;
 	
	@Column(name="image_url")
	private String imageUrl;
	
	@OneToMany(mappedBy="location")
	private List<Report> reports;	

	@OneToMany(mappedBy="location")
	private List<Rating> ratings;
	
	@OneToMany(mappedBy="location")
	private List<LocationComment> locationComments;
	
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

	public List<Report> getReports() {
		return reports;
	}

	public void setReports(List<Report> reports) {
		this.reports = reports;
	}
	
	public void addLocationComment(LocationComment locationComment) {
		if(locationComments == null ) { locationComments = new ArrayList<>(); }
		if(!locationComments.contains(locationComment)) {
			locationComments.add(locationComment);
		}
	}
	
	public void removeLocationComment(LocationComment locationComment) {
		if(locationComments != null && locationComments.contains(locationComment)) {
			locationComments.remove(locationComment);
		}
	}

	public void addReports(Report report) {
		if(reports == null) {
			reports = new ArrayList<>();
		}
		if(!reports.contains(report)) {
			reports.add(report);
	
		}
	}
	public void removeReports(Report report) {
		if(reports != null && reports.contains(report)) {
			reports.remove(report);
		}
	}
	
	public void addRatings(Rating rating) {
		if(ratings == null) { ratings = new ArrayList<>(); }
		if(!ratings.contains(rating)) {
			ratings.add(rating);
		}
		
	}
	
	public void removeRating(Rating rating) {
		if(ratings != null && ratings.contains(rating)) {
			ratings.remove(rating);
		}
	}
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Accessability getAccess() {
		return access;
	}

	public void setAccess(Accessability access) {
		this.access = access;
	}

	public double getLatitude() {
		return latitude;
	}

	public void setLatitude(double latitude) {
		this.latitude = latitude;
	}

	public double getLongitude() {
		return longitude;
	}

	public void setLongitude(double longitude) {
		this.longitude = longitude;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getWaterBody() {
		return waterBody;
	}

	public void setWaterBody(String waterBody) {
		this.waterBody = waterBody;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFishingNotes() {
		return fishingNotes;
	}

	public void setFishingNotes(String fishingNotes) {
		this.fishingNotes = fishingNotes;
	}

	public String getDiscription() {
		return discription;
	}

	public void setDiscription(String discription) {
		this.discription = discription;
	}

	public String getMapUrl() {
		return mapUrl;
	}

	public void setMapUrl(String mapUrl) {
		this.mapUrl = mapUrl;
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
		Location other = (Location) obj;
		if (id != other.id)
			return false;
		return true;
	}

	public Location(int id, Accessability access, double latitude, double longitude, String name, String waterBody,
			String area, String fishingNotes, String discription, String mapUrl, String imageUrl) {
		super();
		this.id = id;
		this.access = access;
		this.latitude = latitude;
		this.longitude = longitude;
		this.name = name;
		this.waterBody = waterBody;
		this.area = area;
		this.fishingNotes = fishingNotes;
		this.discription = discription;
		this.mapUrl = mapUrl;
		this.imageUrl = imageUrl;
	}

	public Location() {
		super();
	}

	@Override
	public String toString() {
		return "Locations [id=" + id + ", latitude=" + latitude + ", longitude=" + longitude + ", name=" + name
				+ ", waterBody=" + waterBody + ", area=" + area + ", fishingNotes=" + fishingNotes + ", discription="
				+ discription + ", mapUrl=" + mapUrl + ", imageUrl=" + imageUrl + "]";
	}
	
	
	
}
