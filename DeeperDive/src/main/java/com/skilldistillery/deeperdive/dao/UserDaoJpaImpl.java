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
	public User findByUsername(String username) {
		String query = "SELECT u FROM User u WHERE u.username = :username";
		
		try {
			User user = em.createQuery(query, User.class).setParameter("username", username).getResultList().get(0);
			return user;
		} catch (Exception e) {
			return null;
		}
		
	}

	@Override
	public User create(User user) {
		
		//Getting any users that already have that username
		boolean alreadyUsername = isValidUsername(user);
		
		//If a user already has username, don't create user, otherwise create new user
		if(alreadyUsername == false) {
			em.persist(user);
			return user;		
		}
		else {
			return null;
		}
	}

	@Override
	public boolean isValidUsername(User user) {

		if (findByUsername(user.getUsername()) == null) {
			return false;
		}
		else {
			return true;
		}
	}
	
	@Override
	public User login(String username, String password) {
		String query = "SELECT u FROM User u WHERE u.username = :username";
		User validUser = null;
		
		try {
			validUser = em.createQuery(query,User.class).setParameter("username", username).
					getResultList().get(0);
			
		} catch (Exception e) {
			System.out.println("********************* error catch");
			return null;
		}
		
		if(validUser == null || !validUser.getPassword().equals(password)) {
			System.out.println("********************if statement");
			return null;	
		}
		else {
			return validUser;
		}
		
	}

	
}
