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



<!-- //	@RequestMapping("/modify") -->
<!-- //    public String modifyItem(Model model, @RequestParam(name = "userID") int userID, -->
<!-- //            @RequestParam(name = "menuItemID") int menuItemID, -->
<!-- //            @RequestParam(name = "orderID") int orderID, -->
<!-- //            @RequestParam(name = "itemNumber") int itemNumber, -->
<!-- //            //@RequestParam(name = "subtotal") int priceTotal, -->
<!-- //            @ModelAttribute(name = "defaultIngredientList") Ingredient defaultIngredientList, -->
<!-- //            @ModelAttribute(name = "ingredients") Ingredient ingredients, -->
<!-- //            // @ModelAttribute(name = "comparisonSet") Set<Integer> comparisonSet, -->
<!-- //            BindingResult bindingResult) { -->
<!-- // -->
<!-- //        User user = userDAO.getUserByID(userID); -->
<!-- //        MenuItem menuItem = restaurantDAO.getMenuItemByID(menuItemID); -->
<!-- //        OrderInfo orderInfo = restaurantDAO.getOrderInfoByID(orderID); -->
<!-- //        int menuItemNumber = itemNumber; -->
<!-- //        int orderIDint = orderInfo.getOrderId(); -->
<!-- //        // Set<Integer> results = -->
<!-- //        // ingredientDAO.compareDefaultAndChosenIngredients(menuItemID); -->
<!-- //        List<Ingredient> defaultIngredientIDList = ingredientDAO.getIngredientListByMenuItemID(menuItemID); -->
<!-- //        List<Ingredient> fullIngredientList = ingredientDAO.getAllIngredients(); -->
<!-- //        List<Ingredient> ingredientsToRemove= new ArrayList<Ingredient>(); -->
<!-- //for (Ingredient ingredient : fullIngredientList) { -->
<!-- //            for (Ingredient defaultIngredient : defaultIngredientIDList) { -->
<!-- // -->
<!-- //                if (ingredient.getIngredientId() == defaultIngredient.getIngredientId()) { -->
<!-- //                    ingredientsToRemove.add(ingredient); -->
<!-- //                } -->
<!-- //            } -->
<!-- //        } -->
<!-- //            fullIngredientList.removeAll(ingredientsToRemove); -->
<!-- // -->
<!-- //        model.addAttribute(user); -->
<!-- //        model.addAttribute("menuItem", menuItem); -->
<!-- //        model.addAttribute("itemNumber", menuItemNumber); -->
<!-- //        model.addAttribute("orderID", orderIDint); -->
<!-- //        //model.addAttribute("subtotal", priceTotal); -->
<!-- //        model.addAttribute("defaultIngredientList", ingredientDAO.getIngredientListByMenuItemID(menuItemID)); -->
<!-- //        model.addAttribute("ingredients",  fullIngredientList); -->
<!-- //        // model.addAttribute("comparisonSet", results); -->
<!-- // -->
<!-- //        return "modify"; -->
<!-- //    } -->
<!-- //	 -->





	<div class="container">
		<div class="jumbotron text-center">
			<h1>WELCOME TO GOOD TIME BOBBY'S
				${user.firstName}&nbsp;${user.lastName}</h1>
			<h2>${menuItem.itemName}</h2>
			<h3>${orderID}</h3>
			<h4>${itemNumber}</h4>
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
		<c:url var="testing" value="testing">
			<c:param name="userID" value="${user.userId}"></c:param>
			<c:param name="orderID" value="${orderID}"></c:param>
			<c:param name="menuItemID" value="${menuItemID}"></c:param>
			<c:param name="itemNumber" value="${itemNumber}"></c:param>
<%-- 			<c:param name="menuItem" value="${menuItem}"></c:param> --%>
		</c:url>
		<form:form action="${testing}" modelAttribute="user" method="post">
			<fieldset>
				<legend> Choose Ingredients to Add: </legend>
				<div id="Breads" class="tabcontent">
					<h3 class="header">Breads</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Bread')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Bread')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div id="Vegetables" class="tabcontent">
					<h3 class="header">Vegetables</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Vegetable')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Vegetable')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div id="Proteins" class="tabcontent">
					<h3 class="header">Proteins</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Protein')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Protein')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div id="Fruit" class="tabcontent">
					<h3 class="header">Fruit</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Fruit')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Fruit')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div id="Dairy" class="tabcontent">
					<h3 class="header">Dairy</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Dairy')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Dairy')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div id="Condiments" class="tabcontent">
					<h3 class="header">Condiments</h3>
					<div class="card">
						<table class="table">
							<tr>
								<c:forEach var="eachIngredient" items="${ingredients}">
									<c:if
										test="${eachIngredient.ingredientCategory.equals('Condiment')}">
										<tr>
											<td>${eachIngredient.ingredientId}</td>
											<td>${eachIngredient.ingredientName}</td>
											<td>$${eachIngredient.ingredientPrice}</td>
											<td><input type="checkbox"
												id="${eachIngredient.ingredientName}" name="ingredientAdded"
												value="${eachIngredient.ingredientId}"> <label
												for="ingredientAdded">Add Ingredient</label></td>
										</tr>
									</c:if>
								</c:forEach>
							</tr>
							<tr>
								<c:forEach var="defaultIngredients"
									items="${defaultIngredientList}">
									<c:if
										test="${defaultIngredients.ingredientCategory.equals('Condiment')}">
										<tr>
											<td>${defaultIngredients.ingredientId}</td>
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
						</table>
					</div>
				</div>
				<div>
					<input type="submit" value="submit" name="submit" />
				</div>
			</fieldset>
		</form:form>

	</div>
</body>
</html>