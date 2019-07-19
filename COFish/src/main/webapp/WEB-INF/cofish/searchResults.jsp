<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Search Results</title>
<link href="css/bootstrap.min.css" rel="stylesheet"></head>
<link rel="stylesheet" href="css/search_results_styles.css">
<body>
 <h1>SearchResults</h1>
  <header>Welcome User Banner
  <form action="home.do" method="GET">
		<input type="submit" value="Logout" />
	</form>
	<br>
	<form action="getUserSplash.do" method="GET">
		<input type="submit" value="Home" />
	</form>
	<form action="locationDetails.do" method="GET">
		<input type="submit" value="Locations" />
	</form>
  </header>
	
<section>
<div>
<h3>Your Results:</h3>
		<%-- <c:choose>
		Locations --%>
		<%-- <c:when test="${! empty locations}">
			<c:forEach var="l" items="${locations }">
				<ul>
					<li>info</li>
					<li>info</li>
					<li>info</li>
					<li>info</li>
					
				</ul>
				<c:forEach var="s" items="${subcat}">
					<ul>
						<li>info</li>
						<li>info</li>
					</ul>
				</c:forEach>
			</c:forEach>
		</c:when> --%>
		
		<%-- <c:otherwise> --%>
			<p>No locations found</p>
	<%-- 	</c:otherwise> --%>
	<%-- </c:choose> --%>
	</div>
</section>
 
</body>
</html>