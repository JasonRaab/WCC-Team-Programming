<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">
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
<title>Process Order</title>
</head>
<body>
	<div class="container">
		<h1>Process Order</h1>
		<div class="card">
			<table class="table">
				<c:forEach var="eachItem" items="${itemsOrderedList}">

					<tr>
						<td>${eachItem.itemNumber}</td>
						<td></td>
						<td>${eachItem.menuItem.getItemId()}</td>
						<td>${eachItem.menuItem.getItemName()}</td>
						<c:if test="${eachItem.modification == 1}">
							<td>Add: ${eachItem.ingredientId}</td>
						</c:if>
						<c:if test="${eachItem.modification == 0}">
							<td>Remove: ${eachItem.ingredientId}</td>
						</c:if>

						<td>$${eachItem.menuItem.getItemPrice()}</td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
				<c:forEach var="eachItem" items="${sendItemOrderedList}">

					<tr>
						<td>${eachItem.getMenuItem().getItemNumber()}</td>
						<td></td>
						<td>${eachItem.getMenuItem().getItemId()}</td>
						<td>${eachItem.getMenuItem().getItemName()}</td>
						<td></td>
						<%-- 						<td>${eachItem.itemDescription}</td> --%>
						<td>$${eachItem.getMenuItem().getItemPrice()}</td>
						<td></td>
						<td></td>
					</tr>
				</c:forEach>
				<tr>

					<td></td>
					<td></td>
					<td></td>
					<td></td>
					<td><a href="${sendOrderToDatabase}"
						class="btn btn-primary btn-sm active">Send to Kitchen!</a></td>
					<td></td>
					<td></td>
				</tr>
			</table>
		</div>
	</div>


</body>
</html>