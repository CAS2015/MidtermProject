package com.skilldistillery.deeperdive.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.LocationCommentDAO;
import com.skilldistillery.deeperdive.dao.LocationDAO;
import com.skilldistillery.deeperdive.dao.UserDAO;
import com.skilldistillery.deeperdive.entities.Location;
import com.skilldistillery.deeperdive.entities.LocationComment;
import com.skilldistillery.deeperdive.entities.LocationComment;
import com.skilldistillery.deeperdive.entities.User;

@Controller
public class LocationCommentController {
	
	@Autowired
	private LocationCommentDAO locationCommentDao;
	
	@Autowired
	private LocationDAO locationDao;
	
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "newLocationComment.do", method = RequestMethod.POST)
	public String newLocationComment(LocationComment locationComment, int locationId, int userId) {
		
		locationComment.setCreatedAt(LocalDateTime.now());
		
		Location location = locationDao.findLocationById(locationId);
		locationComment.setLocation(location);
		
		User user = userDao.findById(userId);
		locationComment.setUser(user);
		
		locationCommentDao.createLocationComment(locationComment);
		
		return "redirect:LocationCommentCreated.do?locationId=" + locationId;
	
	}
	
	@RequestMapping(path = "LocationCommentCreated.do", method = RequestMethod.GET)
	public String locationCommentCreated(int locationId) {
		
		return "redirect:getLocation.do?id=" + locationId;
	}
	
	@RequestMapping(path = "LocationCommentResponse.do", method = RequestMethod.POST)
	public String newLocationCommentResponse(LocationComment locationComment, Integer responseId, int locationId, int userId) {
		
		locationComment.setCreatedAt(LocalDateTime.now());
		
		Location location = locationDao.findLocationById(locationId);
		locationComment.setLocation(location);
		
		User user = userDao.findById(userId);
		locationComment.setUser(user);
		
		locationCommentDao.createLocationCommentResponse(locationComment, responseId);
		
		return "redirect:LocationCommentCreated.do?locationId=" + locationId;
		
	}
	
	@RequestMapping(path = "LocationCommentResponded.do", method = RequestMethod.GET)
	public String locationCommentResponded(int locationId) {
		
		return "redirect:getLocation.do?id=" + locationId;
	}
	
	@RequestMapping(path= "removeLocationComment.do", method = RequestMethod.POST)
	public String removeComment(int locationCommentId, RedirectAttributes redir) {
		
		LocationComment	locationComment = locationCommentDao.findById(locationCommentId);
		int locationId = locationComment.getLocation().getId();
		
		boolean commentDeleted = locationCommentDao.removeLocationComment(locationComment);
		redir.addFlashAttribute("commentDeleted", commentDeleted);
		
		return "redirect:commentRemoved.do?locationId="  + locationId;
	}
	
	@RequestMapping(path = "locationCommentRemoved.do")
	public String commentRemoved(int locationId) {
		return "redirect:getLocation.do?id=" + locationId;

	}
	
}
