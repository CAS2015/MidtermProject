package com.skilldistillery.deeperdive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.Location;
import com.skilldistillery.deeperdive.entities.Site;

@Service
@Transactional
public class LocationDaoJpaImpl implements LocationDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public Location findLocationById(int id) {
		return em.find(Location.class, id);
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

		String jpql = "SELECT l FROM Location l Join Site s ON l.id = s.location.id JOIN LogEntry le ON s.id = le.site.id ORDER BY (SELECT AVG(le.rating) FROM le) DESC LIMIT 5";

		topFive = em.createQuery(jpql, Location.class).getResultList();

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

		String jpql = "SELECT l FROM Location l JOIN Site s ON l.id = s.location.id JOIN LogEntry le ON s.id = le.site.id ORDER BY (SELECT AVG(le.rating) FROM le) DESC";

		sites = em.createQuery(jpql, Location.class).getResultList();

		return sites;
	}

	@Override
	public List<Location> findLocationsByKeyword(String keyword) {
		
		
		
		return null;
	}

}
