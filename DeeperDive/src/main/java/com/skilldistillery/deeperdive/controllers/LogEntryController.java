package com.skilldistillery.deeperdive.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.skilldistillery.deeperdive.dao.LogEntryDAO;
import com.skilldistillery.deeperdive.entities.LogEntry;

@Controller
public class LogEntryController {
	@Autowired
	private LogEntryDAO logEntryDao;
	
//	@RequestMapping(path="createLog.do", method = RequestMethod.GET)
//	public String addALog(LogEntry logEntry, Model model) {
//		logEntry =logEntryDao.createLog(logEntry);
//		model.addAttribute("logEntry", logEntry);
//		return "siteDetails";
//	}
	
	@RequestMapping(path = "createLog.do", method = RequestMethod.GET)
	public String siteDetails() {
		return "siteDetails";
	}
	
}
