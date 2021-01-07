<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Search</title>
<style type="text/css">
#show {
	color: red;
}
</style>
</head>
<body>

	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null) {

		response.sendRedirect("LoginForm.jsp");
	}
	%>

	<div align="center">
		<br>
		<h1 id="show">Show Search</h1>
		<br>
		<jsp:include page="/SearchBook.jsp"></jsp:include>
		<table border="1" cellpadding="4">

			<caption>List of Books</caption>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Author</th>
				<th>Price</th>
			</tr>
			<c:forEach var="creater" items="${listBookAuthor}">
				<tr>
					<td><c:out value="${creater.id }" /></td>
					<td><c:out value="${creater.name}" /></td>
					<td><c:out value="${creater.author}" /></td>
					<td><c:out value="${creater.price}" /></td>

				</tr>

			</c:forEach>

		</table>
		<h2>
			<a href="/ManagementBook/listBook">ComeBack</a>
		</h2>
	</div>
</body>
</html>