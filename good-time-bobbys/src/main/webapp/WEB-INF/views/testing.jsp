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
/* Style the tab */
.tab {
	overflow: hidden;
	border: 1px solid #ccc;
	background-color: #f1f1f1;
	display: flex;
	justify-content: center;
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

.header {
	text-align: center;
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
	<div class="container">
		<div class="card">
			<table>
				<tr>
					<td>USER ID: ${user.userId}</td>
					<td>ORDER ID: ${orderID}</td>
					<td>MENU ITEM NAME: ${menuItem.itemName}</td>
				</tr>
			</table>
		</div>
	</div>
	
	<div class="container">
		<div class="card">
		<h3>Ingredients ADDED</h3>
			<table>
				<c:forEach var="eachIngredientAdded" items="${addedIngredientsByUser}">
					<tr>
						<td>${eachIngredientAdded.ingredientId}</td>
						<td>${eachIngredientAdded.ingredientName}</td>
						<td>${eachIngredientAdded.ingredientPrice}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>
	
	<div class="container">
		<div class="card">
		<h3>Ingredients REMOVED</h3>
			<table>
				<c:forEach var="eachIngredientAdded" items="${removedIngredientsByUser}">
					<tr>
						<td>${eachIngredientAdded.ingredientId}</td>
						<td>${eachIngredientAdded.ingredientName}</td>
						<td>${eachIngredientAdded.ingredientPrice}</td>
					</tr>
				</c:forEach>
			</table>
		</div>
	</div>


	<!-- 	<div class="container"> -->
	<!-- 		<div class="card"> -->
	<%-- 			<%-- 			<form:form action="orderDetails" method="post" --%>

	<%-- 			<%-- 				modelAttribute="orderID"> --%>

	<!-- 			<table> -->
	<!-- 				<tr> -->
	<%-- 					<td><c:forEach var="eachCheckbox" --%>
	<%-- 							items="${modifiedIngredientSet}"> --%>
	<!-- 							<tr> -->
	<%-- 								<td>${eachCheckbox.getIngredientName}</td> --%>
	<!-- 							</tr> -->
	<%-- 						</c:forEach></td> --%>
	<!-- 				</tr> -->
	<!-- 			</table> -->
	<!-- 		</div> -->

	<!-- 	</div> -->
</body>
</html>