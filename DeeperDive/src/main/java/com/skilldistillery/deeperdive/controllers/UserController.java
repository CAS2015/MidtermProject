package com.skilldistillery.deeperdive.controllers;

import java.time.LocalDateTime;

import javax.servlet.http.HttpSession;

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
	public ModelAndView register(User user, RedirectAttributes redir, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		user.setCreateDate(LocalDateTime.now());
		
		User newUser = userDao.create(user);
		
		if (newUser == null) {
			mv.setViewName("register");
			mv.addObject("failed", true);
		}
		else {
			session.setAttribute("loggedInUser", newUser);
			redir.addFlashAttribute("registered",true);
			mv.setViewName("redirect:login.do");	
			
		}
		return mv;
	}
	
	@RequestMapping(path = "login.do", method=RequestMethod.GET)
	public ModelAndView logintest(HttpSession session) {
		ModelAndView mv = new ModelAndView();
		if(session.getAttribute("loggedInUser") != null) {
			mv.setViewName("redirect:home.do");
			return mv;	
		}
		
		mv.setViewName("login");
	    return mv;
	}
	
	@RequestMapping(path = "login.do", method=RequestMethod.POST)
	public ModelAndView login(String username, String password, RedirectAttributes redir, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("loggedInUser") != null) {
			mv.setViewName("redirect:home.do");
			return mv;
		}
		
		User user = userDao.login(username, password);
		
		if (user == null) {
			mv.setViewName("login");
			mv.addObject("failed", true);
		}
		else {
			session.setAttribute("loggedInUser", user);
			mv.setViewName("redirect:home.do");		
		}
		return mv;
	}
	
	@RequestMapping(path = "logout.do")
	public ModelAndView logout(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		session.removeAttribute("loggedInUser");
		mv.setViewName("redirect:home.do");
		return mv;
	}

}
