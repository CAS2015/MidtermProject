package com.skilldistillery.deeperdive.dao;

import com.skilldistillery.deeperdive.entities.User;

public interface UserDAO {

	User findById(int userId);
	User findByUsername(String username);
	User create(User user);
	boolean isValidUsername(User user);
	User login(String username, String password);
	
}
