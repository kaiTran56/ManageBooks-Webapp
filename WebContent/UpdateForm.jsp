<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>


<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Table-Update</title>
</head>

<body>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null) {

		response.sendRedirect("LoginForm.jsp");
	}
	%>

	<h1>Update Books to DataBases</h1>


	<div align="center">
		<form action="updateBook" method="post">
			<table border="1" cellpadding="4">
				<caption>Update Books</caption>
				<tr>
					<th>Id:</th>
					<td><input type="text" name="id" size="45" value="" /></td>
				</tr>
				<tr>
					<th>Name:</th>
					<td><input type="text" name="name" size="45" value="" /></td>
				</tr>
				<tr>
					<th>Author:</th>
					<td><input type="text" name="author" size="45" value="" /></td>
				</tr>
				<tr>
					<th>Price:</th>
					<td><input type="text" name="price" value="" size="45" /></td>
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