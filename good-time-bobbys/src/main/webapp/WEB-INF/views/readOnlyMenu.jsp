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
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<style>
* {
	box-sizing: border-box;
}

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
	background-attachment: fixed;
	text-align: center;
	color: #ffffff;
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
	color: #ffffff;
	*/
}

@import
	url("https://fonts.googleapis.com/css2?family=Montserrat:wght@400;500;600;700&display=swap")
	,
	/* 	("https://sp-ao.shortpixel.ai/client/q_glossy,ret_img,w_210/https://thefoodcafe.com/wp-content/uploads/2017/12/Detox-salad-3-210x267.jpg"); */
	* { margin
	:
	0;

padding


:



0



;
-webkit-box-sizing




:border-box



;
box-sizing



:border-box




;
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

.header {
	text-align: center;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
}

#table {
	font-family: Arial, Helvetica, sans-serif;
	border: none !important;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
	border-collapse: collapse;
}

#table th {
	border: none !important;
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}

table.classname td {
	boarder: none !important;
}

#p {
	color: white;
}

.img-container {
	float: left;
	width: 33.33%;
	padding: 5px;
}

.image_floorbackground::after {
	content: "";
	clear: both;
	display: table;
}

.zoom_box img {
	transition: 0.5s all ease-in-out;
}

.zoom_box:hover img {
	transform: scale(1.2);
}

