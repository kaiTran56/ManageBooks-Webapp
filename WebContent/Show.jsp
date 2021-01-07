<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ManagementBook</title>
</head>
<body>
	<%
		response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
	if (session.getAttribute("user") == null) {

		response.sendRedirect("LoginForm.jsp");
	}
	%>
	<h1 align="center">Show Database of Book's Libary</h1>
	<h3 align="right"><jsp:include page="/LogoutFunction/Logout.jsp"></jsp:include></h3>
	<jsp:include page="/SearchBook.jsp"></jsp:include>
	<h2 color="red">
		<a href="UpdateForm.jsp">Update Books to Database</a>
	</h2>
	<h3 align="right"><jsp:include page="/EditBar.jsp"></jsp:include></h3>
	<div align="center">

		<table border="1" cellpadding="5">

			<caption>
				<h2>List of Books</h2>
			</caption>
			<tr>
				<th>Id</th>
				<th>Name</th>
				<th>Author</th>
				<th>Price</th>
				<th>Functions</th>
			</tr>
			<c:forEach var="book" items="${listBookServlet}">
				<tr>
					<td><c:out value="${book.id }" /></td>
					<td><c:out value="${book.name}" /></td>
					<td><c:out value="${book.author}" /></td>
					<td><c:out value="${book.price}" /></td>
					<td><a href="EditBook.jsp"
						<c:set var="bookId" value = "${book.id}" scope = "request"></c:set>>Edit

					</a> &nbsp;&nbsp;&nbsp;&nbsp;</td>
				</tr>

			</c:forEach>
		</table>
	</div>

</body>
</html>