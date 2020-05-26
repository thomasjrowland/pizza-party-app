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
			
		</section>

		<section>



			<table class="table">
				
				<c:forEach var="party" items="${partyList}">
					<tr>
						<td><c:out value="${party.name}" /></td>
						<td><c:out value="${party.date}" /></td>
					</tr>
				</c:forEach>
			</table>

			<a class="btn btn-dark" href="/vote">Options & Votes</a>
			<a class="btn btn-dark" href="/review">Review Options</a>



		</section>
		
		

	</main>

</body>
</html>