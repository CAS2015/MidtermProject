package com.skilldistillery.deeperdive.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.skilldistillery.deeperdive.dao.LocationDAO;
import com.skilldistillery.deeperdive.entities.Location;
import com.skilldistillery.deeperdive.entities.LogEntry;

@Controller
public class LocationController {

	@Autowired
	private LocationDAO dao;

	@RequestMapping(path = "locationsAlphabetically.do")
	public String showLocationsAlphabetically(Model model) {

		List<Location> locations = dao.findLocationsAlphabetically();
		
		boolean isAlphabetical = true;
		
		model.addAttribute("locations", locations);
		//flag to change header
		model.addAttribute("isAlphabetical", isAlphabetical);
		
		return "index";
	}
	
	@RequestMapping(path = "locationsByRating.do")
	public String showLocationsByRating(Model model) {
		
		List<Location> locations = dao.findLocationsByRating();
		
		boolean isByRating = true;
		
		model.addAttribute("locations", locations);
		
		model.addAttribute("isByRating", isByRating);
		
		return "index";
	}
	
	@RequestMapping(path = "getLocation.do")
	public String getLocation(int id, Model model) {
		Location loc = dao.findLocationById(id);
		List<LogEntry> logs = dao.getAllLogEntries(loc);
		Double rating = dao.getLocationRatingsAverage(loc.getId());
		
		model.addAttribute("averageRating", rating);
		model.addAttribute("logs",logs);
		model.addAttribute("location", loc);
		
		return "locationDetails";
	}
	
	@RequestMapping(path = "locationsByKeyword.do")
	public String locationsByKeyword(String keyword, Model model) {
		
		List<Location> locations = dao.findLocationsByKeyword(keyword);
		
		boolean isByKeyword = true;
		
		model.addAttribute("locations", locations);
		
		model.addAttribute("isByKeyword", isByKeyword);
		
		return "index";
	}
	
	@RequestMapping(path = "allLocations.do")
	public String allLocations(Model model) {
		
		List<Location> locations = dao.findAllLocations();
		
		model.addAttribute("locations", locations);
		
		return "index";
	}
	
	

}
