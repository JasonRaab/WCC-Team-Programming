<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover;
}

.floorbackground {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: repeat;
	background-position: center top;
	background-attachment: fixed;
	text-align: center;
	color: #ffffff;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
}
/* #table tr:nth-child(even) { */
/* 	background-color: #f2f2f2; */
/* } */
/* #table tr:hover { */
/* 	background-color: #ddd; */
/* } */
#table {
	font-family: Arial, Helvetica, sans-serif;
	border: none !important;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
	border-collapse: collapse;
}

#table th {
	border: none !important;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: middle;
	background-color: #04AA6D;
	color: white;
}

table.classname td {
	boarder: none !important;
}

#p {
	color: white;
}

.jumbotron {
	font-family: "Georgia", serif;
	font-size: 55px;
}

.header {
	text-align: center;
}
</style>
<meta charset="UTF-8">
<title>Create Account at Good Time Bobby's</title>
</head>
<body>

	<div class=" floorbackground">


		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1>GOOD TIME BOBBY'S</h1>
			</div>
			<h6>Please enter your info:</h6>
			<br> <br>
		</div>

		<form:form action="processUser" modelAttribute="user" method="post">
			<table class="container floorbackground">
				<tr>
					<td>First Name</td>
					<td><form:input path="firstName" /></td>
				</tr>
				<tr>
					<td>Last Name</td>
					<td><form:input path="lastName" /></td>
				</tr>
				<tr>
					<td>Email:</td>
					<td><form:input path="email" /></td>
				</tr>
				<tr>
					<td>Password:</td>
					<td><form:input path="password" /></td>
				</tr>

			</table>
			<br>
			<div>
				<input class="btn btn-outline-light btn-sm"
					style="text-align: center;" type="submit" value="Save Profile" />
			</div>
			<br>
			<a class="btn btn-outline-light btn-sm" href="${pageContext.request.contextPath}/">Cancel</a>
		</form:form>
	</div>
</body>
</html>