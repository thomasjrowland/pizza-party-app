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

				<c:forEach var="pizza" items="${pizzas}">
					<tr>
						<td><c:out value="${pizza.name}" /></td>
						<td><c:out value="${pizza.description}" /></td>
						<td><c:out value="${pizza.votes}" /></td>
						<td><a class="btn btn-light" href="/vote/${pizza.id}">Vote</a></td>
					</tr>
				</c:forEach>
			</table>

			
		</section>
		
		<section>

			<h3 class="display-2">Sides</h3>

			<table class="table">
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Votes</th>
					<th></th>
				</tr>

				<c:forEach var="side" items="${sides}">
					<tr>
						<td><c:out value="${side.name}" /></td>
						<td><c:out value="${side.description}" /></td>
						<td><c:out value="${side.votes}" /></td>
						<td><a class="btn btn-light" href="/vote/${side.id}">Vote</a></td>
					</tr>
				</c:forEach>
			</table>

			
		</section>
		
		<section>

			<h3 class="display-2">Drinks</h3>

			<table class="table">
				<tr>
					<th>Name</th>
					<th>Description</th>
					<th>Votes</th>
					<th></th>
				</tr>

				<c:forEach var="drink" items="${drinks}">
					<tr>
						<td><c:out value="${drink.name}" /></td>
						<td><c:out value="${drink.description}" /></td>
						<td><c:out value="${drink.votes}" /></td>
						<td><a class="btn btn-light" href="/vote/${drink.id}">Vote</a></td>
					</tr>
				</c:forEach>
			</table>
			
		</section>
		
		<section>
			<form action="/add" method="post">
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
				
				<button class="btn btn-dark">Add</button>
				 
			</form>
		</section>
		<div>
			<a class="btn btn-dark" href="/">Party List</a>
			<a class="btn btn-dark" href="/review">Review Options</a>
		</div>
	</main>

</body>
</html>