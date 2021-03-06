package com.skilldistillery.deeperdive.dao;

import com.skilldistillery.deeperdive.entities.LogEntry;

public interface LogEntryDAO {

	LogEntry createLog(LogEntry logEntry);
	
	LogEntry findById(int id);
	
	LogEntry updateLog(LogEntry logEntry);
	
	boolean deleteLog(LogEntry logEntry);
}
