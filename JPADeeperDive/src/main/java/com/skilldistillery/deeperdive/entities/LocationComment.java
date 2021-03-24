package com.skilldistillery.deeperdive.entities;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "location_comment")
public class LocationComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int Id;
	
	private String content;
	
	@Column(name = "created_at")
	private LocalDateTime createdAt;

	//TODO add foreign key fields 
	@ManyToOne
	@JoinColumn(name="user_id")
	private User user;
	
	@ManyToOne
	@JoinColumn(name="location_id")
	private Location location;

	@ManyToOne()
	@JoinColumn(name="in_response_id")
	private LocationComment originalPost;

	@OneToMany(mappedBy="originalPost")
	private List<LocationComment> responses;
	
	public LocationComment() {
	}

	// methods
	
	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public LocalDateTime getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(LocalDateTime createdAt) {
		this.createdAt = createdAt;
	}

	public int getId() {
		return Id;
	}

	public void setId(int id) {
		Id = id;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public LocationComment getOriginalPost() {
		return originalPost;
	}

	public void setOriginalPost(LocationComment originalPost) {
		this.originalPost = originalPost;
	}

	public List<LocationComment> getResponses() {
		return responses;
	}

	public void setResponses(List<LocationComment> responses) {
		this.responses = responses;
	}

	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + Id;
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
		if (Id != other.Id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		return "LocationComment [Id=" + Id + ", content=" + content + ", createdAt=" + createdAt + "]";
	}
	
	
	
	
	
}
