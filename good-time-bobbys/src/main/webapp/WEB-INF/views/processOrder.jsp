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
<title>Process Order</title>
</head>
<body>
	<div class="container">
		<h1>Process Order</h1>
		<div style="text-align: center;" class="card">
			<%-- 		<table>
				<tr>
					<c:forEach var="eachItem" items="${allItemsOrdered}">
						<tr>
							<td>${eachItem.menuItem.getItemName()}</td>
							<td>${eachItem}<c:if
									test="${not empty eachItem.getIngredientId()}">
								${ingredientDAO.getIngredientNameByID(eachItem.getIngredientId())}
								<c:if test="${eachItem.modification == 1}">
								 &nbsp;+ $${ingredientDAO.getIngredientPriceByID(eachItem.getIngredientId())}
								 </c:if>
								</c:if></td>
						</tr>
					</c:forEach>
				</tr>

			</table>

			Subtotal: "${orderTotalWithoutTax}" Tax: "${orderTotalTax}" Total:
			"${orderTotalWithTax}"
 --%>
			<table class="body-wrap">
				<tbody>
					<tr>
						<td></td>
						<td class="container" width="600">
							<div class="content">
								<table class="main" width="100%" cellpadding="0" cellspacing="0">
									<tbody>
										<tr>
											<td class="content-wrap aligncenter">
												<table width="100%" cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td class="content-block">
																<h2>Thanks For Ordering With Good Time Bobby's!</h2>
															</td>
														</tr>
														<tr>
															<td class="content-block">
																<table class="invoice">
																	<tbody>
																		<tr>
																			<td>${user.firstName}&nbsp;${user.lastName}<br>Invoice
																				#${orderInfo.orderId}<br>${orderInfo.orderDate}
																			</td>
																		</tr>
																		<tr>
																			<td>
																				<table class="invoice-items" cellpadding="0"
																					cellspacing="0">
																					<tbody>


																						<c:forEach var="eachItem"
																							items="${allItemsOrdered}">
																							<tr>
																								<td class="alignleft">${eachItem.menuItem.getItemNumber()}</td>
																								<td></td>
																								<td class="alignleft">${eachItem.menuItem.getItemName()}</td>
																								<td></td>
																								<td class="alignright">${eachItem}<c:if
																										test="${not empty eachItem.getIngredientId()}">
																										<td>
																											${ingredientDAO.getIngredientNameByID(eachItem.getIngredientId())}
																											&nbsp;+
																											$${ingredientDAO.getIngredientPriceByID(eachItem.getIngredientId())}</td>
																									</c:if>
																								</td>
																							</tr>
																						</c:forEach>
																						<!-- <tr>
																							<td>Service 1</td>
																							<td class="alignright">$ 20.00</td>
																						</tr>
																						<tr>
																							<td>Service 2</td>
																							<td class="alignright">$ 10.00</td>
																						</tr>
																						<tr>
																							<td>Service 3</td>
																							<td class="alignright">$ 6.00</td>
																						</tr> -->
																						<tr class="total">
																							<td class="alignright" width="80%">Total:</td>
																							<td class="alignright">${orderTotalWithTax}</td>
																						</tr>
																						<tr>
																							<td class="alignright" width="80%">SubTotal:</td>
																							<td class="alignright">${orderTotalWithoutTax}</td>
																						</tr>
																						<tr>
																							<td class="alignright" width="80%">Tax:</td>
																							<td class="alignright">${orderTotalTax}</td>
																						</tr>
																					</tbody>
																				</table>
																			</td>
																		</tr>
																	</tbody>
																</table>
															</td>
														</tr>

														<tr>
															<td class="content-block">GoodTimeBobbys Inc. 4800 E
																Huron Dr, Ann Arbor, 48105</td>
														</tr>
													</tbody>
												</table>
											</td>
										</tr>
									</tbody>
								</table>
								<div class="footer">
									<table width="100%">
										<tbody>
											<tr>
												<td class="aligncenter content-block">Questions? Email
													<a href="mailto:">support@goodtimebobbys.inc</a>
												</td>
											</tr>
										</tbody>
									</table>
								</div>
							</div>
						</td>
						<td></td>
					</tr>
				</tbody>
			</table>






			<!-- 			<table class="table"> -->
			<%-- 				<c:forEach var="eachItem" items="${itemsOrderedList}"> --%>

			<!-- 					<tr> -->
			<%-- 						<td>${eachItem.itemNumber}</td> --%>
			<!-- 						<td></td> -->
			<%-- 						<td>${eachItem.menuItem.getItemId()}</td> --%>
			<%-- 						<td>${eachItem.menuItem.getItemName()}</td> --%>
			<%-- 						<c:if test="${eachItem.modification == 1}"> --%>
			<!-- 							<td>Add: -->
			<%-- 								${ingredientDAO.getIngredientNameByID(eachItem.getIngredientId())}</td> --%>
			<%-- 						</c:if> --%>
			<%-- 						<c:if test="${eachItem.modification == 0}"> --%>
			<!-- 							<td>Remove: -->
			<%-- 								${ingredientDAO.getIngredientNameByID(eachItem.getIngredientId())}</td> --%>
			<%-- 						</c:if> --%>

			<!-- 						<td>$${eachItem.menuItem.getItemPrice()}</td> -->
			<!-- 						<td></td> -->
			<!-- 						<td></td> -->
			<!-- 					</tr> -->
			<%-- 				</c:forEach> --%>
			<%-- 				<c:forEach var="eachItem" items="${sendItemOrderedList}"> --%>

			<!-- 					<tr> -->
			<%-- 						<td>${eachItem.getMenuItem().getItemNumber()}</td> --%>
			<!-- 						<td></td> -->
			<%-- 						<td>${eachItem.getMenuItem().getItemId()}</td> --%>
			<%-- 						<td>${eachItem.getMenuItem().getItemName()}</td> --%>
			<!-- 						<td></td> -->
			<%-- 												<td>${eachItem.itemDescription}</td> --%>
			<!-- 						<td>$${eachItem.getMenuItem().getItemPrice()}</td> -->
			<!-- 						<td></td> -->
			<!-- 						<td></td> -->
			<!-- 					</tr> -->
			<%-- 				</c:forEach> --%>
			<!-- 				<tr> -->

			<!-- 					<td></td> -->
			<!-- 					<td></td> -->
			<!-- 					<td></td> -->
			<!-- 					<td></td> -->
			<%-- 					<td><a href="${sendOrderToDatabase}" --%>
			<!-- 						class="btn btn-primary btn-sm active">Send to Kitchen!</a></td> -->
			<!-- 					<td></td> -->
			<!-- 					<td></td> -->
			<!-- 				</tr> -->
			<!-- 			</table> -->
		</div>
	</div>


