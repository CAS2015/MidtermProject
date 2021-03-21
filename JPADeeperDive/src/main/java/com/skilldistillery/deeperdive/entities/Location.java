package com.skilldistillery.deeperdive.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Location {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name="location_name")
	private String locationName;
	
	private String region;
	
	private String country;
	
	@Column(name="water_type")
	private String waterType;
	
	@Column(name="minimum_temperature_celsius")
	private int minTemp;
	
	@Column(name="maximum_temperature_celsius")
	private int maxTemp;
	
	private String description;
	
	@Column(name="img_url")
	private String imgUrl;
	
	@OneToMany(mappedBy= "location")
	private List<Site> sites;
	
	@OneToMany(mappedBy= "location")
	private List<LocationComment> locationComments;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLocationName() {
		return locationName;
	}

	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}

	public String getRegion() {
		return region;
	}

	public void setRegion(String region) {
		this.region = region;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getWaterType() {
		return waterType;
	}

	public void setWaterType(String waterType) {
		this.waterType = waterType;
	}

	public int getMinTemp() {
		return minTemp;
	}

	public void setMinTemp(int minTemp) {
		this.minTemp = minTemp;
	}

	public int getMaxTemp() {
		return maxTemp;
	}

	public void setMaxTemp(int maxTemp) {
		this.maxTemp = maxTemp;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public List<Site> getSites() {
		return sites;
	}

	public void setSites(List<Site> sites) {
		this.sites = sites;
	}

	public List<LocationComment> getLocationComments() {
		return locationComments;
	}

	public void setLocationComments(List<LocationComment> locationComments) {
		this.locationComments = locationComments;
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

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Location [id=").append(id).append(", locationName=").append(locationName).append(", region=")
				.append(region).append(", country=").append(country).append(", waterType=").append(waterType)
				.append(", minTemp=").append(minTemp).append(", maxTemp=").append(maxTemp).append(", description=")
				.append(description).append(", imgUrl=").append(imgUrl).append("]");
		return builder.toString();
	}
	
	
}
