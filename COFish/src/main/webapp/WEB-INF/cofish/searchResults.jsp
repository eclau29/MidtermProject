<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:choose>
		<c:when test="${sessionScope.user != null}">
			${user.userName}'s Portal
		</c:when>
		<c:when test="${sessionScope.user == null}">
			Guest Portal
		</c:when>
		
	</c:choose></title>
<link rel="stylesheet" href="css/search_results_styles.css">
<link rel="stylesheet" href="css/light-modal.min.css">
<link rel="stylesheet" href="/css/w3.css">
<link rel="stylesheet" href="/css/nav_bar.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>
	<!-- Top Of Page -->
	<!-- Page Information-->
	<div class="page-data">
		<!-- Search Results Banner-->
		<div class='search-banner-container'>
			<div class='search-banner'>
				<div class='innerBox'>
					<div class='curDate'>
						<h2>
							Today's Date -
							<%=(new java.util.Date())%></h2>
					</div>
				</div>
				<h1 class="dataBlockHeaders">Search Results - Colorado</h1>
			</div>
		</div>
		<!-- Search Results Banner-->

		<!-- Search Results Start-->
		<div class='search-results-container'>


			<div class='current-search-container'>
				<h1 class="dataBlockHeaders">Available Locations</h1>

				<c:choose>
					<c:when test="${empty allLocations}">
						<div class='search-details'>
							<h3>No Locations Found</h3>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${allLocations}" var="location">
							<div class='search-details'>
								<a href="findLocationById.do?locationId=${location.id }">
									${location.name }<c:if
										test="${location.name != location.waterBody}"> - ${location.waterBody}</c:if>
									<br>
										Accessibility - ${location.access.name }
								</a>
							</div>
						</c:forEach>
					</c:otherwise>
				</c:choose>
			</div>

			<!-- Search Results End -->


			<!-- Map Details Start-->
			<div class='map-details-container'>
				<h1 class="dataBlockHeaders">Mapped Results</h1>
				<br>
				<div id="map"></div>
				<script>
    var map;
     function initMap() {/*  */
    	 /* var j; */
       map = new google.maps.Map(document.getElementById('map'), {
   		zoom: 13,
   		center: new google.maps.LatLng(39.769795, -105.46082),
   		zoom: 10,
   		mapTypeId: google.maps.MapTypeId.ROADMAP
   	});
   	var infowindow = new google.maps.InfoWindow({});
   	var marker;
   	var i = 0;
   	var markers = [];
    	 <c:forEach var="L" items = "${allLocations}">
    		
   		marker = new google.maps.Marker({
   			position: new google.maps.LatLng(${L.getLongitude()}, ${L.getLatitude()}),
   			map: map
   		});
   		markers.push(marker);
    	 </c:forEach>
    	 var markerCluster = new MarkerClusterer(map, markers);
      google.maps.event.addDomListener(window, 'load', initMap); 
      console.log(markers);
     }
     
   
     
   </script>
				<script
					src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
   </script>
				<script
					src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBy5Cu9_ocZUjeCAfmNH3GqaMU-rOIm_Fg&callback=initMap"
					async defer></script>

			</div>
			<!-- Map Details End-->
		</div>
		<!-- Search Results -->



		<!-- Nav Bar -->
		<ul class="botnav">
			<c:choose>
				<c:when test="${sessionScope.user != null}">
					<!-- 	<li id="navLeft"><a href="getUserSplash.do">Home</a></li> -->
				</c:when>
			</c:choose>
			<li id="navLeft"><a class="btn" href="#searchModal">Search</a></li>
			<li id="navLeft"><a href="showAllLocations.do">All Locations</a></li>
			<c:choose>
				<c:when test="${sessionScope.user != null}">
					<li id="navLeft"><a class="btn" href="#userModal">User
							Profile</a></li>
				</c:when>
			</c:choose>
			<li id="navRight" class="right"><a href="logoutUser.do"> <c:choose>
						<c:when test="${sessionScope.user != null}">Logout</c:when>
						<c:otherwise>Login</c:otherwise>
					</c:choose>
			</a></li>
		</ul>
		<!-- Nav Bar -->
	</div>
	<!-- Page Information-->


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
					</select> <br> <br> <input type="text" /> <br> <br> <input
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
				<!-- <a href="#updateUserModal" class="light-modal-close-btn"
					aria-label="close">Update</a> -->
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<div class="userContent">
				<div class="userInfo">
				<h4>User Name</h4>
				<p>${user.userName}</p>
				<br>
				<h4>Email</h4>
				<p>${user.email}</p>
				<br>
				<h4>Full Name</h4>
				<p>${user.userProfile.lastName}, ${user.userProfile.firstName}</p>
				<br>
				<h4>Address</h4>
				<p>${user.userProfile.city},${user.userProfile.state}</p>
				</div>
				<div class="userAbout">
				<h4>About</h4>
				<p>${user.userProfile.aboutMe}</p>
				</div>
				</div>
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
				<input type="submit" class="light-modal-close-btn" form="updateForm"
					value="Commit Update" />
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