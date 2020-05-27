<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit Party</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-GKugkVcT8wqoh3M8z1lqHbU+g6j498/ZT/zuXbepz7Dc09/otQZxTimkEMTkRWHP" crossorigin="anonymous">
</head>

<body>

<main class="container">

		<section class="jumbotron">

			<h2 class="display-3">Edit: <c:out value="${party.name}" /></h2>

		</section>
		
		<section>

			<form method="post">

				<input name="id" type="hidden" value="${party.id}">

				<div class="form-group">
					<label>Name</label> 
					<input class="form-control" name="name" value="${party.name}">
				</div>

				<div class="form-group">
					<label>Date</label> 
					<input type="date" class="form-control" name="date" value="${party.date}">
				</div>

				<button class="btn btn-primary">Submit</button>

				<a href="/" class="btn btn-light">Cancel</a>

			</form>

		</section>



	</main>


</body>
</html>