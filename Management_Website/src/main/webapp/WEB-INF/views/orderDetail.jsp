<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Order Detail</title>
</head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
	crossorigin="anonymous"></script>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">Good Time Bobby's</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNav"
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="orders">Orders</a></li>
					<li class="nav-item"><a class="nav-link" href="stock?type=MenuItem">Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link" href="employees">Employees</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
		
		
		<div class="card-header mb-3"> Order ${order.id}</div>
		  	<div class="card align-items-center justify-content-center col-4">
		  	<h5>${order.user.firstName} ${order.user.lastName}</h5>
		  	<h5>${order.user.email}</h5>
		  	<h5>${order.date} ${order.orderType}</h5>
		  	<c:if test='${order.tableNumber!=null}'><h5>Table ${order.tableNumber}</h5></c:if>
		  
		  	<c:if test='${order.isOpen==1}'>
		  	<div class="alert alert-primary col-4">
				<h5 class="text-center">Open</h5>
		  	</div>
		  	</c:if>
		  	
		  	<c:if test='${order.isOpen==0}'>
		  	<div class="alert alert-success col-4">
				<h5 class="text-center">Completed</h5>
		  	</div>
		  	</c:if>
		  	
			</div>
			<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<table class="table">
			 	<thead class="thead-dark">
				    <tr>
				      <th scope="col">#</th>
				      <th scope="col">Item</th>
				      <th scope="col">Price</th>
				      <th scope="col">Modifications</th>
				    </tr>
				</thead>

			
			<c:forEach var="eachItem" items="${itemList}">
			<tr>
			<th scope="row">${eachItem.get(0).itemNumber}</th>
			<td>${eachItem.get(0).menuItem.name}</td>
			<td>
				$<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${eachItem.get(0).menuItem.price}"/>
			</td>
			<td>
				<table class="table">
				<c:forEach var="eachModification" items="${eachItem}">
					<tr>
					<td>
					<c:if test='${eachModification.modification==1}'>Add </c:if>
					<c:if test='${eachModification.modification==0}'>Remove </c:if>

					${ingredients.get(eachModification.ingredientId).name}
					</td>
					<td>
					<c:if test='${ingredients.get(eachModification.ingredientId).price>0.0&&eachModification.modification==1}'> 
						+$<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${ingredients.get(eachModification.ingredientId).price}"/>
					</c:if>
					</td>
					</tr>
				</c:forEach>
				</table>
			</td>
				</tr>
			</c:forEach>
			</tbody>
			<tfoot>
		    <tr>
		      <td>
		      	Subtotal: $<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${order.subtotal}"/>
		      </td>
		    </tr>
		    <tr>
		      <td>
		      	Tax: $<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${order.tax}"/>
		      </td>
		    </tr>
		    <tr>
		      <td>
		      	Total: $<fmt:formatNumber minFractionDigits="2" maxFractionDigits="2" value="${order.total}"/>
		      </td>
		    </tr>
		  </tfoot>
			</table>
			<a href="completeOrder?orderId=${order.id}" class="card-link"><button class="btn btn-success">Mark Order As Complete</button></a>
		</div>
		
	</div>

</body>
</html>