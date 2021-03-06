<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Party List</title>
<link href="https://stackpath.bootstrapcdn.com/bootswatch/4.5.0/cyborg/bootstrap.min.css" rel="stylesheet" integrity="sha384-GKugkVcT8wqoh3M8z1lqHbU+g6j498/ZT/zuXbepz7Dc09/otQZxTimkEMTkRWHP" crossorigin="anonymous">
</head>
<body>

	<main class="container">

		<section class="jumbotron">

			<h2 class="display-1">Parties</h2>
			
			<form action="/parties">

				<input type="text" name="keyword" placeholder="Search party by name" />

				<button class="btn btn-dark">Search</button>
				
			</form>
			
			<a class="btn btn-dark" href="/party-admin">Admin Options</a>
			
		</section>

		<section>



			<table class="table">
				
				<c:forEach var="party" items="${partyList}">
					<tr>
						<td><c:out value="${party.name}" /></td>
						<td><c:out value="${party.date}" /></td>
						<td><a class="btn btn-dark" href="/vote?id=${party.id}">ADD/VOTE</a></td>
						<td><a class="btn btn-dark" href="/review?id=${party.id}">Review</a></td>
						
			
					</tr>
				</c:forEach>
			</table>

			
			



		</section>
		
		

	</main>

</body>
</html>