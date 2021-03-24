package com.skilldistillery.deeperdive.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.deeperdive.dao.LocationDAO;

@Controller
public class HomeController {
	
	@Autowired
	private LocationDAO locationDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		
		boolean isTopFive = true;
		
		model.addAttribute("locations", locationDao.findTopFiveLocations());
		
		model.addAttribute("isTopFive", isTopFive);
		
		return "index";
	}
	
	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String home1() {
		return "register";
	}
	
	@RequestMapping(path = {"aboutPage.do"})
	public String aboutPage() {
		
		return "about";
	}
	
	@RequestMapping(path = {"contactPage.do"})
	public String contactPage() {
		
		return "contact";
	}
	
}
