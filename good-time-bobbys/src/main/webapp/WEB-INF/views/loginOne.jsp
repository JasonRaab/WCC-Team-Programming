<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome page</title>
</head>
<body>
	<h1>Welcome to good time bobbys</h1>
	<div class="container">
		<label for="uname"><b>Username</b></label> <input type="text"
			placeholder="Enter Username" name="uname"> <br> <label
			for="psw"><b>Password</b></label> <input type="password"
			placeholder="Enter Password" name="psw">
	</div>
	<br>
	<div>
		<a href="${pageContext.request.contextPath}/showUsers"
			class="btn btn-primary btn-sm active" role="button"
			aria-pressed="true">Login</a>
	</div>
</body>
</html>