package com.skilldistillery.deeperdive.entities;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

@Entity
public class Site {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String name;
	
	@Column(name= "minimum_cert")
	private String minimumCert;
	
	private String description;
	
	@ManyToOne()
	@JoinColumn(name="location_id")
	private Location location;
	
	@OneToOne
	@JoinColumn(name="dive_type_id")
	private DiveType diveType;
	
	@OneToMany(mappedBy = "site")
	private List<LogEntry> logEntries;
	
	public Site() {
		super();
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

	public String getMinimumCert() {
		return minimumCert;
	}

	public void setMinimumCert(String minimumCert) {
		this.minimumCert = minimumCert;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Location getLocation() {
		return location;
	}

	public void setLocation(Location location) {
		this.location = location;
	}

	public DiveType getDiveType() {
		return diveType;
	}

	public void setDiveType(DiveType diveType) {
		this.diveType = diveType;
	}

	public List<LogEntry> getLogEntries() {
		return logEntries;
	}

	public void setLogEntries(List<LogEntry> logEntries) {
		this.logEntries = logEntries;
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
		Site other = (Site) obj;
		if (id != other.id)
			return false;
		return true;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Site [id=").append(id).append(", name=").append(name).append(", minimumCert=")
				.append(minimumCert).append(", description=").append(description).append("]");
		return builder.toString();
	}

	
	
}
