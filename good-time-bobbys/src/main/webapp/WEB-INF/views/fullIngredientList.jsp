<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show all Ingredients</title>
</head>
<body>

	<div>
		<table class="table">

			<c:forEach var="eachIngredient" items="${ingredient}">
				<tr>
					<td>${eachIngredient.ingredientName}</td>
				</tr>
			</c:forEach>

		</table>
	</div>

</body>
</html>