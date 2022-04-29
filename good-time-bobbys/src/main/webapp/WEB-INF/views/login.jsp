<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

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
	font-size: 55px;
}

.text {
	font-family: "Georgia", serif;
	font-size: 18px;
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
}

.noborder {
	border: none !important;
}
</style>
<script type="text/javascript">
	function checkForm(form) {
		if (form.userEmail.value == "") {
			alert("Error: Username cannot be blank!");
			form.userEmail.focus();
			return false;
		} else if (form.password.value == "") {
			alert("Error: Please check that you've entered and confirmed your password!");
			form.password.focus();
			return false;
		}
		return true;
	}
</script>
<meta charset="ISO-8859-1">
<title>Welcome to Good Time Bobby's</title>
</head>


<!-- https://paliorestaurant.com/wp-content/uploads/2021/08/palio-hero-3.png -->

<body>
	<header class="masthead"></header>

	<div class=" floorbackground">
		<h1 class="floorbackground jumbotron"
			style="text-align: center; font-size: 55px;">
			WELCOME TO <br> GOOD TIME BOBBY'S
		</h1>

		<c:url var="loginConfirmation" value="loginConfirmation">
			<c:param name="orderID" value="${order.orderId}" />
		</c:url>

		<%-- 		<c:url var="loginConfirmation" value="loginConfirmation"> --%>
		<%-- 			<c:param name="orderID" value="${order.orderId}" /> --%>
		<%-- 		</c:url> --%>

		<form:form modelAttribute="orderID" action="loginConfirmation"
			onsubmit="return checkForm(this);">

			<div class="container floorbackground" style="text-align: center;">

				<label class="text col-1" for="userEmail">Email</label> <input
					class="col-2" type="text" placeholder="Enter your email"
					name="userEmail"> <br> <label class="text col-1"
					for="password">Password</label> <input class="col-2"
					type="password" placeholder="Enter Password" name="password">
				<input type="hidden" id="orderID" name="orderID"
					value="${order.orderId}" required></input>
			</div>
			<br>
			<div class=" floorbackground" style="text-align: center;">

				<button class="btn btn-outline-light btn-sm" type="submit">Login</button>

				<c:url var="addUser" value="/addUser">
					<%-- 	<c:param name="orderID" value="${order.orderId}" /> --%>
				</c:url>

				<a href="${addUser}" class="btn btn-outline-light btn-sm"
					role="button" aria-pressed="true">Sign Up</a> <a
					href="${pageContext.request.contextPath}/readOnlyMenu"
					class="btn btn-outline-light btn-sm" role="button"
					aria-pressed="true">View Menu</a>
			</div>
		</form:form>

		
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br>
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