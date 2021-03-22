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
	public void createLogComment(LogComment logComment) {

		
		
		
	}

}
