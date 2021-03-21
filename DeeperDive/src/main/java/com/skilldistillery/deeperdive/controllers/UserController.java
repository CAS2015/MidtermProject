package com.skilldistillery.deeperdive.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.UserDAO;
import com.skilldistillery.deeperdive.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "register.do", method=RequestMethod.POST)
	public ModelAndView register(User user, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		user.setCreateDate(LocalDateTime.now());
		
		User newUser = userDao.create(user);
		
		if (newUser == null) {
			mv.setViewName("register");
			mv.addObject("failed", true);
		}
		else {
			redir.addFlashAttribute("user", newUser);
			redir.addFlashAttribute("registered",true);
			mv.setViewName("redirect:home.do");	
			
		}
		return mv;
	}

}
