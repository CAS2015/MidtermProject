<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!doctype html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Log Form</title>
<jsp:include page="bootstrapNavBarJSP/bootstrapHead.jsp" />
</head>
<body>
<!-- NavBar -->
<jsp:include page="bootstrapNavBarJSP/navBar.jsp" />

			<div class = "cover-image" > 
				<div class = "cover-txt mainTitle" >
				Deeper Dive
				</div> 
			</div>
			
	<form action="${update== true ? 'updateLog.do' : 'createLog.do'}" method="POST" id="createLog">
		
		<!-- Log Form -->
		<div class="pageContent logTable">
			<div class="newLog tableSectionLabel">
				
						<c:choose>
							<c:when test="${update == true }">
								Update Your Log
							</c:when>
							<c:otherwise>
								Add Your Log
							</c:otherwise>
						</c:choose>
				
			</div>
			<div class="createForm" >
			<label>Title:</label> 
			<input type="text" name="title" value="${log.title}"/>
			<br>
		
			<label for="diveSiteName">Dive Site Name:</label> <select id="diveSiteName" name="diveSiteName" >
			<c:forEach items="${sites}" var="diveSite">
				<option value="${diveSite.name}" ${(log.site.name == diveSite.name) ? "selected='selected'" : ""}>${diveSite.name}</option>
			</c:forEach>
			</select>
			<br>
			
			<label>Log Content:</label>
			<textarea name="logContent" form="createLog" rows="3" cols="80" >${log.logContent}</textarea>
			<br>
			<label>Dive Date:</label> 
			<input type="date" name="diveDate" value="${log.diveDate}"/>
			<br>
			<label>Entry Time:</label> 
			<input type="time" name="entryTime" value="${log.entryTime}"/>
			<br>
			<label>End Time:</label> 
			<input type="time" name="endTime" value="${log.endTime}"/>
			<br>

			<label for="rating">Rating:</label> <select id="rating" name="rating" >
				<option value="1" ${(log.rating == 1) ? "selected='selected'" : ""}>1</option>
				<option value="2" ${(log.rating == 2) ? "selected='selected'" : ""}>2</option>
				<option value="3" ${(log.rating == 3) ? "selected='selected'" : ""}>3</option>
				<option value="4" ${(log.rating == 4) ? "selected='selected'" : ""}>4</option>
				<option value="5" ${(log.rating == 5) ? "selected='selected'" : ""}>5</option>
			</select>
			<br> 
			<label>Max Depth (meters):</label> 
			<input type="number" name="maxDepthMeters" value="${log.maxDepthMeters}"/>
			<br> 
			<label>Equipment:</label> 
			<input type="text" name="equipment" value="${log.equipment}"/>
			<br> 
			
			<label>URL to your Photo:</label> 
			<input type="text" name="imageUrl" value="${log.imageUrl}"/>
			<br> 
			
			<label for="visibility">Visibility:</label>
			<select id="visibility" name="visibility" >
				<option value="poor" ${(log.rating == poor) ? "selected='selected'" : ""}>Poor</option>
				<option value="fair" ${(log.rating == fair) ? "selected='selected'" : ""}>Fair</option>
				<option value="excellent" ${(log.rating == excellent) ? "selected='selected'" : ""}>Excellent</option>
			</select> 
			<br>
			<label>Starting Pressure (bar):</label> 
			<input type="number" name="startPressureBar" value="${log.startPressureBar}"/>
			<br> 
			<label>Ending Pressure (bar):</label> 
			<input type="number" name="endPressureBar" value="${log.endPressureBar}"/>
			<br> 
			<label>Air Type:</label> 
			<c:choose>
			<c:when test="${update == true}">
				<input type="text" name="airType" value="${log.airType}"/><br>			
			</c:when> 
			<c:otherwise>
				<input type="text" name="airType" value="air, nitrox, etc."/><br>			
			</c:otherwise>
			</c:choose>
			<label>Attractions:</label>
			<textarea name="attraction" form="createLog" rows="3" cols="80" >${log.attraction}</textarea>
			<c:if test="${update == true }">
			<input type="hidden" name="id" value="${log.id}">
			</c:if>
			<!-- Submit Button  -->
			<br>
			<c:choose>
				<c:when test="${update == true }">
					<input class="buttonAlt" type="submit" value="Update Your Log" />
				</c:when>
				<c:otherwise>
					<input class="buttonAlt" type="submit" value="Submit Your Log" />
				</c:otherwise>
			</c:choose>
		</div>
			</div>
	</form>


<!-- Footer  -->
<jsp:include page="bootstrapNavBarJSP/bootstrapFoot.jsp" />
</body>
</html>