<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Good Time Bobby's Menu</title>
</head>
<body>
<div>
        <table class="table">

            <c:forEach var="eachItem" items="${menuItem}">
                <tr>
                    <td>${eachItem.itemName}</td>
                </tr>
            </c:forEach>

        </table>
    </div>
<%--     <div>
        <table class="table">

            <c:forEach var="eachIngr" items="${menuItem}">
                <tr>
                    <td>${eachIngr.ingredientName}</td>
                </tr>
            </c:forEach>

        </table>
    </div> --%>

</body>
</html>