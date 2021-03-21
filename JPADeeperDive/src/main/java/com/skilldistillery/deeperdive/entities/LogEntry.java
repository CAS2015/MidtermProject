package com.skilldistillery.deeperdive.entities;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="log_entry")
public class LogEntry {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name= "log_content")
	private String logContent;
	
	private String title;
	
	@Column(name= "dive_date")
	private LocalDate diveDate;

	@Column(name= "entry_time")
	private LocalTime entryTime;
	
	private int rating;
	
	@Column(name= "max_depth_meters")
	private int maxDepthMeters;
	
	private String equipment;
	
	@Column(name= "img_url")
	private String imageUrl;
	
	@Column(name= "end_time")
	private LocalTime endTime;
	
	private String visibility;
	
	@Column(name= "created_at")
	private LocalDateTime createdAt;
	
	@Column(name= "last_updated")
	private LocalDateTime lastUpdated;
	
	@Column(name= "start_pressure_bar")
	private int startPressureBar;
	
	@Column(name= "end_pressure_bar")
	private int endPressureBar;
	
	@Column(name= "air_type")
	private String airType;
	
	private String attraction;
	
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="site_id")
	private Site site;
	
	public LogEntry() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLogContent() {
		return logContent;
	}

	public void setLogContent(String logContent) {
		this.logContent = logContent;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public LocalDate getDiveDate() {
		return diveDate;
	}

	public void setDiveDate(LocalDate diveDate) {
		this.diveDate = diveDate;
	}

	public LocalTime getEntryTime() {
		return entryTime;
	}

	public void setEntryTime(LocalTime entryTime) {
		this.entryTime = entryTime;
	}

	public int getRating() {
		return rating;
	}

	public void setRating(int rating) {
		this.rating = rating;
	}

	public int getMaxDepthMeters() {
		return maxDepthMeters;
	}

	public void setMaxDepthMeters(int maxDepthMeters) {
		this.maxDepthMeters = maxDepthMeters;
	}

	public String getEquipment() {
		return equipment;
	}

	public void setEquipment(String equipment) {
		this.equipment = equipment;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalTime getEndTime() {
		return endTime;
	}

	public void setEndTime(LocalTime endTime) {
		this.endTime = endTime;
	}

	public String getVisibility() {
		return visibility;
	}

	public void setVisibility(String visibility) {
		this.visibility = visibility;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public LocalDateTime getLastUpdated() {
		return lastUpdated;
	}

	public void setLastUpdated(LocalDateTime lastUpdated) {
		this.lastUpdated = lastUpdated;
	}

	public int getStartPressureBar() {
		return startPressureBar;
	}

	public void setStartPressureBar(int startPressureBar) {
		this.startPressureBar = startPressureBar;
	}

	public int getEndPressureBar() {
		return endPressureBar;
	}

	public void setEndPressureBar(int endPressureBar) {
		this.endPressureBar = endPressureBar;
	}

	public String getAirType() {
		return airType;
	}

	public void setAirType(String airType) {
		this.airType = airType;
	}

	public String getAttraction() {
		return attraction;
	}

	public void setAttraction(String attraction) {
		this.attraction = attraction;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Site getSite() {
		return site;
	}

	public void setSite(Site site) {
		this.site = site;
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
		LogEntry other = (LogEntry) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("LogEntry [id=").append(id).append(", logContent=").append(logContent).append(", title=")
				.append(title).append(", diveDate=").append(diveDate).append(", entryTime=").append(entryTime)
				.append(", rating=").append(rating).append(", maxDepthMeters=").append(maxDepthMeters)
				.append(", equipment=").append(equipment).append(", imageUrl=").append(imageUrl).append(", endTime=")
				.append(endTime).append(", visibility=").append(visibility).append(", createdAt=").append(createdAt)
				.append(", lastUpdated=").append(lastUpdated).append(", startPressureBar=").append(startPressureBar)
				.append(", endPressureBar=").append(endPressureBar).append(", airType=").append(airType)
				.append(", attraction=").append(attraction).append("]");
		return builder.toString();
	}

	
}
