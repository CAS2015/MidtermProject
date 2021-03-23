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

		String jpql = "SELECT l FROM Location l JOIN l.sites si JOIN si.logEntries";

		try {
			location = em.createQuery(jpql, Location.class).getSingleResult();
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
	public List<LogEntry> getThreeMostRecentLogEntries(Location location) {
		List<LogEntry> logs;
		
		String jpql = "SELECT le FROM LogEntry le JOIN le.site si JOIN si.location l WHERE l.id= :id";
		logs = em.createQuery(jpql, LogEntry.class).setParameter("id",location.getId()).setMaxResults(3).getResultList();
		
		return logs;
	}
	
	
	
}
