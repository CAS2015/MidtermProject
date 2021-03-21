package com.skilldistillery.deeperdive.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.deeperdive.dao.UserDAO;

@Controller
public class HomeController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = {"/", "home.do"})
	public String home(Model model) {
		model.addAttribute("TEST", userDao.findById(1));
		return "index";
	}
	
	@RequestMapping(path = "register.do", method = RequestMethod.GET)
	public String home1() {
		return "register";
	}
	
}
