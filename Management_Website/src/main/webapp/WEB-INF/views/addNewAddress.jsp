<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Address</title>
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
					<li class="nav-item"><a class="nav-link" href="orders">Orders</a></li>
					<li class="nav-item"><a class="nav-link"
						href="stock?type=MenuItem">Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="employees">Employees</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
		<c:url var="processAddressLink" value="/management/processAddress">
			<c:param name="employeeID" value="${employee.userId}" />
		</c:url>
		<form:form action="${processAddressLink}" modelAttribute="address">
			<form:hidden path="isActive" value="1" />
			<div class="row g-2 mb-3 mt-3">
				<div class="col">
					<form:label path="street">Street:</form:label>
					<form:input path="street" type="text" class="form-control"
						placeholder="Street" />
				</div>
				<div class="col">
					<form:label path="city">City:</form:label>
					<form:input path="city" type="text" class="form-control"
						placeholder="City" />
				</div>
			</div>
			<div class="row g-2 mb-3 mt-3">
				<div class="col">
					<form:label path="state">State:</form:label>
					<form:input path="state" type="text" class="form-control"
						placeholder="State" />
				</div>
				<div class="col">
					<form:label path="zip">Zip:</form:label>
					<form:input path="zip" type="text" class="form-control"
						placeholder="Zip" />
				</div>
			</div>
			<div class="row g-2 mb-3 mt-3">
				<input type="submit" value="Add Address Info"
					class="btn btn-success" />
			</div>
		</form:form>
	</div>
</body>
</html>