<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Log Form</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="navBar.jsp" />

	<form action="createLog.do" method="POST" id="createLog">
		<div class="newLog">
			<h4>Add Your Log</h4>
		</div>
		
		<!-- Log Form -->
		<div class="createALogForm">
			<label>Title:</label> 
			<input type="text" name="title"/><br>
			
			<label>Dive Site Name:</label> 
			<input type="text" name="diveSiteName"/><br>
			
			<label>Log Content:</label>
			<textarea name="logContent" form="createLog" rows="3" cols="80"></textarea>
			<label>Dive Date:</label> 
			<input type="date" name="diveDate"/><br>
			<label>Entry Time:</label> 
			<input type="time" name="entryTime"/><br>
			<label>End Time:</label> 
			<input type="time" name="endTime"/><br>

			<label for="rating">Rating:</label> <select id="rating" name="rating">
				<option value="1">1</option>
				<option value="2">2</option>
				<option value="3">3</option>
				<option value="4">4</option>
				<option value="5">5</option>
			</select>
			<br> 
			<label>Max Depth (meters):</label> 
			<input type="number" name="maxDepthMeters"/><br> 
			<label>Equipment:</label> 
			<input type="text" name="equipment"/><br> 
			
			<label>URL to your Photo:</label> 
			<input type="text" name="imageUrl"/><br> 
			
			<label for="visibility">Visibility:</label>
			<select id="visibility" name="visibility">
				<option value="Poor">Poor</option>
				<option value="Fair">Fair</option>
				<option value="Excellent">Excellent</option>
			</select> 
			<label>Starting Pressure (bar):</label> 
			<input type="number" name="startPressureBar"/><br> 
			<label>Ending Pressure (bar):</label> 
			<input type="number" name="endPressureBar"/><br> 
			<label>Air Type:</label> 
			<input type="text" name="airType" value="air, nitrox, etc."/><br>			
			<label>Attractions:</label>
			<textarea name="attraction" form="createLog" rows="3" cols="80"></textarea>
			
			<!-- Submit Button  -->
			<input class="button" type="submit" value="Submit Your Log" />
		</div>
	</form>


<!-- Footer  -->
<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>