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
					<li class="nav-item"><a class="nav-link" href="stock?type=MenuItem">Stock</a></li>
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

		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-3">
				<h3>${employeeList.size()}&nbsp;Clocked-in Employees</h3>
			</div>
		</div>

		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<div class="col-6">
				<input type="text" class="form-control" name="searchBar"
					id="searchBar" placeholder="Search For Employee" />
			</div>
		</div>

		<form action="addEmployee" method="post">
			<div class="mb-3">
				<button class="btn btn-success">+
						Add New</button>
			</div>
		</form>

		<div class="row justify-content-center g-2 mb-3 mt-3 mx-auto">
			<!-- This is where the javascript puts the employee list-->
			<div id="employeesList"></div>
		</div>
	</div>
	<script>
		/*
		This script takes the employees json and creates the list of employees.
		It's what allows the list to be searchable by first name last name or email
		*/
		const employeesList = document.getElementById('employeesList');
		const searchBar = document.getElementById('searchBar');
		var employees = JSON.parse('${dataJson}');

		searchBar.addEventListener('keyup', (e) => {
		    const searchString = e.target.value.toLowerCase();
		
		    const filteredEmployees = employees.filter((employee) => {
		        return (
		        	(employee.firstName + ' ' + employee.lastName).toLowerCase().includes(searchString) ||	//valid if result is in part of the first and/or last name
		            employee.email.toLowerCase().includes(searchString)	//valid if result is in part of the email
		            
		        );
		    });
		    	displayEmployees(filteredEmployees);
		});
	

		const displayEmployees = (employees) => {
		    const htmlString = employees
		        .map((employee) => {
		            return `
					<div class="card mb-3">
						<div class="card-body">
							<h5 class="card-title">` + employee.firstName + ' ' +employee.lastName + `
								</h5>
							<h6 class="card-subtitle mb-2 text-muted">` + employee.email + `</h6>
							<p class="card-text"></p>
							<a href="updateEmployee?employeeID=` + employee.userId + `" class="card-link">
								<button class="btn btn-primary">Modify</button>
							</a>
						</div>
		            </div>
		        `;
		        })
		        .join('');
		    employeesList.innerHTML = htmlString;
		};
		displayEmployees(employees);
	</script>
</body>
</html>