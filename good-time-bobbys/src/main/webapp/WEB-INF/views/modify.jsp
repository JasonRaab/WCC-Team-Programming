<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
html {
	background-image:
		url(https://paliorestaurant.com/wp-content/uploads/2021/08/wood.jpg);
	background-repeat: no-repeat;
	background-position: center;
	background-attachment: fixed;
	background-size: cover;
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
.jumbotron {
	font-family: "Georgia", serif;
	font-size: 55px;
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
}

.header {
	text-align: center;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
	font-family: "Georgia", serif;
	font-size: 18px;

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
<meta charset="ISO-8859-1">
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
<title>Cart</title>
</head>
<body>
	<header class="masthead"></header>

	<div class="floorbackground">
		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1>GOOD TIME BOBBY'S</h1>
				<h4>${menuItem.itemName}</h4>
			</div>
		</div>
		<div class="container floorbackground">
			<div>
				<div class="tab floorbackground">
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Breads')">Breads</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Dairy')">Dairy</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Fruit')">Fruit</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Vegetables')">Vegetables</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Proteins')">Proteins</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Condiments')">Condiments</button>
					<button class="tablinks floorbackground"
						onclick="openMenu(event, 'Desserts')">Desserts</button>
				</div>
			</div>
			<c:url var="testing" value="testing">
				<c:param name="userID" value="${user.userId}"></c:param>
				<c:param name="orderID" value="${orderID}"></c:param>
				<c:param name="menuItemID" value="${menuItemID}"></c:param>
				<c:param name="itemNumber" value="${itemNumber}"></c:param>
				<%-- 			<c:param name="menuItem" value="${menuItem}"></c:param> --%>
			</c:url>
			<form:form action="${testing}" modelAttribute="user" method="post">

				<fieldset>
					<legend> </legend>
					<div id="Breads" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Bread')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Bread')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>

							</table>
						</div>
					</div>
					<div id="Vegetables" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Vegetable')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Vegetable')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div id="Proteins" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Protein')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Protein')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div id="Fruit" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Fruit')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Fruit')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div id="Dairy" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Dairy')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Dairy')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div id="Condiments" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Condiment')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Condiment')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div id="Desserts" class="tabcontent floorbackground">
						<div class="card floorbackground">
							<table class="table floorbackground">
								<tr>
									<c:forEach var="defaultIngredients"
										items="${defaultIngredientList}">
										<c:if
											test="${defaultIngredients.ingredientCategory.equals('Dessert')}">
											<tr>
												<td></td>
												<td>${defaultIngredients.ingredientName}</td>
												<td>$${defaultIngredients.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${defaultIngredients.ingredientName}"
													name="ingredientAdded"
													value="${defaultIngredients.ingredientId}" checked>
													<label for="ingredientAdded">Remove Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
								<tr>
									<c:forEach var="eachIngredient" items="${ingredients}">
										<c:if
											test="${eachIngredient.ingredientCategory.equals('Dessert')}">
											<tr>
												<td></td>
												<td>${eachIngredient.ingredientName}</td>
												<td>$${eachIngredient.ingredientPrice}</td>
												<td><input type="checkbox"
													id="${eachIngredient.ingredientName}"
													name="ingredientAdded"
													value="${eachIngredient.ingredientId}"> <label
													for="ingredientAdded">Add Ingredient</label></td>
											</tr>
										</c:if>
									</c:forEach>
								</tr>
							</table>
						</div>
					</div>
					<div>
						<br>
						<br> <input class="btn btn-outline-light" type="submit"
							value="Submit Changes" name="submit" />
					</div>
				</fieldset>
			</form:form>
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