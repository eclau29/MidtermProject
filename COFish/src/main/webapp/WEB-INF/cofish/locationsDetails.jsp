<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Guest Portal</title>
<link rel="stylesheet" href="css/location_details_styles.css">
</head>
<body>
<div class="wrapper">
  <h1>Location Details</h1>
  <header>HEADER</header>
  <nav>NAV<form action="home.do" method="GET">
		<input type="submit" value="Logoout" />
	</form>
	<form action="getUserSplash.do" method="GET">
		<input type="submit" value="Home" />
	</form>
	<br>
	<form action="searchPage.do" method="GET">
		<input type="submit" value="SEARCH" />
	</form></nav>
  <section>
	<div id="main">
	<form action="addReport.do" method="GET">
		<input type="submit" value="Add" />
	</form>
	<br>
	<form action="updateReport.do" method="GET">
		<input type="submit" value="Update" />
	</form>
	
	</div>

</section>
</div>
<div>
</div>
</body>
</html>