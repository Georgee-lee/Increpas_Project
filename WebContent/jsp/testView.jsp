<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Test View Page</title>
</head>
<body>

	<c:forEach var="vo" items="${list}" varStatus="idx">
		<h2>${vo.employee_id}</h2>
		<h2>${vo.last_name}</h2>
		<h2>${vo.job_id}</h2>
		<h2>${vo.salary}</h2>
	</c:forEach>
	
</body>
</html>