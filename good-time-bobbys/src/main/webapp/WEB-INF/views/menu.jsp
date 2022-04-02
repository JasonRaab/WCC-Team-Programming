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
	function openMenu(evt, menuItemCategory) {
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
<title>Good Time Bobby's Menu</title>
</head>
<body>


	<div class="container">
		<div class="jumbotron text-center">
			<h1>WELCOME TO GOOD TIME BOBBY'S
				${user.firstName}&nbsp;${user.lastName}</h1>
				<h2>Order ID: ${newOrder.orderId}</h2>
		</div>

	</div>
	<div style="text-align: center;">
		<c:url var="cart" value="/itemIdList">
			<c:param name="userID" value="${user.userId}" />
		</c:url>
		<a href="${cart}" style="text-align: center;"
			class="btn btn-primary btn-lg active">View Cart</a>
	</div>
	<div style="text-align: center;">
		<h6>View Cart to modify item*</h6>
	</div>
	<br>
	<div>

		<div class="container">
			<div class="tab">
				<button class="tablinks" onclick="openMenu(event, 'Apps')">Apps</button>
				<button class="tablinks" onclick="openMenu(event, 'Salads')">Salads</button>
				<button class="tablinks" onclick="openMenu(event, 'Sides')">Sides</button>
				<button class="tablinks" onclick="openMenu(event, 'Sandwiches')">Sandwiches</button>
				<button class="tablinks" onclick="openMenu(event, 'Entrees')">Entrees</button>
				<button class="tablinks" onclick="openMenu(event, 'Desserts')">Desserts</button>
				<button class="tablinks" onclick="openMenu(event, 'Beverages')">Beverages</button>
			</div>


			<!-- TAB CONTENT -->
			<div id="Apps" class="tabcontent">
				<h3 class="header">APPS</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Appetizer')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
									<td></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Salads" class="tabcontent">
				<h3 class="header">SALADS</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Salad')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<c:forEach var="eachIngredient"
										items="${eachItem.getIngredients()}">
										<c:if test="${eachIngredient.isActive == 1}">
											<td>${eachIngredient.ingredientName}</td>
										</c:if>
									</c:forEach>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Sandwiches" class="tabcontent">
				<h3 class="header">SANDWICHES</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Sandwich')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Entrees" class="tabcontent">
				<h3 class="header">ENTREES</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Entree')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>

								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Desserts" class="tabcontent">
				<h3 class="header">DESSERTS</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Dessert')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Sides" class="tabcontent">
				<h3 class="header">SIDES</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Side')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
			<div id="Beverages" class="tabcontent">
				<h3 class="header">BEVERAGES</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${menuItem}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Beverage')}">
									<td>${eachItem.itemId}</td>
									<td>${eachItem.itemName}</td>
									<td>${eachItem.itemDescription}</td>
									<td><c:forEach var="eachIngredient"
											items="${eachItem.getIngredients()}">
											<c:if test="${eachIngredient.isActive == 1}">
											${eachIngredient.ingredientName},
									</c:if>
										</c:forEach></td>
									<td>$${eachItem.itemPrice}</td>
									<td><a href="${addToCartLink}"
										class="btn btn-primary btn-sm active">Add to Order</a></td>
								</c:if>
							</tr>
						</c:forEach>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>