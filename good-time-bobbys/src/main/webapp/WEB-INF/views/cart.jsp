<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<link rel='stylesheet'
    href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'>
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

#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

table td, th, tr {
	border: none !important;
	padding: 8px;
	font: #ffffff;
	font-family: "Georgia", serif;
	font-size: 18px;

}

/* #table tr:nth-child(even) { */
/* 	background-color: #f2f2f2; */
/* } */

/* #table tr:hover { */
/* 	background-color: #ddd; */
/* } */
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

.empty-cart-parent {
	padding: 2rem 2rem;
	text-align: center;
}

.empty-cart-child {
	display: inline-block;
	padding: .3rem .2rem;
}

#p {
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
<title>Cart</title>
</head>
<body>
	<header class="masthead"></header>
	<div class="floorbackground">
		<div class="container floorbackground">
			<div class="jumbotron text-center floorbackground">
				<h1>GOOD TIME BOBBY'S</h1>
			</div>
		</div>
		<div class="container floorbackground">
			<div class="card  floorbackground">
				<form:form action="orderDetails" method="post"
					modelAttribute="orderID">
					<table class="table tabcontent floorbackground">
						<c:choose>
							<c:when test="${not empty menuItemList}">
								<c:forEach var="eachMenuItem" items="${menuItemList}"
									varStatus="myIndex">
									<c:url var="addMoreToOrder" value="/backToMenu">
										<c:param name="userID" value="${userID}" />
										<c:param name="orderID" value="${orderID}" />
									</c:url>
									<tr>
										<td>Item Number: ${eachMenuItem.itemNumber}</td>
										<td>${eachMenuItem.itemName}</td>
										<td></td>
										<td>${eachMenuItem.itemDescription}</td>
										<td></td>
										<td>$${eachMenuItem.itemPrice}</td>
										<c:url var="modify" value="/modify">
											<c:param name="userID" value="${user.userId}" />
											<c:param name="menuItemID" value="${eachMenuItem.itemId}" />
											<c:param name="orderID" value="${orderID}" />
											<c:param name="itemNumber" value="${eachMenuItem.itemNumber}" />
										</c:url>
										<td>
										<td style="text-align: right;"><a href="${modify}"
											class="btn btn-outline-light btn-sm" role="button"
											aria-pressed="true">Modify Item</a></td>
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
									<td align="right">$${subTotal}</td>
									<td></td>
									<td style="text-align: right;"><a href="${processOrder}"
										class="btn btn-outline-light btn-sm" role="button"
										aria-pressed="true">Process Order</a></td>
									<td></td>
								</tr>
							</c:when>
							<c:otherwise>
								<div class="empty-cart-parent">
                                    <div class="empty-cart-child">
                                        <h5>
                                            Your <i style="font-size: 25px;" class='fa fa-shopping-cart'></i>&nbsp;
                                            is empty.
                                        </h5>
                                    </div>
                                </div>
							</c:otherwise>
						</c:choose>
					</table>
				</form:form>
				<c:url var="addMoreToOrder" value="/backToMenu">
					<c:param name="userID" value="${userID}" />
					<c:param name="orderID" value="${orderID}" />
				</c:url>
				<a href="${addMoreToOrder}" class="btn btn-primary btn-sm active"
                    style="color: white; background-color: black; font-size: medium;"
                    role="button" aria-pressed="true">Continue Shopping</a>
			</div>
		</div>
		
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br> <br> <br> <br> <br> <br>
		<br> <br>
		<br>
	</div>
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
	
</body>
</html>