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
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-3">
				<div class="btn-group">
					<a href="#" class="btn btn-primary active" aria-current="page">Clocked-in
						Employees</a> <a href="#" class="btn btn-outline-primary">Current
						Employees</a> <a href="#" class="btn btn-outline-primary">Previous
						Employees</a>
				</div>
			</div>
		</div>
		<form:form action="processForm" modelAttribute="employee">
			<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
				<div class="col-2">
					<form:input path="firstName" type="text" class="form-control"
						placeholder="First Name" />
				</div>
				<div class="col-2">
					<form:input path="LastName" type="text" class="form-control"
						placeholder="Last Name" />
				</div>
				<div class="col-2">
					<form:input path="email" type="text" class="form-control"
						placeholder="Email" />
				</div>
				<div class="col-5">

					<form:input path="userId" type="text" class="form-control"
						placeholder="Employee ID" />
				</div>

				<div class="col-1">
					<input type="submit" value="Search" class="btn btn-primary" />
				</div>
			</div>
			<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
				<div class="col-3">
					<h3>${employeeList.size()} Clocked-in Employees</h3>
				</div>
			</div>
		</form:form>
		<c:forEach var="eachEmployee" items="${employeeList}">
			<c:url var="modifyLink" value="/updateEmployee">
				<c:param name="employeeID" value="${eachEmployee.userId}" />
			</c:url>
			<div class="card mb-3">
				<div class="card-body">
					<h5 class="card-title">${eachEmployee.firstName}
						${eachEmployee.lastName}</h5>
					<h6 class="card-subtitle mb-2 text-muted">${eachEmployee.email}</h6>
					<p class="card-text"></p>
					<a href="${modifyLink}" class="card-link">
						<button class="btn btn-primary">Modify</button>
					</a>
				</div>
			</div>
		</c:forEach>
	</div>
</body>
</html>