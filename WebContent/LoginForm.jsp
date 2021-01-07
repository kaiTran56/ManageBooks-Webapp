<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Login</title>
</head>
<body>
	<div align="center">
		<h1>
			<em>Login to The Libary</em>
		</h1>
		<form action="login" method="post">
			<table border="1" cellpadding="3">
				<tr>
					<th>Username:</th>
					<td><input type="text" name="user" value="" size="45" /></td>
				</tr>
				<tr>
					<th>Password:</th>
					<td><input type="password" name="password" value="" size="45" /></td>
				</tr>
				<tr>

					<td colspan="2" align="center"><input type="submit" value="Ok"
						size="45" /></td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>