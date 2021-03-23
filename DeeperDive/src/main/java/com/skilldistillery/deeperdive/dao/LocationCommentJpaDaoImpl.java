package com.skilldistillery.deeperdive.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.LocationComment;


@Service
@Transactional
public class LocationCommentJpaDaoImpl implements LocationCommentDAO {

	
	@PersistenceContext
	EntityManager em;
	
	
	@Override
	public LocationComment createLocationComment(LocationComment locationComment, Integer responseId) {
		
		LocationComment	originalComment = em.find(LocationComment.class, responseId);
		
		if(originalComment != null) {
		locationComment.setOriginalPost(originalComment);	
		}
		
		em.persist(locationComment);
		
		return locationComment;
	}

	@Override
	public LocationComment findLocationCommentById(int id) {
		return em.find(LocationComment.class, id);
	}

	@Override
	public List<LocationComment> findAllCommentsByLocation(int locationId) {

		List<LocationComment> locationComments;
		String jpql = "SELECT lc FROM LocationComments lc WHERE lc.id = :locationId";
		locationComments = em.createQuery(jpql, LocationComment.class).setParameter("locationId", locationId).getResultList();
		
		return locationComments;
	}

}
