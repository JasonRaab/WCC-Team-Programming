<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Users</title>
</head>
<body>


    <!--     <div> -->
    <!--         <table class="table"> -->

    <%--             <c:forEach var="eachAddress" items="${address}"> --%>
    <!--                 <tr> -->
    <%--                     <td>${eachAddress.streetAddress}</td> --%>
    <!--                 </tr> -->
    <%--             </c:forEach> --%>

    <!--         </table> -->
    <!--     </div> -->

    <div>
        <table class="table">

            <c:forEach var="eachUser" items="${user}">
                <tr>
                    <td>${eachUser.firstName}</td>
                    <td>${eachUser.lastName}</td>
                    <td>${eachUser.email}</td>

                </tr>
            </c:forEach>

        </table>
    </div>

    <div>
        <table class="table">

            <c:forEach var="address" items="${lucifer.addresses}">
                <tr>
                    <td>${address.streetAddress}</td>
                    <td>${address.city}</td>
                    <td>${address.zip}</td>

                </tr>
            </c:forEach>

        </table>
    </div>

</body>
</html>