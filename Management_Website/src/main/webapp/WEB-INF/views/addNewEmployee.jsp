<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employees</title>
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
					<li class="nav-item"><a class="nav-link" href="stock">Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="employees">Employees</a></li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
		<form:form action="processEmployee" modelAttribute="employee" method="post">
			<div class="row g-2 mb-3 mt-3">
				<div class="col">
					<form:label path="firstName">First Name:</form:label>
					<form:input path="firstName" type="text" class="form-control"
						placeholder="First Name" />
				</div>
				<div class="col">
					<form:label path="lastName">Last Name:</form:label>
					<form:input path="lastName" type="text" class="form-control"
						placeholder="Last Name" />
				</div>
			</div>
			<div class="row g-2 mb-3 mt-3">
				<div class="col">
					<form:label path="email">Email:</form:label>
					<form:input path="email" type="text" class="form-control"
						placeholder="Email" />
				</div>
				<div class="col">
					<form:label path="UserId">User ID:</form:label>
					<form:input path="userId" type="text" class="form-control"
						placeholder="userId" disabled="true" />
				</div>
			</div>
			<div class="row g-2 mb-3 mt-3 justify-content-start">
				<div class="col-4">
					<form:label path="email">Password:</form:label>
					<form:input path="password" type="text" class="form-control"
						placeholder="Password" />
				</div>
				<div class="col-2 ms-4 mt-5">
				<form:label path="isActive">Active:</form:label>
					<form:checkbox path="isActive" class="form-check-input"
						value="1"/>
				</div>
			</div>
			<div class="row g-2 mb-3 mt-3">
				<input type="submit" value="Add
					Employee Info" class="btn btn-success"/>
			</div>
		</form:form>
	</div>
</body>
</html>