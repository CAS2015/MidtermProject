package com.skilldistillery.deeperdive.dao;

import com.skilldistillery.deeperdive.entities.LogComment;

public interface LogCommentDAO {

   LogComment createLogComment(LogComment logComment);
	
   boolean removeLogComment(LogComment logComment);
  
  LogComment findById(int id);
}
