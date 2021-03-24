package com.skilldistillery.deeperdive.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.LogComment;

@Service
@Transactional
public class LogCommentJpaDaoImpl implements LogCommentDAO {
	
	@PersistenceContext
	EntityManager em;
	
	
	@Override
	public LogComment createLogComment(LogComment logComment) {
		em.persist(logComment);
		return logComment;
	}


	@Override
	public boolean removeLogComment(LogComment logComment) {

	 em.remove(logComment);
	
	 if(em.contains(logComment)) {
		 return false;
	 }
	 else {
		 return true;
	 }
		
	}


	@Override
	public LogComment findById(int id) {
		
		LogComment logComment = em.find(LogComment.class, id);
		
		return logComment;
	}

	
	
}
