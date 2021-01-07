<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Table-Edition</title>
</head>
<body>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null) {

		response.sendRedirect("LoginForm.jsp");
	}
	%>
	<div align="center">
		<jsp:include page="/EditBar.jsp"></jsp:include>
		<br>
		<form action="editBook" method="post">
			<table border="1" cellpadding="4">
				<caption>Edit Books</caption>
				<tr>
					<th>Id:</th>
					<td>${requestScope.book.id}</td>
				</tr>
				<tr>
					<th>Name:</th>
					<td><input type="text" name="name" size="45"
						value="${requestScope.book.name}" /></td>
				</tr>
				<tr>
					<th>Author:</th>
					<td><input type="text" name="author" size="45"
						value="${requestScope.book.author}" /></td>
				</tr>
				<tr>
					<th>Price:</th>
					<td><input type="text" name="price"
						value="${requestScope.book.price}" size="45" /></td>
				</tr>
				<tr>
					<td colspan="2" align="center"><input type="submit"
						value="Save" /></td>
				</tr>
			</table>
		</form>
	</div>
	<h2>
		<a href="/ManagementBook/listBook">ComeBack</a>
	</h2>
</body>
</html>