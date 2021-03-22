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
		model.addAttribute("locations" , topFive);
		
		return "index";
	}
	
	
}
