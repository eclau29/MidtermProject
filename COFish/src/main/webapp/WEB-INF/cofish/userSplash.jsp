<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Portal</title>
<link rel="stylesheet" href="css/user_splash_styles.css">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="/css/nav_bar.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>


<div class="wrapper">
  <h1>Static Layout Example</h1>
  <header> Welcome User Banner </header>
  
<ul class="topnav">
  <li><form action="getUserSplash.do" method="GET"><a>Home</a></form></li>
  <li><a class="btn" href="#openModal">Search</a></li>
  <li><a href="#contact">My Info</a></li>
  <li class="right"><a href="logout.do">Logout</a></li>
</ul>

   <!-- Grid Information-->
  <div class="w3-row-padding">
    <div class="w3-third w3-container w3-margin-bottom">
      
      <div class="w3-container w3-white">
        <p><b>Reports</b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
    <div class="w3-third w3-container w3-margin-bottom">
      
      <div class="w3-container w3-white">
        <p><b>Lorem Ipsum</b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
    <div class="w3-third w3-container">
     <div class="w3-container w3-white">
        <p><b>Lorem Ipsum</b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
  </div>
</div>
<div>
</div>


<!-- Search Modal-->
<div id="openModal" class="modalDialog">
    <div>	<a href="#close" title="Close" class="close">X</a>

        	<h2>Modal Box</h2>
<div id="main">
	<form action="searchResults.do" method="GET">
			Search by Location: <input type="text" /> <input type="submit"
				value="Show Locations" />
		</form>
		</div>
        <p>This is a sample modal box that can be created using the powers of CSS3.</p>
        <p>You could do a lot of things here like have a pop-up ad that shows when your website loads, or create a login/register form for users.</p>
    </div>
</div>
<!-- Search Modal-->



</body>
</html>