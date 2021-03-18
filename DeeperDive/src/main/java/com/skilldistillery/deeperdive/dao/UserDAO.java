package com.skilldistillery.deeperdive.dao;

import com.skilldistillery.deeperdive.entities.User;

public interface UserDAO {

	User findById(int userId);
	
	
}
