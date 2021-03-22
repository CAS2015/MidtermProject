package com.skilldistillery.deeperdive.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.skilldistillery.deeperdive.dao.LogEntryDAO;
import com.skilldistillery.deeperdive.dao.SiteDAO;
import com.skilldistillery.deeperdive.entities.LogEntry;

@Controller
public class LogEntryController {
	@Autowired
	private LogEntryDAO logEntryDao;
	@Autowired
	private SiteDAO siteDao;
	
//	@RequestMapping(path="createLog.do", method = RequestMethod.GET)
//	public String addALog(LogEntry logEntry, Model model) {
//		logEntry =logEntryDao.createLog(logEntry);
//		model.addAttribute("logEntry", logEntry);
//		return "siteDetails";
//	}
	
	@RequestMapping(path = "showSitesDetails.do", method = RequestMethod.GET)
	public String showSiteDetails() {
		return "siteDetails";
	}
	
	@RequestMapping(path = "logForm.do", method = RequestMethod.GET)
	public String addALog() {
		return "logForm";
	}
	
	@RequestMapping(path = "createLog.do", method = RequestMethod.POST)
	public String createLog(LogEntry logEntry, String diveSiteName, RedirectAttributes redir) {
		// add site_id, and user_id (HARCODED FOR NOW)
		
		// add created_at, last_updated hidden fields
		return null;
	}
	
}
