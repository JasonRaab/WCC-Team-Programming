<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add New Menu Item</title>
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
					<li class="nav-item"><a class="nav-link" href="stock">Stock</a></li>
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link" href="employees">Employees</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
	<form:form action="processForm" modelAttribute="menuItem">
		<div class="row g-2 mb-3 mt-3">
			<div class="col">
				<form:input path="name" type="text" class="form-control"
					placeholder="Menu item name" />
			</div>
			<div class="col">
				<form:input path="price" type="text" class="form-control"
					placeholder="Price" />
			</div>
		</div>
		<div class="row g-2 mb-3 mt-3">
			<form:textarea path="description" type="text" class="form-control"
				placeholder="Description" />
		</div>
		<div class="row g-2 mb-3 mt-3">
			<form:label path="Image">Upload Image</form:label>
			<form:input path="Image" class="form-control" type="file"
				accepts="image/png, image/jpeg" />
		</div>
		<div class="row g-2 mb-3 mt-3">
			<div class="col">
				<form:input path="category" type="text" class="form-control"
					placeholder="Category" />
			</div>
			<div class="col md-2">
				<input type="submit" value="Search" class="btn btn-primary" />
			</div>
		</div>
		<div class="row g-2 mb-3 mt-3">
			<div class="col">
				<form:label path="ingredients">Tomato</form:label>
				<form:checkbox path="ingredients" value="Tomato" />
			</div>
			<div class="col">
				<form:label path="ingredients">Red Pasta Sauce</form:label>
				<form:checkbox path="ingredients" value="Red Pasta Sauce" />
			</div>
			<div class="col">
				<form:label path="ingredients">Grilled Chicken</form:label>
				<form:checkbox path="ingredients" value="Grilled Chicken" />
			</div>
			<div class="col">
				<form:label path="ingredients">Basil</form:label>
				<form:checkbox path="ingredients" value="Basil" />
			</div>
			<div class="row g-2 mb-3 mt-3">
				<button type="button" class="btn btn-success">Add Menu Item</button>
			</div>
		</div>


	</form:form>
	</div>
</body>
</html>