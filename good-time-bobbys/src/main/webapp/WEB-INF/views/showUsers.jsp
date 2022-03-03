<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
=======
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show Users</title>
</head>
<body>


<<<<<<< HEAD
<!-- 	<div> -->
<!-- 		<table class="table"> -->

<%-- 			<c:forEach var="eachAddress" items="${address}"> --%>
<!-- 				<tr> -->
<%-- 					<td>${eachAddress.streetAddress}</td> --%>
<!-- 				</tr> -->
<%-- 			</c:forEach> --%>

<!-- 		</table> -->
<!-- 	</div> -->
	
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
=======
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
>>>>>>> ef9be5a1e0220a02281f881c9f300ff8a9447d3e


</body>
</html>