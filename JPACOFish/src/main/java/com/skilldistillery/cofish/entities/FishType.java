package com.skilldistillery.cofish.entities;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "fish_type")
public class FishType {

	//F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name = "image_url")
	private String imageUrl;
	
	private String description;
	
	@Column(name = "wiki_url")
	private String wikiUrl;
	
	@OneToMany(mappedBy="fishType")
	private List<CaughtFish> caughtFishes;
	
	//GETTERS & SETTERS
	
	
	public void addCaughtFish(CaughtFish caughtFish) {
		if(caughtFishes == null) caughtFishes = new ArrayList<>();
		
		if(!caughtFishes.contains(caughtFish)) {
			caughtFishes.add(caughtFish);
			if(caughtFish.getFishType() != null) {
				caughtFish.getFishType().getCaughtFishes().remove(caughtFish);
				
			}
		}
	}
	
	public void removeCaughtFish(CaughtFish removeCaughtFish){
		removeCaughtFish.setFishType(null);
		if(caughtFishes != null) {
			caughtFishes.remove(removeCaughtFish);
		}
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getWikiUrl() {
		return wikiUrl;
	}

	public void setWikiUrl(String wikiUrl) {
		this.wikiUrl = wikiUrl;
	}

	public List<CaughtFish> getCaughtFishes() {
		return caughtFishes;
	}

	public void setCaughtFishes(List<CaughtFish> caughtFishes) {
		this.caughtFishes = caughtFishes;
	}

	//HASHCODE AND EQUALS
	
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
		FishType other = (FishType) obj;
		if (id != other.id)
			return false;
		return true;
	}

	//CONSTRUCTORS
	
	public FishType() {
		super();
	}

	public FishType(int id, String name, String imageUrl, String description, String wikiUrl) {
		super();
		this.id = id;
		this.name = name;
		this.imageUrl = imageUrl;
		this.description = description;
		this.wikiUrl = wikiUrl;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("FishType [id=").append(id).append(", name=").append(name).append(", imageUrl=").append(imageUrl)
				.append(", description=").append(description).append(", wikiUrl=").append(wikiUrl).append("]");
		return builder.toString();
	}
	
	
	
	
	
}
