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

#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
}

.jumbotron {
	font-family: "Georgia", serif;
	font-size: 55px;
}

#table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}

#p {
	color: white;
}

.totals {
	font-size: 19px;
}

header.masthead {
	padding-top: 10.5rem;
	padding-bottom: 6rem;
	text-align: center;
	color: #ffffff;
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/palio-hero-3.png);
	background-repeat: no-repeat;
	background-attachment: fixed;
	background-position: center center;
	background-size: cover;
}
</style>
<meta charset="ISO-8859-1">
<title>Order Confirmation</title>
</head>
<body>
	<header class="masthead"></header>
	<div class="floorbackground">
		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1>THANK YOU FOR CHOOSING GOOD TIME BOBBY'S!</h1>
			</div>
			<div>
				<br>
				<h2>${user.firstName},&nbsp;your&nbsp;order&nbsp;will&nbsp;be&nbsp;ready&nbsp;for&nbsp;pick&nbsp;up&nbsp;in&nbsp;${randomPickupTime}&nbsp;minutes.</h2>
			</div>
		</div>
		<div class="card  floorbackground">
			<div class="table floorbackground">
				<div class="totals">
					<div>Subtotal: ${subTotal}</div>
					<div>Tax: ${orderTax}</div>
					<div>Total: ${orderTotal}</div>
				</div>
				<c:url var="login" value="/">
				</c:url>

				<div>

					<br> <a href="${login}" class="btn btn-outline-light btn-md"
						role="button" aria-pressed="true">Logout</a>
					<div style="display: none;">${closeSession}</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>