<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"

	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Menu</title>
<style>
html {
  overflow-y: scroll;
}
</style>
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
						aria-current="page" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link" href="employees">Employees</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>

	<div class="container m-3 mx-auto">
				<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto col-3">
			
				<div class="btn-group">
					<a href="#" class="btn btn-primary active" aria-current="page">Menu Items</a>
					<a href="ingredients" class="btn btn-outline-primary">Ingredients</a>
				</div>
		</div>
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto col-3">
			<div class="btn-group">
					<a href="menu" class="btn btn-<c:if test='${menuStatus=="inactive"}'>outline-</c:if>success" aria-current="page">Active Items</a>
					<a href="inactiveMenu" class="btn btn-<c:if test='${menuStatus=="active"}'>outline-</c:if>danger">Inactive Items</a>
				</div>
		</div>
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-6">
				<input type="text" class="form-control" onkeyup="searchItems()"
					id="search" placeholder="Search for Menu Item" />
			</div>
		</div>
		<div class="mb-3">
			<a href="addNewMenuItem"><button class="btn btn-success">+
					Add New</button></a>
		</div>
<script>
			function searchItems() {
				var input, filter, found, cards, title, i, j;
				input = document.getElementById("search");
				filter = input.value.toUpperCase();
				//tbody = document.getElementById("cards");
				cards = document.getElementById("cards").children;
				//tr = tbody.getElementsByTagName("div");
				for (i = 0; i < cards.length; i++) {
					title = cards[i].getElementsByTagName("h5");
						if (title[0].innerHTML.toUpperCase().indexOf(filter) > -1) {
							found = true;
						}
					if (found) {
						cards[i].style.display = "";
						found = false;
					} else {
						cards[i].style.display = "none";
					}
				}
			}
		</script>
		<div id="cards">
		<c:forEach var="eachItem" items="${menuItems}">
		<div class="card mb-3" id="card">
			<div class="card-body" id="card-body">
				<h5 class="card-title" id="card-title">${eachItem.name}</h5>
				<h6 class="card-subtitle mb-2 text-muted">${eachItem.category}</h6>
				<p class="card-text">${eachItem.description}</p>
				<c:url var="modifyLink" value="/management/updateMenuItem">
					<c:param name="menuId" value="${eachItem.id}"/>
				</c:url>
				<c:url var="deactivateLink" value="/management/deactivateMenuItem">
					<c:param name="menuId" value="${eachItem.id}"/>
				</c:url>
				<c:url var="activateLink" value="/management/activateMenuItem">
					<c:param name="menuId" value="${eachItem.id}"/>
				</c:url>
				<a href="${modifyLink}" class="card-link"><button class="btn btn-primary">More Info</button></a>
				<a href='<c:if test='${menuStatus=="active"}'>${deactivateLink}</c:if><c:if test='${menuStatus=="inactive"}'>${activateLink}</c:if>' class="card-link"><button class="btn btn-danger"><c:if test='${menuStatus=="active"}'>Deactivate</c:if><c:if test='${menuStatus=="inactive"}'>Activate</c:if></button></a>
			</div>
		</div>
		</c:forEach>
		</div>
	</div>
</body>
</html>