<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Orders</title>
<!-- this prevents scrollbar from shiftng elements -->
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
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-3">
				<div class="btn-group">
				<c:choose>
					<c:when test='${orderStatus=="open"}'>
						<a href="orders" class="btn btn-primary active" aria-current="page">Current Orders</a>
						<a href="viewCompletedOrders" class="btn btn-outline-primary">Completed Orders</a>
					</c:when>
					<c:otherwise>
						<a href="orders" class="btn btn-outline-primary ">Current Orders</a>
						<a href="viewCompletedOrders" class="btn btn-primary active" aria-current="page">Completed Orders</a>
					</c:otherwise>
				</c:choose>
				</div>
			</div>
		</div>
		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-6">
				<input type="text" class="form-control" name="searchBar"
					id="searchBar" placeholder="Search For Order" />
			</div>
		</div>
		<!-- This is where the javascript puts the orders list-->
		<div class="overflow-hidden">
			<div class="row justify-content-center mx-auto " id="employeesList"></div>
		</div>
		<script>
		/*
		This script takes the employees json and creates the list of employees.
		It's what allows the list to be searchable by first name last name or email
		*/
		const employeesList = document.getElementById('employeesList');
		const searchBar = document.getElementById('searchBar');
		var orders = JSON.parse('${dataJson}');
		orders.sort(function(a, b){
		    return a.id - b.id;
		});
		searchBar.addEventListener('keyup', (e) => {
		    const searchString = e.target.value.toLowerCase();
		    const filteredEmployees = orders.filter((order) => {
		        return (
		        	(order.user.firstName + ' ' +order.user.lastName).toLowerCase().includes(searchString) ||
		        	order.id.toString().includes(searchString)
		            
		        );
		    });
		    	displayEmployees(filteredEmployees);
		});

		const displayEmployees = (orders) => {
		    const htmlString = orders
		        .map((order) => {
		            return `
					<div class="card mb-3">
						<div class="card-body">
							<h5 class="card-title">` + order.user.firstName + ' ' + order.user.lastName + `</h5>
							<h6 class="card-subtitle mb-2 text-muted">Order ` + order.id + `</h6>
							<p class="card-text">`+ order.orderType +((order.orderType==='dine_in') ? (': Table ' + order.tableNumber) : '')+`</p>
							<a href="orderDetail?orderId=` + order.id + `" class="card-link"><button class="btn btn-primary">More Info</button></a>
							` + ((${orderStatus=='open'}) ? ('<a href="completeOrder?orderId='+ order.id + '" class="card-link"><button class="btn btn-success">Complete</button></a>') : ('<a href="openOrder?orderId=' + order.id + '" class="card-link"><button class="btn btn-danger">Re-Open</button></a>')) + `
							
						</div>
		            </div>
		        `;
		        })
		        .join('');
		    employeesList.innerHTML = htmlString;
		};
		displayEmployees(orders);
	</script>
	</div>
</body>
</html>