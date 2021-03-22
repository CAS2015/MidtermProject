package com.skilldistillery.deeperdive.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.deeperdive.dao.LocationDAO;
import com.skilldistillery.deeperdive.entities.Location;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO dao;

	@RequestMapping(path = "topFiveLocations.do")
	public String showTopFiveLocations(Model model) {

		List<Location> topFive = dao.findTopFiveLocations();
		model.addAttribute("locations", topFive);

		return "index";
	}

	@RequestMapping(path = "locationsAlphabetically.do")
	public String showLocationsAlphabetically(Model model) {

		List<Location> locations = dao.findLocationsAlphabetically();

		model.addAttribute("locations", locations);

		return "index";
	}
	
	@RequestMapping(path = "locationsByRating.do")
	public String showLocationsByRating(Model model) {
		
		List<Location> locations = dao.findLocationsByRating();
		
		model.addAttribute("locations", locations);
		
		return "index";
	}
	
	@RequestMapping(path = "getLocation.do")
	public String getLocation(Location location, Model model) {
		
		Location loc = dao.findLocationById(location.getId());
		
		model.addAttribute("location", loc);
		
		return "locationDetails";
	}
	
	@RequestMapping(path = "locationsByKeyword.do")
	public String locationsByKeyword(String keyword, Model model) {
		
		List<Location> locations = dao.findLocationsByKeyword(keyword);
		
		model.addAttribute("locations", locations);
		
		return "index";
	}
	
	@RequestMapping(path = "allLocations.do")
	public String allLocations(Model model) {
		
		List<Location> locations = dao.findAllLocations();
		
		model.addAttribute("locations", locations);
		
		return "index";
	}
	
	

}
