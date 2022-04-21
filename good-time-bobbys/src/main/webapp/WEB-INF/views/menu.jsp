<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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
	*/
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
	*/
}

@import
	url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

body {
	background: #272727;
	font-family: "Montserrat", sans-serif;
}

.images {
	margin-top: 6px;
	display: flex;
	flex-wrap: wrap;
	@
	include
	sp-layout
	{
	justify-content
	:
	center;
}

}
img {
	display: block;
	margin-left: auto;
	margin-right: auto;
	height: 140px;
	width: 220px;
	transform: translateY(15%);
}

/* .tabcontent  {
  position: absolute;
  top: 50%;
  left: 50%;
  -webkit-transform: translate(-50%, -50%);
  transform: translate(-50%, -50%);
}

.tabcontent a {
  color: #f6f4e6;
  text-decoration: none;
  font-size: 1.2em;
  text-transform: uppercase;
  font-weight: 500;
  display: inline-block;
  width: 80px;
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.tabcontent a:hover {
  color: #fddb3a;
}

.tabcontent .dot {
  width: 6px;
  height: 6px;
  background: #fddb3a;
  border-radius: 50%;
  opacity: 0;
  -webkit-transform: translateX(30px);
  transform: translateX(30px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
}

.tabcontent a:nth-child(1):hover ~ .dot {
  -webkit-transform: translateX(30px);
  transform: translateX(30px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.tabcontent a:nth-child(2):hover ~ .dot {
  -webkit-transform: translateX(110px);
  transform: translateX(110px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.tabcontent a:nth-child(3):hover ~ .dot {
  -webkit-transform: translateX(200px);
  transform: translateX(200px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}

.tabcontent a:nth-child(4):hover ~ .dot {
  -webkit-transform: translateX(285px);
  transform: translateX(285px);
  -webkit-transition: all 0.2s ease-in-out;
  transition: all 0.2s ease-in-out;
  opacity: 1;
}
 */
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
			<h2>Order ID: ${orderID}</h2>
			<%-- 			<h3>Order ID: ${order.orderId}</h3> --%>
		</div>

	</div>
	<div style="text-align: center;">
		<c:url var="cart" value="/cart">
			<c:param name="userID" value="${user.userId}" />
			<c:param name="orderID" value="${orderID}" />
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
				<div class="dot"></div>
			</div>


			<!-- TAB CONTENT -->
			<div id="Apps" class="tabcontent">
				<h3 class="header">APPS</h3>
				<div class="card">
					<div>
						<div class="image" data-label="MozSticks">
							<img
								src="https://sp-ao.shortpixel.ai/client/q_glossy,ret_img,w_700/https://thefoodcafe.com/wp-content/uploads/2018/04/Mozzarella-Sticks-5.jpg"
								alt="">
						</div>
						<!-- 	<div class="image" data-label="BonelessWings">
							<img
								src="https://hips.hearstapps.com/hmg-prod.s3.amazonaws.com/images/arby-s-6pcbonelessbuffalowings-1607022729.jpg?resize=768:*"
								alt="">
						</div> -->
					</div>
					<br>
					<table class="table">
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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
										class="btn btn-primary btn-sm active">Add to Order</a> <input
										type="hidden" id="orderID" name="orderID"
										value="${order.orderId}"></td>
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
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
							</c:url>
							<tr>
								<c:if test="${eachItem.itemCategory.equals('Salad')}">
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
			<div id="Sandwiches" class="tabcontent">
				<h3 class="header">SANDWICHES</h3>
				<div class="card">
					<table class="table">
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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
						<c:forEach var="eachItem" items="${fullMenuItemList}">
							<c:url var="addToCartLink" value="/addMenuItemToCart">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
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