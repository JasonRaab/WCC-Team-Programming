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
<script>
	function openItemOrdered(evt, menuItemCategory) {
		// Declare all variables
		var i, tabcontent, tablinks;

		// Get all elements with class="tabcontent" and hide them
		tabcontent = document.getElementsByClassName("tabcontent");
		for (i = 0; i < tabcontent.length; i++) {
			tabcontent[i].style.display = "none";
		}

		// Get all elements with class="tablinks" and remove the class "active"
		tablinks = document.getElementsByClassName("tablinks");
		for (i = 0; i < tablinks.length; i++) {
			tablinks[i].className = tablinks[i].className
					.replace(" active", "");
		}

		// Show the current tab, and add an "active" class to the button that opened the tab
		document.getElementById(menuItemCategory).style.display = "block";
		evt.currentTarget.className += " active";
	}
</script>
<meta charset="ISO-8859-1">
<title>Process Order</title>
</head>
<body>

	<div class="container">
		<div class="jumbotron text-center">
			<h1>
				Hey ${user.firstName}, <br> THANK YOU FOR CHOOSING GOOD TIME
				BOBBY'S!
			</h1>
			<br>
			<h2>Order Number: ${orderID}</h2>
			<h4>Subtotal: ${orderTotalWithoutTax}</h4>
			<h4>Tax: ${orderTotalTax}</h4>
			<h4>Total: ${orderTotalWithTax}</h4>
			<%-- 			<h3>Order ID: ${order.orderId}</h3> --%>
		</div>
	</div>

	<div class="container">
		<div class="card">
			<div>
				<div class="container">
					<div class="tab">
						<button class="tablinks" onclick="openItemOrdered(event, '1')">Item
							1</button>
						<button class="tablinks" onclick="openItemOrdered(event, '2')">Item
							2</button>
						<button class="tablinks" onclick="openItemOrdered(event, '3')">Item
							3</button>
						<button class="tablinks" onclick="openItemOrdered(event, '4')">Item
							4</button>
					</div>
				</div>
			</div>
			<!-- TAB CONTENT -->
			<div id="1" class="tabcontent">
				<h3 class="header">Item 1</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
							<c:if test="${eachItemOrder.itemNumber == 1}">
								<tr>
									<td>${eachItemOrder.itemNumber}</td>
									<td>${eachItemOrder.getMenuItemName()}</td>
									<td>${eachItemOrder}<c:if
											test="${not empty eachItemOrder.getIngredientId()}">
								${ingredientDAO.getIngredientNameByID(eachItemOrder.getIngredientId())}
								<c:if test="${eachItemOrder.modification == 1}">
								 &nbsp;+ $${ingredientDAO.getIngredientPriceByID(eachItemOrder.getIngredientId())}
								 </c:if>
										</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="2" class="tabcontent">
				<h3 class="header">Item 2</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
							<c:if test="${eachItemOrder.itemNumber == 2}">
								<tr>
									<td>${eachItemOrder.itemNumber}</td>
									<td>${eachItemOrder.getMenuItemName()}</td>
									<td>${eachItemOrder}<c:if
											test="${not empty eachItemOrder.getIngredientId()}">
								${ingredientDAO.getIngredientNameByID(eachItemOrder.getIngredientId())}
								<c:if test="${eachItemOrder.modification == 1}">
								 &nbsp;+ $${ingredientDAO.getIngredientPriceByID(eachItemOrder.getIngredientId())}
								 </c:if>
										</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="3" class="tabcontent">
				<h3 class="header">Item 3</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
							<c:if test="${eachItemOrder.itemNumber == 3}">
								<tr>
									<td>${eachItemOrder.itemNumber}</td>
									<td>${eachItemOrder.getMenuItemName()}</td>
									<td>${eachItemOrder}<c:if
											test="${not empty eachItemOrder.getIngredientId()}">
								${ingredientDAO.getIngredientNameByID(eachItemOrder.getIngredientId())}
								<c:if test="${eachItemOrder.modification == 1}">
								 &nbsp;+ $${ingredientDAO.getIngredientPriceByID(eachItemOrder.getIngredientId())}
								 </c:if>
										</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="4" class="tabcontent">
				<h3 class="header">Item 4</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
							<c:if test="${eachItemOrder.itemNumber == 4}">
								<tr>
									<td>${eachItemOrder.itemNumber}</td>
									<td>${eachItemOrder.getMenuItemName()}</td>
									<td>${eachItemOrder}<c:if
											test="${not empty eachItemOrder.getIngredientId()}">
								${ingredientDAO.getIngredientNameByID(eachItemOrder.getIngredientId())}
								<c:if test="${eachItemOrder.modification == 1}">
								 &nbsp;+ $${ingredientDAO.getIngredientPriceByID(eachItemOrder.getIngredientId())}
								 </c:if>
										</c:if></td>
								</tr>
							</c:if>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>