
<%
	response.setHeader("Cache-control", "no-cache, no-store, must-revalidate");
if (session.getAttribute("user") == null) {

	response.sendRedirect("LoginForm.jsp");
}
%>
<form action="showEdit">
	Edit By Id:<input type="text" name="id" value="${requestScope.bookId}"
		size="15"> <input type="submit" value="OK">
</form>
