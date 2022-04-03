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

	<div class="container">
		<div class="jumbotron text-center">
			<h1>WELCOME TO GOOD TIME BOBBY'S
				${user.firstName}&nbsp;${user.lastName}</h1>
			<h2>${menuItem.itemName}</h2>
			<h3>${orderID}</h3>
		</div>
	</div>
	<div class="container">
		<div>
			<div class="tab">
				<button class="tablinks" onclick="openMenu(event, 'Breads')">Breads</button>
				<button class="tablinks" onclick="openMenu(event, 'Dairy')">Dairy</button>
				<button class="tablinks" onclick="openMenu(event, 'Fruit')">Fruit</button>
				<button class="tablinks" onclick="openMenu(event, 'Vegetables')">Vegetables</button>
				<button class="tablinks" onclick="openMenu(event, 'Proteins')">Proteins</button>
				<button class="tablinks" onclick="openMenu(event, 'Condiments')">Condiments</button>
			</div>
		</div>
		<form action="testing" method="post">
			<fieldset>
				<legend> Choose Ingredients to Add: </legend>
				<div id="Breads" class="tabcontent">
					<h3 class="header">Breads</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Bread')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Bread')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Vegetables" class="tabcontent">
					<h3 class="header">Vegetables</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Vegetable')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Vegetable')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Proteins" class="tabcontent">
					<h3 class="header">Proteins</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Protein')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Protein')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Fruit" class="tabcontent">
					<h3 class="header">Fruit</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Fruit')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Fruit')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Dairy" class="tabcontent">
					<h3 class="header">Dairy</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Dairy')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Dairy')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div id="Condiments" class="tabcontent">
					<h3 class="header">Condiments</h3>
					<div class="card">
						<table class="table">
							<c:forEach var="eachIngredient" items="${ingredients}">
								<tr>
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Condiment')}">
										<td>${eachIngredient.ingredientId}</td>
										<td>${eachIngredient.ingredientName}</td>
										<td>$${eachIngredient.ingredientPrice}</td>
										<td><c:forEach var="defaultIngredientList"
												items="${defaultIngredientList}">
												<c:if
													test="${defaultIngredientList.ingredientCategory.equals('Condiment')}">
													<c:choose>
														<c:when
															test="${eachIngredient.ingredientId == defaultIngredientList.ingredientId}">
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}" checked>
															<label for="ingredientAdded">Remove Ingredient</label>
														</c:when>
														<c:otherwise>
															<input type="checkbox"
																id="${eachIngredient.ingredientName}"
																name="ingredientAdded"
																value="${eachIngredient.ingredientId}">
															<label for="ingredientAdded">Add Ingredient</label>
														</c:otherwise>
													</c:choose>
												</c:if>
											</c:forEach></td>
									</c:if>
								</tr>
							</c:forEach>
						</table>
					</div>
				</div>
				<div>
					<input type="submit" value="submit" name="submit" />
				</div>
			</fieldset>
		</form>

	</div>
</body>
</html>