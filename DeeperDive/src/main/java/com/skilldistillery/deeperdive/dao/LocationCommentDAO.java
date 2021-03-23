package com.skilldistillery.deeperdive.dao;

import java.util.List;

import com.skilldistillery.deeperdive.entities.LocationComment;

public interface LocationCommentDAO {

	LocationComment createLocationComment(LocationComment locationComment);
	LocationComment createLocationCommentResponse(LocationComment locationComment, Integer responseId);
	LocationComment findById(int id);
	List<LocationComment> findAllCommentsByLocation(int locationId);
	boolean removeLocationComment(LocationComment locationComment);
	
}
