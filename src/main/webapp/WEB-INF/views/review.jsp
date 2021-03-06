<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Review</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-GKugkVcT8wqoh3M8z1lqHbU+g6j498/ZT/zuXbepz7Dc09/otQZxTimkEMTkRWHP" crossorigin="anonymous">
</head>
<body>

<main class="container">

		<section class="jumbotron">

			<h2 class="display-1">Party Options</h2>

		</section>

		<section>

			<h3 class="display-2">Pizzas</h3>

			<table class="table">
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Votes</th>
					<th></th>
				</tr>

				<c:forEach var="option" items="${options}">
					<tr>
						<td><c:out value="${option.name}" /></td>
						<td><c:out value="${option.description}" /></td>
						<td><c:out value="${option.votes}" /></td>
					</tr>
				</c:forEach>
			</table>

			
		</section>
		
		
		
				
		<a class="btn btn-dark" href="/">Party List</a>
		
		
	</main>

</body>
</html>