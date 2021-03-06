package com.skilldistillery.deeperdive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.Location;
import com.skilldistillery.deeperdive.entities.LogEntry;

@Service
@Transactional
public class LocationDaoJpaImpl implements LocationDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Location findLocationById(int id) {

		Location location = null;

		String jpql = "SELECT l FROM Location l JOIN l.sites si JOIN si.logEntries WHERE l.id = :id";

		try {
			location = em.createQuery(jpql, Location.class).setParameter("id",id).getSingleResult();
		} catch (Exception e) {
			e.printStackTrace();
		}

		return location;

	}

	@Override
	public List<Location> findAllLocations() {
		List<Location> locations;

		String jpql = "SELECT l FROM Location l";

		locations = em.createQuery(jpql, Location.class).getResultList();

		return locations;
	}

	@Override
	public List<Location> findTopFiveLocations() {
		List<Location> topFive;

		String jpql = "SELECT l FROM Location l JOIN l.sites si JOIN si.logEntries le GROUP BY l.id ORDER BY AVG(le.rating) DESC";
		
		topFive = em.createQuery(jpql, Location.class).setMaxResults(5).getResultList();

		return topFive;
	}

	@Override
	public List<Location> findLocationsAlphabetically() {
		List<Location> locations;

		String jpql = "SELECT l FROM Location l ORDER BY l.locationName";

		locations = em.createQuery(jpql, Location.class).getResultList();

		return locations;
	}

	@Override
	public List<Location> findLocationsByRating() {

		List<Location> sites;

		String jpql = "SELECT l FROM Location l JOIN l.sites si JOIN si.logEntries le GROUP BY l.id ORDER BY AVG(le.rating) DESC";

		sites = em.createQuery(jpql, Location.class).getResultList();

		return sites;
	}

	@Override
	public List<Location> findLocationsByKeyword(String keyword) {
		List<Location> sites;

		String jpql = "SELECT l from Location l JOIN l.sites si JOIN si.logEntries le WHERE le.logContent LIKE :keyword OR le.attraction LIKE :keyword";

		sites = em.createQuery(jpql, Location.class).setParameter("keyword", "%"+keyword+"%").getResultList();

		return sites;
	}
	
	
	@Override
	public List<LogEntry> getAllLogEntries(Location location) {
		List<LogEntry> logs;
		
		String jpql = "SELECT le FROM LogEntry le JOIN le.site si JOIN si.location l WHERE l.id= :id";
		logs = em.createQuery(jpql, LogEntry.class).setParameter("id",location.getId()).getResultList();
		
		return logs;
	}

	
	//select AVG(rating) from log_entry join site on log_entry.site_id = site.id join location on site.location_id = 
	//location.id where location.id =1 ;
	@Override
	public Double getLocationRatingsAverage(int id) {
		Double average = 0.0;
		String jpql = "SELECT AVG(le.rating) FROM LogEntry le JOIN Site s ON le.site.id = s.id JOIN Location l ON s.location.id = l.id WHERE l.id = :id";
		try {
			 average = em.createQuery(jpql, Double.class).setParameter("id", id).getSingleResult();
		} catch (Exception e) {
		return average;
		}
		
		return average;		
		
	}
	
	
	
}
