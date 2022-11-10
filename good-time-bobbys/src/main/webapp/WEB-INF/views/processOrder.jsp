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
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover
}
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
	border: none !important;
	border-top: none;
	color: #ffffff;
}

.header {
	text-align: center;
}

.textcolor {
	color: #ffffff;
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

.jumbotron {
	font-family: "Georgia", serif;
	font-size: 55px;
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
	<header class="masthead"></header>

	<div class="floorbackground">
		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1>THANK YOU FOR CHOOSING GOOD TIME BOBBY'S!</h1>
				<br>
				<h2>Order Number: ${orderID}</h2>
				<h4>Subtotal: ${subTotal}</h4>
				<h4>Tax: ${orderTax}</h4>
				<h4>Total: ${orderTotalWithTax}</h4>
				<%-- 			<h3>Order ID: ${order.orderId}</h3> --%>
			</div>
		</div>

		<div class="container floorbackground">
			<div class="card floorbackground">
				<div>
					<div class="container floorbackground">
						<h4>Click the links below to view your edits!</h4>
						<br>
						<div class="tab floorbackground">
							<button class="tablinks floorbackground"
								onclick="openItemOrdered(event, '1')">First Item</button>
							<button class="tablinks floorbackground"
								onclick="openItemOrdered(event, '2')">Second Item</button>
							<button class="tablinks floorbackground"
								onclick="openItemOrdered(event, '3')">Third Item</button>
							<button class="tablinks floorbackground"
								onclick="openItemOrdered(event, '4')">Fourth Item</button>
						</div>
					</div>
				</div>
				<div id="1" class="tabcontent floorbackground">
					<h3 class="header"></h3>
					<div class="card floorbackground">
						<table class="table floorbackground">
							<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
								<c:if test="${eachItemOrder.itemNumber == 1}">
									<tr>
										<td></td>
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
				<div id="2" class="tabcontent floorbackground">
					<h3 class="header floorbackground"></h3>
					<div class="card floorbackground">
						<table class="table floorbackground">
							<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
								<c:if test="${eachItemOrder.itemNumber == 2}">
									<tr>
										<td></td>
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
				<div id="3" class="tabcontent floorbackground">
					<h3 class="header floorbackground"></h3>
					<div class="card floorbackground">
						<table class="table floorbackground">
							<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
								<c:if test="${eachItemOrder.itemNumber == 3}">
									<tr>
										<td></td>
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
				<div id="4" class="tabcontent floorbackground">
					<h3 class="header floorbackground"></h3>
					<div class="card floorbackground">
						<table class="table floorbackground">
							<c:forEach var="eachItemOrder" items="${allItemsOrdered}">
								<c:if test="${eachItemOrder.itemNumber == 4}">
									<tr>
										<td></td>
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
				<br> <br>
				<div class="floorbackground">
					<c:url var="confirmation" value="/confirmation">
						<c:param name="userID" value="${userID}" />
						<c:param name="orderID" value="${orderID}" />
						<c:param name="subTotal" value="${subTotal}" />
						<c:param name="orderTax" value="${orderTax}" />
						<c:param name="orderTotalWithTax" value="${orderTotalWithTax}" />
						<%--                 <c:param name="allItemsOrdered" value="${allItemsOrdered}" /> --%>
					</c:url>
					<a href="${confirmation}" class="btn btn-outline-light"
						role="button" aria-pressed="true">Complete Order</a>
				</div>
			</div>
		</div>
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