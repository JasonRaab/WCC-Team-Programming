<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<style>
#table {
	font-family: Arial, Helvetica, sans-serif;
	border-collapse: collapse;
	width: 80%;
	margin: auto;
}

#table td, #table th {
	border: 1px solid #ddd;
	padding: 8px;
}

#table tr:nth-child(even) {
	background-color: #f2f2f2;
}

#table tr:hover {
	background-color: #ddd;
}

#table th {
	padding-top: 12px;
	padding-bottom: 12px;
	text-align: left;
	background-color: #04AA6D;
	color: white;
}
</style>
<meta charset="ISO-8859-1">
<title>Show Filtered Ingredients</title>
</head>
<body>

	<div class="container">
		<div class="card">
			<table class="table">
				<tr>
					<th>Scorpion Burger Ingredients</th>
				</tr>
				<c:forEach var="eachIngredient" items="${ingredients}">
					<tr>
						<td>${eachIngredient.ingredientName}</td>
						<td>
						
						<input type="radio" name="${eachIngredient.ingredientId}" value="1" />Add To Item 
						<input type="radio" name="${eachIngredient.ingredientId}" value="0" />Remove from Item</td>

<!-- 			To get the radio buttons to work "horizontaly" we assigned the ingredientId to the name
<!--			 so each row would have the same name.
<!-- 			This ties the RB's to each other allowing the selection to be within the same table row.
<!--			For RB's to work together they must be tied by group name. IE same name attribute.
<!--			EDIT THIS COMMENT IF IT DOENS"T MAKE SENSE LATER (LoL) -->

					</tr>
				</c:forEach>

			</table>
			<script>
				function tableRowIndex(x) {
					x.rowIndex;
				}
			</script>
		</div>
	</div>

</body>
</html>