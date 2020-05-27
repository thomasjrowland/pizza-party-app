<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Party Admin</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-GKugkVcT8wqoh3M8z1lqHbU+g6j498/ZT/zuXbepz7Dc09/otQZxTimkEMTkRWHP" crossorigin="anonymous">
</head>
<body>


<main class="container">

		<section class="jumbotron">

			<h2 class="display-1">Party Admin</h2>
			
			<a class="btn btn-dark" href="/">Home</a>
			
		</section>

		<section>



			<table class="table">
				
				<c:forEach var="party" items="${partyList}">
					<tr>
						<td><c:out value="${party.name}" /></td>
						<td><c:out value="${party.date}" /></td>
						<td><a class="btn btn-dark" href="/edit?id=${party.id}">Edit</a></td>
						<td><a class="btn btn-danger" href="/delete/${party.id}">Delete</a></td>
					</tr>
				</c:forEach>
			</table>

			
		</section>
		
		
		<section>
			<h5 class="display-3">Add a new party:</h5>
		
			<form action="/add-party" method="post">
				<label>Name:</label>
				<input type="text" name="name">
				<label>Date:</label>
				<input type="date" name="date">
				
				<button class="btn btn-dark">Add</button>
				 
			</form>
		</section>
		
		

	</main>


</body>
</html>