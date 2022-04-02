<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
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
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="card">
			<%-- 			<form:form action="orderDetails" method="post" --%>
			<%-- 				modelAttribute="orderID"> --%>
			<table>
				<tr>
					<td>
						<%
						String[] ingredientAddedArray = request.getParameterValues("ingredientAdded");
						if (ingredientAddedArray != null) {
							for (int i = 0; i < ingredientAddedArray.length; i++) {
								out.println(" " + ingredientAddedArray[i] + "");
							}
						} else
							out.println("none!");
						%>
					</td>
				</tr>
			</table>
		</div>

	</div>
	<div class="container">
		<div class="card">
			<%-- 			<form:form action="orderDetails" method="post" --%>
			<%-- 				modelAttribute="orderID"> --%>
			<table>
				<tr>
					<td>
						<c:forEach var="eachCheckbox" items="${ingredientAdded}">
							<tr>
								<td>${eachCheckbox}</td>
							</tr>
						</c:forEach>
					</td>
				</tr>
			</table>
		</div>

	</div>
</body>
</html>