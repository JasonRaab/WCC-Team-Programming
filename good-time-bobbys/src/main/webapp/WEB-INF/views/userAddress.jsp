<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<div>
		<table class="table">

			<c:forEach var="eachAddress" items="${address}">
				<tr>
					<td>${eachAddress.streetAddress}</td>
					<td>${eachAddress.city}</td>
					<td>${eachAddress.state}</td>
					<td>${eachAddress.zip}</td>
				</tr>
			</c:forEach>

		</table>
	</div>

</body>
</html>