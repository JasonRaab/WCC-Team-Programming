<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<style>
.parent {
/* 	blue */
	background-color: hsla(200, 100%, 20%); 
	height: 400px;
	width: 400px;
}

.child {
	background-color: red;
	height: 50%;
	width: 50%;
	transition: transform 1s ease-in;
}

.parent:hover .child {
	animation: left-to-right 1s ease-in;
}

@keyframes left-to-right {
	100%{
		transform: translateX(100%);
	}
	
	
}
</style>
<title>Hello World!</title>
</head>
<body>

	<div class="parent">
		<div class="child"></div>
	</div>
	
	<div>
		
	</div>
	
</body>
</html>