</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
* {
	box-sizing: border-box;
}

/* Create three columns of equal width */
.columns {
	float: left;
	width: 33.3%;
	padding: 8px;
}

/* Style the list */
.price {
	list-style-type: none;
	border: 1px solid #eee;
	margin: 0;
	padding: 0;
	-webkit-transition: 0.3s;
	transition: 0.3s;
}

/* Add shadows on hover */
.price:hover {
	box-shadow: 0 8px 12px 0 rgba(0, 0, 0, 0.2)
}

/* Pricing header */
.price .header {
	background-color: #111;
	color: white;
	font-size: 25px;
}

/* List items */
.price li {
	border-bottom: 1px solid #eee;
	padding: 20px;
	text-align: center;
}

/* Grey list item */
.price .grey {
	background-color: #eee;
	font-size: 20px;
}

/* The "Sign Up" button */
.button {
	background-color: #04AA6D;
	border: none;
	color: white;
	padding: 10px 25px;
	text-align: center;
	text-decoration: none;
	font-size: 18px;
}

/* Change the width of the three columns to 100% 
(to stack horizontally on small screens) */
@media only screen and (max-width: 600px) {
	.columns {
		width: 100%;
	}
}

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
				<c:forEach var="eachItem" items="${menuItemList}">

					<td>${eachItem.itemNumber}</td>
					<td>${eachItem.itemId}</td>
					<td>${eachItem.itemName}</td>
					<td>${eachItem.itemDescription}</td>
					<td>$${eachItem.itemPrice}</td>
					<td></td>
					<td></td>
					<td></td>
					<td></td>


				</c:forEach>
				<tr>
					<td><a href="${sendOrderToDatabase}"
						class="btn btn-primary btn-sm active">Send to Kitchen!</a></td>
				</tr>
			</table>
			<div style="text-align: center;"class="columns">
				<ul class="price">
					<li class="grey">Total: $${orderTotalWithTax}</li>
					<li>Subtotal: $${orderTotalWithoutTax}</li>
					<li>Tax: $${orderTotalTax}</li>
					<li class="grey"><a href="${sendOrderToDatabase}"
						class="btn btn-primary btn-sm active">Send to Kitchen!</a></li>
				</ul>
			</div>
		</div>
	</div>

<!-- 	<div class="container">
		<h1>Process Order</h1>
		<div class="card">
			<table class="table">
				<tr>
			</table>
		</div>
	</div> -->
</body>
</html> --%>