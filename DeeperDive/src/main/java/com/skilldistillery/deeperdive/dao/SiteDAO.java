package com.skilldistillery.deeperdive.dao;

import java.util.List;

import com.skilldistillery.deeperdive.entities.Site;

public interface SiteDAO {

	Site findSiteById(int id);
	
	List<Site> findAllSites();
	
	Site findSitesByName(String siteName);
	
	
}