.jumbotron {
	font-family: "Georgia", serif;
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

	<div class="floorbackground">
		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1 style="font-size: 52px;">GOOD TIME BOBBY'S</h1>
			</div>
		</div>
		<div style="text-align: center;">
			<a href="${pageContext.request.contextPath}/"
				class="btn btn-outline-light btn-sm" role="button"
				aria-pressed="true">Back to Login</a>
		</div>

		<br>
		<div>
			<div class="container floorbackground">
				<div class="tab floorbackground">
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Apps')">Apps</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Salads')">Salads</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Sides')">Sides</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Sandwiches')">Sandwiches</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Entrees')">Entrees</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Desserts')">Desserts</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Beverages')">Beverages</button>
					<div class="dot"></div>
				</div>


				<!-- TAB CONTENT -->
				<div id="Apps" class="tabcontent floorbackground">
					<h3 class="header floorbackground">Appetizers</h3>
					<div class="card floorbackground table">
						<div class="table floorbackground">
							<div class="image floorbackground" data-label="MozSticks">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://sp-ao.shortpixel.ai/client/q_glossy,ret_img,w_700/https://thefoodcafe.com/wp-content/uploads/2018/04/Mozzarella-Sticks-5.jpg"
											alt="Moz">
									</div>
								</div>
							</div>

							<div class="img-container">
								<div class="zoom_box">
									<img style="border-radius: 2px;" class="desc" alt="onionRings"
										src="https://www.spoonforkbacon.com/wp-content/uploads/2021/08/onion-rings-recipe-card.jpg"
										style="width: 55%">
								</div>
							</div>
							<div class="img-container">
								<div class="zoom_box">
									<img alt="wings" style="border-radius: 2px;" class="desc"
										src="https://cdn.cdkitchen.com/recipes/images/2018/08/2449-8317-mx.jpg">
									<!--  src="https://www.macheesmo.com/wp-content/uploads/2017/01/Real-Boneless-Wings-Featire.jpg">-->

								</div>
							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Appetizer')}">
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Salads" class="tabcontent floorbackground">
					<h3 class="header floorbackground">SALADS</h3>
					<div class="card floorbackground table">
						<div class="table floorbackground">
							<div class="image_floorbackground" data-label="salad">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://images.unsplash.com/photo-1512621776951-a57141f2eefd?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://www.dontsweattherecipe.com/wp-content/uploads/2018/07/Southwest-Chicken-Salad-04.jpg"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://www.redrobinpa.com/wp-content/uploads/2018/10/Avocobbo.jpg"
											alt="" />
									</div>
								</div>

							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Salad')}">
										<td></td>
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Sandwiches" class="tabcontent floorbackground">
					<h3 class="header floorbackground">SANDWICHES</h3>
					<div class="card floorbackground">
						<div class="table floorbackground">

							<div class="image_floorbackground" data-label="burger">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://www.thespruceeats.com/thmb/qT80VQhdqI-CJJEslI0Nn58XGAY=/4048x2277/smart/filters:no_upscale()/fried-shrimp-po-boy-sandwich-recipe-3052296-hero-01-2a4bfabd36244ea483544e585113cb32.jpg"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://www.wasserstrom.com/blog/wp-content/uploads/2019/06/you-should-know-what-is-the-impossible-burger-banner-1-1024x560.jpg"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://recipesnow.com/wp-content/uploads/2016/08/22e6a07339cd9e84e4a0d3cd61b6c3b3.jpg"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://insanelygoodrecipes.com/wp-content/uploads/2020/06/BLT-Sanwich-1024x536.png"
											alt="" />
									</div>
								</div>

								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://topsecretrecipes.com/images/product/red-robin-burnin-love-burger-copycat-recipe-new.jpg"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src=https://media.istockphoto.com/photos/bacon-burger-picture-id520215281?k=20&m=520215281&s=612x612&w=0&h=kD__ABaZrMo2DqW8huIMfuJ-GCW25pGK6KzgJ9bj394=
											alt="" />
									</div>
								</div>

							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Sandwich')}">
										<td></td>
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Entrees" class="tabcontent floorbackground">
					<h3 class="header floorbackground">ENTREES</h3>
					<div class="card floorbackground">
						<div class="table floorbackground">
							<div class="image_floorbackground" data-label="fishNchips">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://us.123rf.com/450wm/topntp/topntp1810/topntp181002834/110309718-fish-and-chips-with-french-fries-unhealthy-food.jpg?ver=6"
											alt="fishChips" style="width: 55%" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://www.anduzzis.com/wp-content/uploads/pc-tenders.jpg"
											alt="tenders" style="width: 55%" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img alt="salmon" align="middle" style="border-radius: 2px;"
											class="desc"
											src="https://www.redrobinpa.com/wp-content/uploads/2011/02/ensenada-chicken-platter-217.jpeg"
											style="width: 55%" />
									</div>
								</div>
							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Entree')}">
										<td></td>
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Desserts" class="tabcontent floorbackground">
					<h3 class="header floorbackground">DESSERTS</h3>
					<div class="card floorbackground">
						<div class="table floorbackground">
							<div class="image_floorbackground" data-label="cheesecake">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://images.unsplash.com/photo-1631206616601-79af875341d4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1025&q=80"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc" alt="brownie"
											src="https://i.pinimg.com/474x/ac/0e/af/ac0eaf7074d82b5d6411b140c94c0565.jpg">
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc" alt="brownie"
											src="https://topsecretrecipes.com/images/product/red-robin-mountain-high-mudd-pie-copycat-recipe.jpg">
									</div>
								</div>
							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Dessert')}">
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Sides" class="tabcontent floorbackground">
					<h3 class="header floorbackground">SIDES</h3>
					<div class="card floorbackground">
						<div class="table floorbackground">
							<div class="image_floorbackground" data-label="fries">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://images.unsplash.com/photo-1623238912680-26fc5ffb57e4?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://recipemarker.com/wp-content/uploads/2020/10/Sides-for-Mac-and-Cheese.jpeg"
											alt="mac" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img alt="fries" style="border-radius: 2px;" class="desc"
											src="https://www.aldi.us/fileadmin/fm-dam/Recipes/Appetizers/Sweet_Potato_Fries_Recipe.jpg">
									</div>
								</div>
							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Side')}">
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Beverages" class="tabcontent floorbackground">
					<h3 class="header floorbackground">BEVERAGES</h3>
					<div class="card floorbackground">
						<div class="table floorbackground">
							<div class="image_floorbackground" data-label="coke">
								<div class="img-container">
									<div class="zoom_box">
										<img style="border-radius: 2px;" class="desc"
											src="https://images.unsplash.com/photo-1581098365948-6a5a912b7a49?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1170&q=80"
											alt="" />
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img alt="" style="border-radius: 2px;" class="desc"
											src="https://www.thespruceeats.com/thmb/OfagHnZQpgIs4Y0ww-h2SsL_s8g=/889x667/smart/filters:no_upscale()/LIT-5a8f365efa6bcc00372a7634.jpg">
									</div>
								</div>
								<div class="img-container">
									<div class="zoom_box">
										<img alt="rootbeer" style="border-radius: 2px;" class="desc"
											src="https://grandolecreamery.com/wp-content/uploads/2020/04/Root-Beer.jpg" />
									</div>
								</div>
							</div>
						</div>
						<br>
						<table class="table floorbackground">
							<c:forEach var="eachItem" items="${fullMenuItemList}">
								<tr>
									<c:if test="${eachItem.itemCategory.equals('Beverage')}">
										<td></td>
										<td></td>
										<td></td>
										<td>${eachItem.itemName}</td>
										<td>${eachItem.itemDescription}</td>
										<td></td>
										<td></td>
										<td>$${eachItem.itemPrice}</td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
										<td></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
			</div>
			<div class="footer">
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
	</div>
</body>
</html>