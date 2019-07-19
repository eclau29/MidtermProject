<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest Portal</title>
<link rel="stylesheet" href="css/search_styles.css">
</head>
<body>
<div class="wrapper">
  <h1>Search Page</h1>
  <header>HEADER</header>
  <nav>NAV<form action="home.do" method="GET">
		<input type="submit" value="Logout" />
	</form>
	<br>
	<form action="getUserSplash.do" method="GET">
		<input type="submit" value="Home" />
	</form></nav>
  <section>
	<div id="main">
	<form action="searchResults.do" method="GET">
			Search by Location: <input type="text" /> <input type="submit"
				value="Show Locations" />
		</form>
		<form action="searchResults.do" method="GET">
			Search by Fish: <input type="text" /> <input type="submit"
				value="Show Fish" />
		</form>
		<form action="searchResults.do" method="GET">
			Search by Accessibility: <input type="text"/> <input type="submit"
				value="Show Accessibility" />
		</form>
	</div>

</section>
</div>
<div>
</div>
</body>
</html>