<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<style>
#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

#table td, #table th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table tr:nth-child(even) {
	background-color: #f2f2f2;
}

#table tr:hover {
	background-color: #ddd;
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
<title>Cart</title>
</head>
<body>

	<div class="container">
		<div class="jumbotron text-center">
			<h1>WELCOME TO GOOD TIME BOBBY'S</h1>
				<h1>${user.firstName}&nbsp;${user.lastName}</h1>
				<h2>${orderID}</h2>
		</div>

	</div>

	<div class="container">
		<div class="card">
			<form:form action="orderDetails" method="post"
				modelAttribute="orderID">
				<table class="table">
					<tr>
						<th style="text-align: center">Cart</th>
					</tr>
					<c:forEach var="eachMenuItem" items="${menuItemList}" varStatus="myIndex">
						<c:url var="addMoreToOrder" value="/backToMenu">
							<c:param name="userID" value="${userID}" />
							<c:param name="orderID" value="${orderID}" />
						</c:url>
						<tr>
							<td>Item Number: ${eachMenuItem.itemNumber}</td>
							<td>${eachMenuItem.itemId}</td>
							<td>${eachMenuItem.itemName}</td>
							<td>${eachMenuItem.itemDescription}</td>
							<td><c:forEach var="eachIngredient"
									items="${eachMenuItem.getIngredients()}">
									<c:if test="${eachIngredient.isActive == 1}">
									
											${eachIngredient.ingredientName},
									</c:if>
								</c:forEach></td>
							<td>$${eachMenuItem.itemPrice}</td>

							<c:url var="modify" value="/modify">
								<c:param name="userID" value="${user.userId}" />
								<c:param name="menuItemID" value="${eachMenuItem.itemId}" />
								<c:param name="orderID" value="${orderID}" />
								<c:param name="itemNumber" value="${eachMenuItem.itemNumber}" />
<%-- 								<c:param name="menuItemList" value="${menuItemList}" /> --%>
							</c:url>

							<td>
							<td style="text-align: right;"><a href="${modify}"
								class="btn btn-sm active"
								style="color: black; background-color: gray; font-size: medium;"
								role="button" aria-pressed="true">Modify Item</a></td>
						</tr>
					</c:forEach>
					<tr>
						<c:url var="processOrder" value="/processOrder">
							<c:param name="userID" value="${userID}" />
							<c:param name="itemNumber" value="${itemNumber}" />
							<c:param name="orderID" value="${orderID}" />
							<c:param name="subTotal" value="${subTotal}" />
						</c:url>
						<td></td>
						<td></td>
						<td></td>
						<td></td>
						<td>SUBTOTAL:</td>
						<td align="right">${subTotal}</td>
						<td style="text-align: right;"><a href="${processOrder}"
							class="btn btn-sm active"
							style="color: black; background-color: gray; font-size: medium;"
							role="button" aria-pressed="true">Process Order</a></td>
					</tr>
				</table>
			</form:form>
			<c:url var="addMoreToOrder" value="/backToMenu">
				<c:param name="userID" value="${userID}" />
				<c:param name="orderID" value="${orderID}" />
			</c:url>
			<a href="${addMoreToOrder}" class="btn btn-sm active"
				style="color: white; background-color: black; font-size: medium;"
				role="button" aria-pressed="true">Continue Shopping</a>

		</div>
	</div>


</body>
</html>