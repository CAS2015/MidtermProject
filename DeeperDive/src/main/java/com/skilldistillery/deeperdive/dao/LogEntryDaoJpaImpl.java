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

}
