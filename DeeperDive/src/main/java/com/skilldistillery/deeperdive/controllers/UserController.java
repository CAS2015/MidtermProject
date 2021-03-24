package com.skilldistillery.deeperdive.controllers;

import java.time.LocalDateTime;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.UserDAO;
import com.skilldistillery.deeperdive.entities.LogEntry;
import com.skilldistillery.deeperdive.entities.User;

@Controller
public class UserController {
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "register.do", method= RequestMethod.POST)
	public ModelAndView register(User user, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		user.setCreateDate(LocalDateTime.now());
		
		User newUser = userDao.create(user);
		
		if (newUser == null) {
			mv.setViewName("register");
			redir.addFlashAttribute("failed", true);
		}
		else {
			session.setAttribute("loggedInUser", newUser);
			redir.addFlashAttribute("registered",true);
			mv.setViewName("redirect:login.do");	
			
		}
		return mv;
	}

	@RequestMapping(path = "login.do", method={RequestMethod.GET, RequestMethod.POST})
	public ModelAndView login(String username, String password, HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();
		
		if(session.getAttribute("loggedInUser") != null) {
			mv.setViewName("redirect:home.do");
			return mv;
		}
		
		User user = userDao.login(username, password);
		
		if (user == null) {
			redir.addFlashAttribute("failed", true);
			mv.setViewName("redirect:home.do");
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

	@RequestMapping(path = "profile.do", method=RequestMethod.GET)
	public ModelAndView goToProfile(HttpSession session, RedirectAttributes redir) {
		ModelAndView mv = new ModelAndView();

		if (session.getAttribute("loggedInUser") == null) {
			mv.setViewName("redirect:home.do");
			return mv;
		}
		else {
			User user = (User) session.getAttribute("loggedInUser");
			
			List<LogEntry> logs = userDao.findById(user.getId()).getLogEntries();
			mv.addObject("logs",logs);
			mv.setViewName("userPage");		
		}
		return mv;
	}
	
	
}
