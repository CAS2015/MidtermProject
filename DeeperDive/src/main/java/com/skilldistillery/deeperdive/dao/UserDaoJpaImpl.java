package com.skilldistillery.deeperdive.dao;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.skilldistillery.deeperdive.entities.User;

@Service
@Transactional
public class UserDaoJpaImpl implements UserDAO {
	
	@PersistenceContext
	private EntityManager em;
	
	
	@Override
	public User findById(int userId) {
		return em.find(User.class, userId);
	}

	@Override
	public User create(User user) {
		String query = "SELECT u.id FROM User u WHERE u.username = :username";
		
		//Getting any users that already have that username
		int userNameInUser = em.createQuery(query).setParameter("username", user.getUsername())
		.getResultList().size();
		
		//If a user already has username, don't create user, otherwise create new user
		if(userNameInUser > 0) {
			return null;
		}
		else {
			em.persist(user);
			return user;		
		}
	}

	
}
