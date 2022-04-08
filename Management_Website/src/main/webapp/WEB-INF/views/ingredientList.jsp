<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Ingredients</title>
</head>
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>

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
					<li class="nav-item"><a class="nav-link" href="stock?type=MenuItem">Stock</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="ingredients">Menu</a></li>
					<li class="nav-item"><a class="nav-link" href="employees">Employees</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-3">
				<div class="btn-group">
					<a href="menu" class="btn btn-outline-primary" aria-current="page">Menu Items</a>
					<a href="#" class="btn btn-primary active">Ingredients</a>
				</div>
			</div>
		</div>
		<form:form action="processForm" modelAttribute="itemSearch">
			<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
				<div class="col-5">
					<form:input path="name" type="text" class="form-control"
						placeholder="Ingredient name" />
				</div>
				<div class="col-5">
					<form:input path="category" type="text" class="form-control"
						placeholder="Category" />
				</div>

				<div class="col-1">
					<input type="submit" value="Search" class="btn btn-primary" />
				</div>
			</div>

		</form:form>
		<div class="mb-3">
			<a href="addNewIngredient"><button class="btn btn-success">+
					Add New</button></a>
		</div>
		<c:forEach var="eachItem" items="${ingredientList}">
		<div class="card mb-3">
			<div class="card-body">
				<h5 class="card-title">${eachItem.name}</h5>
				<h6 class="card-subtitle mb-2 text-muted">${eachItem.category}</h6>
				<c:url var="modifyLink" value="/management/modifyIngredient">
					<c:param name="ingredientId" value="${eachItem.id}"/>
				</c:url>
				<c:url var="deactivateLink" value="/management/deactivateIngredient">
					<c:param name="ingredientId" value="${eachItem.id}"/>
				</c:url>
				<a href="${modifyLink}" class="card-link"><button class="btn btn-primary">Modify</button></a>
				<a href="${deactivateLink}" class="card-link"><button class="btn btn-danger">Deactivate</button></a>
			</div>
		</div>
		</c:forEach>
	</div>
</body>
</html>