package com.skilldistillery.deeperdive.dao;

import java.util.List;

import com.skilldistillery.deeperdive.entities.Location;
import com.skilldistillery.deeperdive.entities.Site;

public interface LocationDAO {

	Location findLocationById(int id);
	
	List<Location> findAllLocations();
	
	List<Location> findTopFiveLocations();
	
	List<Location> findLocationsAlphabetically();
	
	List<Location> findLocationsByRating();
	
	List<Location> findLocationsByKeyword(String keyword);
	
	
}
