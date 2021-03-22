<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log Form</title>
</head>
<body>

<h1>Log Form here! (YOU SHOULD REMOVE THIS)</h1>


<form action="createLog.do" method="POST" >
		<div class="newLog">
		<h4>Add Your Log </h4>
		</div>
		
		<div class="createALogForm">
		
		<label>Title:</label>
		<input type="text"  name="title"/><br> 
		<label>Log Content:</label>
		<input type="text" name="logContent"/><br> 
		<label>Dive Date:</label>
		<input type="date" name="diveDate"/><br> 
		<label>Entry Time:</label>
		<input type="date" name="entryTime"/><br> 
		<label>End Time:</label>
		<input type="date" name="endTime"/><br>
		 
		 <!-- input type submit might be wrong. Need to check how to pass the info  -->
		<label>Rating:</label>
		<select id="cars" name="rating">
    		<option value="1">1</option>
    		<option value="2">2</option>
    		<option value="3">3</option>
    		<option value="4">4</option>
    		<option value="5">5</option>
  		</select>
  		<input type="submit" name="rating">
   
		<label>Max Depth (meters):</label>
		<input type="number" name="maxDepthMeters"/><br> 
		<label>Equipment:</label>
		<input type="text"  name="equipment"/><br> 
		<label>Visibility:</label>
		
		<!-- xxxxxxxxxxxxxxxxxxxxxx -->
		
		<input type="text" name="logContent"/><br> 
		<label>Dive Date:</label>
		</div>
		<input type="hidden" name="created_at" value="PassLocalDateTime.Now()">
		<input type="hidden" name="last_updated" value="PassLocalDateTime.Now()">
		
		
		

		<input class="button" type="submit" value="Submit Your Log" />
	</form>


</body>
</html>