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

<form:form action="createLog.do" modelAttribute="logEntry"  method="POST">
		<table>
			<tr>
				<td>Title:</td>
				<td><form:input path="title"/>
				</td>
			</tr>
			<tr>
				<td>Log Content:</td>
				<td><form:input path="log_content"/>
				</td>
			</tr>
			<tr>
				<td>Dive Date:</td>
				<td><form:input path="dive_date"/>
				</td>
			</tr>
			<tr>
				<td>Dive Entry Time:</td>
				<td><form:input path="entry_time"/>
				</td>
			</tr>
			<tr>
				<td>Dive End Time:</td>
				<td><form:input path="end_time"/>
				</td>
			</tr>
			<tr>
				<td>Rating:</td>
				<!-- Constrains of 1 to 5 -->
				<td><form:input path="rating"/>
				</td>
			</tr>
			<tr>
				<td>Max Depth in Meters:</td>
				<td><form:input path="max_depth_meters"/>
				</td>
			</tr>
			<tr>
				<td>Equipment</td>
				<td><form:input path="equipment"/>
				</td>
			</tr>
			<tr>
				<td>Photos (add URL link)</td>
				<td><form:input path="img_url"/>
				</td>
			</tr>
			<tr>
				<td>Visibility</td>
				<td><form:input path="visibility"/>
				</td>
			</tr>
			<tr>
				<td>Starting Pressure (bar)</td>
				<td><form:input path="start_pressure_bar"/>
				</td>
			</tr>
			<tr>
				<td>Ending Pressure (bar)</td>
				<td><form:input path="end_pressure_bar"/>
				</td>
			</tr>
			<tr>
				<td>Air Type</td>
				<td><form:input path="air_type"/>
				</td>
			</tr>
			<tr>				
				<td><form:input type="hidden" path="created_at" value ="${logEntry.###_PassLocalDateTime.Now()}"/>
				</td>
			</tr>
			<tr>				
				<td><form:input type="hidden" path="last_updated" value ="${logEntry.###_PassLocalDateTime.Now()}"/>
				</td>
			</tr>	
			<!-- Submit -->
			<tr>
				<td><input type="submit" value="Log Submit"/>
				</td>
			</tr>
		</table>		
</form:form>


</body>
</html>