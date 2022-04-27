<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="UTF-8">
<style>
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover;
}

.jumbotron {
	font-family: "Georgia", serif;
	font-size: 33px;
	text-align: center;
}

.text {
	font-family: "Georgia", serif;
	font-size: 18px;
}

h4 {
	font-family: "Georgia", serif;
	font-size: 28px;

}

.floorbackground {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center top;
	background-attachment: fixed;
	text-align: center;
	color: #ffffff;
}

img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 140px;
	width: 220px;
	transform: translateY(15%);
}

.imgs {
	margin-top: auto;
	margin-left: auto;
	margin-right: auto;
	width: 100%;
	height: 50%;
}

.logopic {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/palio-hero-3.png);
	background-repeat: no-repeat;
	background-position: center top;
	text-align: center;
	color: blue;
}
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
}
/* Style the buttons that are used to open the tab content */
.tab button {
	background-color: inherit;
	float: left;
	border: none;
	outline: none;
	cursor: pointer;
	padding: 14px 16px;
	transition: 0.3s;
}
/* Change background color of buttons on hover */
.tab button:hover {
	background-color: #ddd;
}
/* Create an active/current tablink class */
.tab button.active {
	background-color: #ccc;
}
/* Style the tab content */
.tabcontent {
	display: none;
	padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
}

#table {
	border: none;
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

#table th {
	border: none;
	border-collapse: collapse;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
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
	height: auto;
	width: 100%;
}

.noborder {
	border: none !important;
}
</style>
<meta charset="ISO-8859-1">
<title>Sorry your login was invalid</title>
</head>
<body>
	<header class="masthead"></header>

	<div class="floorbackground">
		<h4 class="floorbackground jumbotron">Sorry, but you've
			either entered invalid credentials<br> or you do not have an account with<br>
			Good Time Bobby's.</h4>

		<div class=" floorbackground" style="text-align: center;">
		
		<br> <a href="${pageContext.request.contextPath}/"
				class="btn btn-outline-light btn-med" role="button"
				aria-pressed="true">Back to Login</a>

			 <a href="${pageContext.request.contextPath}/readOnlyMenu"
				class="btn btn-outline-light btn-med" role="button"
				aria-pressed="true">View Menu</a>

			<c:url var="addUser" value="/addUser"></c:url>

			<a href="${addUser}" class="btn btn-outline-light btn-med"
				role="button" aria-pressed="true">Sign Up</a>
		</div>
		
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<br>
	<div class="footer floorbackground">
			<table width="100%">
			<tbody>
				<tr>
					<td class="aligncenter content-block">Questions? Email <a
						href="mailto:">support@goodtimebobbys.inc</a>
					</td>
				</tr>
			</tbody>
		</table>
	</div>
	</div>
</body>
</html>