<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>User Portal</title>
<link rel="stylesheet" href="css/search_results_styles.css">
<!-- animate is giving a 404 so commented out -->
<!-- <link rel="stylesheet" href="css/Animate.css"> -->
<link rel="stylesheet" href="css/light-modal.min.css">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="/css/nav_bar.css">
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>


<div class="wrapper">
  <h1>Static Layout</h1>
  <header> Search Results </header>
  
<ul class="topnav">
  <li><a href="getUserSplash.do">Home</a></li>
  <li><a class="btn" href="#searchModal">Search</a></li>
  <li><a href="getSearchResults.do">Locations</a></li>
  <li class="right"><a href="logoutUser.do">Logout</a></li>
  <li><a class="btn" href="#userModal">User Profile</a></li>
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
        <c:forEach items="${allLocations }" var="location">
        	<a href="findLocationById.do?locationId=${location.id }">${location.name }</a>
        	<br>
        </c:forEach>
      </div>
    </div>
    
  </div>
</div>
<div>
</div>



<!-- Search Modal-->
	<div class="light-modal" id="searchModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Search</h3>
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<form action="getSearchResults.do" method="GET">
				
					Search by <select>
						<option value="location">Location:</option>
						<option value="fish">Fish:</option>
						<option value="accessibility">Accessibility:</option>
					</select>
					<br> 
					<br> 
					 <input type="text" /> 
					<br> 
					<br> 
					<input
						type="submit" value="Show Locations" class="light-modal-close-btn"
						aria-label="close" />
				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- Search Modal-->
	
	<!-- UserProfile Modal-->
	<div class="light-modal" id="userModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">User Profile</h3>
				<a href="#updateUserModal" class="light-modal-close-btn" aria-label="close">Update Profile</a>
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<h4>User Name</h4>
				<p>${user.userName}</p>
				<br>
				<h4>Email</h4>
				<p>${user.email}</p>
				<br>
				<h4>First Name</h4>
				<p>${user.userProfile.firstName}</p>
				<br>
				<h4>Last Name</h4>
				<p>${user.userProfile.lastName}</p>
				<br>
				<h4>Address</h4>
				<p>${user.userProfile.city}, ${user.userProfile.state}</p>
				<br>
				<h4>About</h4>
				<p>${user.userProfile.aboutMe}</p>
				<br>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- UserProfile Modal-->
	
	<!-- Update UserProfile Modal-->
	<div class="light-modal" id="updateUserModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">User Profile</h3>
				<input type="submit" class="light-modal-close-btn" form="updateForm" value="Commit Update"/>
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<form id="updateForm" action="getSearchResults.do" method="GET">
				<h4>User Name:</h4>
				<p></p>
				<br>
				<h4>Email:</h4>
				<p></p>
				<br>
				<h4>First Name:</h4>
				<p></p>
				<br>
				<h4>Last Name:</h4>
				<p></p>
				<br>
				<h4>Address:</h4>
				<p></p>
				<br>
				<h4>About:</h4>
				<p></p>
				<br>
				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- Update UserProfile Modal-->


</body>
</html>