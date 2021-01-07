<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null) {

		response.sendRedirect("LoginForm.jsp");
	}
	%>
	<h1 align="center">Search Book By Author:</h1>
	<div align="center">

		<form action="searchAuthor">
			Author: <input type="text" name="author" value="" size="45">
			<input type="submit" value="OK">
		</form>
		<br>

	</div>
</body>
</html>