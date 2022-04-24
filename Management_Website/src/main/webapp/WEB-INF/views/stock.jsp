<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Stock</title>
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
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="stock?type=<%= request.getParameter("type")%>">Stock</a></li>
					<li class="nav-item"><a class="nav-link" href="menu">Menu</a></li>
					<li class="nav-item"><a class="nav-link" href="employees">Employees</a>
					</li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container m-3 mx-auto">
	<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-6">
				<input type="text" class="form-control" onkeyup="searchMovies()"
					id="search" placeholder="Search By Category or Item" />
			</div>
			</div>
	<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-3">
				<div class="btn-group">
			<!-- changes whats selected based on the value of the type get variable -->
					<a href="stock?type=MenuItem" class='btn btn-outline-primary <c:if test='<%= request.getParameter("type").equals("MenuItem")%>'>active</c:if>'>Menu Items</a>
					<a href="stock?type=IngredientItem" class='btn btn-outline-primary <c:if test='<%= request.getParameter("type").equals("IngredientItem")%>'>active</c:if>'>Ingredients</a>
				</div>
			</div>
		</div>
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">	
			<table class="table table-bordered table-striped">
				<thead>
				<tr>
					<th class="d-table-cell" rowspan="2" style="width:20%">Category</th>
					<th class="d-table-cell" rowspan="2" style="width:20%">Item</th>
					<th class="d-table-cell" rowspan="2" style="width:20%">Stock</th>
					<th class="d-table-cell" rowspan="2" style="width:20%">Modify Stock</th>
				</thead>
				<tbody id="StockTable">
					<c:forEach var="eachStock" items="${stockList}">
					<form:form action="${pageContext.request.contextPath}/management/updateStock" modelAttribute="stock" method="POST">
					<c:url var = "updateLink"  value="/management/updateStock">
						<c:param name="stockId" value="${eachStock.id}"/>
						
					</c:url>
						<tr>
							<td class="d-table-cell"><c:out
									value="${eachStock.category}" /></td>
							<td class="d-table-cell"><c:out value="${eachStock.name}" /></td>
							<td class="d-table-cell"><c:out value="${eachStock.stock}" /></td>
							<td class="d-table-cell">
								<form:input path="stock" name="newCount" type="number" placeholder="enter number" value="${eachStock.stock}"/>
								<input type=hidden name="stockId" value="${eachStock.id}">
								<input type="hidden" name="type" value="${eachStock.getClass().getSimpleName()}"/>
								<input type="submit" class="btn btn-primary" value="Update"/>
							</td>
							
						</tr>
						</form:form>
					</c:forEach>
				</tbody>
			</table>
	</div>
	</div>
<script>
			function searchMovies() {
				var input, filter, found, tbody, tr, td, i, j;
				input = document.getElementById("search");
				filter = input.value.toUpperCase();
				tbody = document.getElementById("StockTable");
				tr = tbody.getElementsByTagName("tr");
				for (i = 0; i < tr.length; i++) {
					td = tr[i].getElementsByTagName("td");
						if (td[0].innerHTML.toUpperCase().indexOf(filter) > -1) {
							found = true;
						}
						if (td[1].innerHTML.toUpperCase().indexOf(filter) > -1) {
							found = true;
						}
					if (found) {
						tr[i].style.display = "";
						found = false;
					} else {
						tr[i].style.display = "none";
					}
				}
			}
		</script>
</body>
</html>