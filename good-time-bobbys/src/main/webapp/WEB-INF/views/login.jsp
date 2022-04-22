<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
<meta charset="UTF-8">
<style>
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover
}


.floorbackground {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: repeat;
	background-position: center top;
	text-align: center;
	color: #ffffff;
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

#table td, #table th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
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
<title>Insert title here</title>
</head>
<body>
	<div class=" floorbackground">
		<h1 class=" floorbackground" style="text-align: center;">Welcome to good time bobbys</h1>
		<div class="container floorbackground" style="text-align: center;">
			<label for="uname"><b>Username</b></label> <input type="text"
				placeholder="Enter Username" name="uname"> <br> <label
				for="psw"><b>Password</b></label> <input type="password"
				placeholder="Enter Password" name="psw">
		</div>
		<br>
		<div class=" floorbackground" style="text-align: center;">
			<a href="${pageContext.request.contextPath}/showUsers"
				class="btn btn-primary btn-sm active" role="button"
				aria-pressed="true">Login</a> <a
				href="${pageContext.request.contextPath}/readOnlyMenu"
				class="btn btn-primary btn-sm active" role="button"
				aria-pressed="true">View Menu</a>
		</div>
		<br> <br>
		<div class="container floorbackground">
			<div class="card floorbackground">
				<table class="table floorbackground">
					<c:forEach var="eachUser" items="${users}">
						<c:url var="loginLink" value="menu">
							<c:param name="userID" value="${eachUser.userId}" />
							<c:param name="orderID" value="${order.orderId}" />
						</c:url>
						<tr>
							<td><a href="${loginLink}">Login as
									${eachUser.firstName} </a></td>
						</tr>

					</c:forEach>
				</table>
			</div>
		</div>
	</div>
</body>
</html>