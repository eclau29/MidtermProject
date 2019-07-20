package com.skilldistillery.cofish.entities;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name = "caught_fish")
public class CaughtFish {
	
	//F I E L D S
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name = "length_inches")
	private Double lengthInches;
	
	@Column(name = "weight_lbs")
	private Double weightLbs;
	
	@Column(name = "rod_type")
	private String rodType;
	
	@Column(name = "lure_type")
	private String lureType;
	
	private String comment;
	
	@ManyToOne
	@JoinColumn(name = "fish_type_id")
	private FishType fishType;

	@ManyToOne
	@JoinColumn(name = "report_id")
	private Report report;
	
	//G E T & S E T S

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Double getLengthInches() {
		return lengthInches;
	}

	public void setLengthInches(Double lengthInches) {
		this.lengthInches = lengthInches;
	}

	public Double getWeightLbs() {
		return weightLbs;
	}

	public void setWeightLbs(Double weightLbs) {
		this.weightLbs = weightLbs;
	}

	public String getRodType() {
		return rodType;
	}

	public void setRodType(String rodType) {
		this.rodType = rodType;
	}

	public String getLureType() {
		return lureType;
	}

	public void setLureType(String lureType) {
		this.lureType = lureType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	

	public FishType getFishType() {
		return fishType;
	}

	public void setFishType(FishType fishType) {
		this.fishType = fishType;
	}

	public Report getReport() {
		return report;
	}

	public void setReport(Report report) {
		this.report = report;
	}
	
	//HASHCODE EQUALS

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
		CaughtFish other = (CaughtFish) obj;
		if (id != other.id)
			return false;
		return true;
	}
	
	//CONSTRUCTORS
	
//	public CaughtFish() {
//		super();
//	}
//
//	public CaughtFish(int id, int fishTypeId, Double lengthInches, Double weightLbs, String rodType, String lureType,
//			int reportId, String comment) {
//		super();
//		this.id = id;
//		this.lengthInches = lengthInches;
//		this.weightLbs = weightLbs;
//		this.rodType = rodType;
//		this.lureType = lureType;
//		this.comment = comment;
//	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("CaughtFish [id=").append(id).append(", fishTypeId=").append(fishType)
				.append(", lengthInches=").append(lengthInches).append(", weightLbs=").append(weightLbs)
				.append(", rodType=").append(rodType).append(", lureType=").append(lureType).append(", reportId=")
				.append(", comment=").append(comment).append("]");
		return builder.toString();
	}
}














