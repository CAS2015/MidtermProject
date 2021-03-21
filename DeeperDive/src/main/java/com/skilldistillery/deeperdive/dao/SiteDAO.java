package com.skilldistillery.deeperdive.dao;

import java.util.List;

import com.skilldistillery.deeperdive.entities.Site;

public interface SiteDAO {

	Site findSiteById(int id);
	
	List<Site> findAllSites();
	
	List<Site> findTopFiveSites();
	
	List<Site> findSitesAlphabetically();
	
	List<Site> findSitesByRating();
	
	List<Site> findSitesByKeyword(String keyword);
	
	
}
