package com.skilldistillery.deeperdive.dao;

import java.util.List;

import com.skilldistillery.deeperdive.entities.LocationComment;

public interface LocationCommentDAO {

	LocationComment createLocationComment(LocationComment locationComment, Integer responseId);
	LocationComment findLocationCommentById(int id);
	List<LocationComment> findAllCommentsByLocation(int locationId);
	
}
