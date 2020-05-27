<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Pizza Options</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-GKugkVcT8wqoh3M8z1lqHbU+g6j498/ZT/zuXbepz7Dc09/otQZxTimkEMTkRWHP" crossorigin="anonymous">
</head>
<body>

<main class="container">

		<section class="jumbotron">

			

		</section>

		<section>

			<h3 class="display-2">Options</h3>

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
						<td><a class="btn btn-light" href="/vote/${option.id}">Vote</a></td>
					</tr>
				</c:forEach>
			</table>

			
		</section>
		

		
	
		
		<section>
			<form action="/add-option" method="post">
				<label>Name:</label>
				<input type="text" name="name">
				<label>Type:</label>
				<select name="type">
					  <option value="pizza">Pizza</option>
					  <option value="side">Side</option>
					  <option value="drink">Drink</option>
				 </select>
				 <label>Description:</label>
				<input type="text" name="description">
				<input type="hidden" name="party" value="${partyId}"/>
				
				<button class="btn btn-dark">Add</button>
				 
			</form>
		</section>
		
		
		<div>
			<a class="btn btn-dark" href="/">Party List</a>
			
		</div>
	</main>

</body>
</html>