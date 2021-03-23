package com.skilldistillery.deeperdive.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.LogEntry;

@Transactional
@Service
public class LogEntryDaoJpaImpl implements LogEntryDAO {
	@PersistenceContext
	private EntityManager em;
	
	@Override
	public LogEntry createLog(LogEntry logEntry) {
		em.persist(logEntry);
		em.flush();
		return logEntry;
	}

	@Override
	public LogEntry findById(int id) {
		return em.find(LogEntry.class, id);
	}

	@Override
	public LogEntry updateLog(LogEntry logEntry) {
		try {
			LogEntry managedLog = em.find(LogEntry.class, logEntry.getId());
			
			managedLog.setLogContent(logEntry.getLogContent());
			managedLog.setTitle(logEntry.getTitle());
			managedLog.setDiveDate(logEntry.getDiveDate());
			managedLog.setEntryTime(logEntry.getEntryTime());
			managedLog.setRating(logEntry.getRating());
			managedLog.setMaxDepthMeters(logEntry.getMaxDepthMeters());
			managedLog.setEquipment(logEntry.getEquipment());
			managedLog.setImageUrl(logEntry.getImageUrl());
			managedLog.setEndTime(logEntry.getEndTime());
			managedLog.setVisibility(logEntry.getVisibility());
			managedLog.setCreatedAt(logEntry.getCreatedAt());
			managedLog.setLastUpdated(logEntry.getLastUpdated());
			managedLog.setSite(logEntry.getSite());
			managedLog.setStartPressureBar(logEntry.getStartPressureBar());
			managedLog.setEndPressureBar(logEntry.getEndPressureBar());
			managedLog.setAirType(logEntry.getAirType());
			managedLog.setAttraction(logEntry.getAttraction());
			
			return managedLog;
			
		} catch (Exception e) {
			return null;
		}
	}

}
