<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

#table td, #table th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table tr:nth-child(even) {
	background-color: #f2f2f2;
}

#table tr:hover {
	background-color: #ddd;
}

#table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Cart</title>
</head>
<body>

	<div class="container">
		<div class="jumbotron text-center">
			<h1>WELCOME TO GOOD TIME BOBBY'S
				${user.firstName}&nbsp;${user.lastName}</h1>
				<h2>${menuItem.itemName}</h2>
		</div>

	</div>
	THIS IS WHERE THE MODIFICATIONS WILL TAKE PLACE
</body>
</html>