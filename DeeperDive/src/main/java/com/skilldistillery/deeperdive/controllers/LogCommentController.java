package com.skilldistillery.deeperdive.controllers;

import java.time.LocalDateTime;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.LogCommentDAO;
import com.skilldistillery.deeperdive.dao.LogEntryDAO;
import com.skilldistillery.deeperdive.dao.UserDAO;
import com.skilldistillery.deeperdive.entities.LogComment;
import com.skilldistillery.deeperdive.entities.LogEntry;
import com.skilldistillery.deeperdive.entities.User;

@Controller
public class LogCommentController {
		@Autowired
		private LogEntryDAO logEntryDao;
		@Autowired
		private LogCommentDAO logCommentDao;
		@Autowired
		private UserDAO userDao;
		
		
		@RequestMapping(path = "submitLogComment.do", method = RequestMethod.POST)
		public String submitLogComment(String content, int userId, int logId) {
			
			LogComment logComment = new LogComment();
			logComment.setContent(content);
			
			System.out.println(content);
			System.out.println(logComment);
			System.out.println(userId);
			System.out.println(logId);
			
			
			User user = userDao.findById(userId);
			LogEntry logEntry = logEntryDao.findById(logId);
			
			if(logComment.getContent() != null && logComment.getContent().length() > 0) {
			logComment.setLogEntry(logEntry);
			logComment.setUser(user);
			logComment.setCreateAt(LocalDateTime.now());
			logCommentDao.createLogComment(logComment);
			} 
			return "redirect:newComment.do?locationId=" + logEntry.getSite().getLocation().getId();
			
		}
		
		@RequestMapping(path= "newComment.do", method = RequestMethod.GET)
		public String newComment(int locationId) {
			
			return "redirect:getLocation.do?id=" + locationId;
		}
		
		
		@RequestMapping(path= "removeLogComment.do", method = RequestMethod.POST)
		public String removeComment(int logCommentId, RedirectAttributes redir) {
			
			LogComment	logComment = logCommentDao.findById(logCommentId);
			int locationId = logComment.getLogEntry().getSite().getLocation().getId();
			
			boolean commentDeleted = logCommentDao.removeLogComment(logComment);
			redir.addFlashAttribute("commentDeleted", commentDeleted);
			
			return "redirect:commentRemoved.do?locationId="  + locationId;
		}
		
		@RequestMapping(path = "commentRemoved.do")
		public String commentRemoved(int locationId) {
			return "redirect:getLocation.do?id=" + locationId;

		}
		
		
}
