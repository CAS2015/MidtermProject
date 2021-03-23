package com.skilldistillery.deeperdive.controllers;

import java.beans.PropertyEditorSupport;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.LogEntryDAO;
import com.skilldistillery.deeperdive.dao.SiteDAO;
import com.skilldistillery.deeperdive.dao.UserDAO;
import com.skilldistillery.deeperdive.entities.LogEntry;
import com.skilldistillery.deeperdive.entities.Site;

@Controller
public class LogEntryController {
	@Autowired
	private LogEntryDAO logEntryDao;
	@Autowired
	private SiteDAO siteDao;
	@Autowired
	private UserDAO userDao;
	
	@RequestMapping(path = "logForm.do", method = RequestMethod.GET)
	public String addALog() {
		return "logForm";
	}
	
	@RequestMapping(path = "createLog.do", method = RequestMethod.POST)
	public ModelAndView createLog(LogEntry logEntry, String diveSiteName, RedirectAttributes redir) {
		// add site_id, and user_id (HARCODED FOR NOW)
		ModelAndView mv = new ModelAndView();
		Site site = siteDao.findSitesByName(diveSiteName);
		if (site == null) {
			logEntry.setSite(siteDao.findSiteById(1));			
		} else {
			logEntry.setSite(site);			
		}
		logEntry.setUser(userDao.findById(1));
		// add created_at, last_updated hidden fields
		logEntry.setCreatedAt(LocalDateTime.now());
		logEntry.setLastUpdated(LocalDateTime.now());
		LogEntry newLog = logEntryDao.createLog(logEntry);
		if (newLog == null) {
			redir.addFlashAttribute("failed", true);
			mv.setViewName("redirect:logForm.do");
		} else {
			redir.addFlashAttribute("log", newLog);
			mv.setViewName("redirect:logCreated.do?id=" + newLog.getSite().getLocation().getId());
		}
		return mv;
	}
	
	@RequestMapping(path = "logCreated.do", method = RequestMethod.GET)
	public ModelAndView logCreated(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:getLocation.do?id=" + id);
		return mv;
	}
	
	
	@RequestMapping(path = "updateLogForm.do", method = RequestMethod.GET)
	public ModelAndView updateALog(int logId) {
		ModelAndView mv = new ModelAndView();
		LogEntry entry = logEntryDao.findById(logId);
		mv.addObject("update", true);
		mv.addObject("log", entry);
		mv.setViewName("logForm");
		return mv;
	}
	
	@RequestMapping(path = "updateLog.do", method = RequestMethod.POST)
	public ModelAndView updateLog(LogEntry logEntry, String diveSiteName, RedirectAttributes redir) {
		// add site_id, and user_id (HARCODED FOR NOW)
		System.out.println("*******************" + logEntry);
		ModelAndView mv = new ModelAndView();
		Site site = siteDao.findSitesByName(diveSiteName);
		if (site == null) {
			logEntry.setSite(siteDao.findSiteById(1));			
		} else {
			logEntry.setSite(site);			
		}
		// add created_at, last_updated hidden fields
		logEntry.setLastUpdated(LocalDateTime.now());
		
		LogEntry updateLog = logEntryDao.updateLog(logEntry);
		
		if (updateLog == null) {
			redir.addFlashAttribute("failed", true);
			mv.setViewName("redirect:logForm.do");
		} else {
			redir.addFlashAttribute("logEntry", updateLog);
			mv.setViewName("redirect:logUpdate.do?id=" + updateLog.getSite().getLocation().getId());
		}
		return mv;
	}
	
	@RequestMapping(path = "logUpdate.do", method = RequestMethod.GET)
	public ModelAndView logUpdated(int id) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:getLocation.do?id=" + id);
		return mv;
	}
	
	// From ROB ---------------------------------
	
	@InitBinder
	public void initBinder(WebDataBinder webDataBinder) {
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		dateFormat.setLenient(true);
		webDataBinder.registerCustomEditor(Date.class, new CustomDateEditor(dateFormat, true));
		webDataBinder.registerCustomEditor(LocalDate.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalDate.parse(text, DateTimeFormatter.ofPattern("yyyy-MM-dd")));
			}
			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("yyyy-MM-dd").format((LocalDate) getValue());
			}
		});
		webDataBinder.registerCustomEditor(LocalTime.class, new PropertyEditorSupport() {
			@Override
			public void setAsText(String text) throws IllegalArgumentException {
				setValue(LocalTime.parse(text, DateTimeFormatter.ofPattern("HH:MM")));
			}
			@Override
			public String getAsText() throws IllegalArgumentException {
				return DateTimeFormatter.ofPattern("HH:MM").format((LocalDate) getValue());
			}
		});
	}
	
	
}
