<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.*"%>

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


<link rel="stylesheet" href="css/location_details_styles.css">
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

	<!-- Page Information Start-->
	<div id="page-data">
		<!-- Location Banner Start-->
		<div class='location-banner-container'>
			<div class='location-banner'>
				<div class='innerBox'>
					<div class='curDate'>
						<h2>
							Today's Date -
							<%=(new java.util.Date())%></h2>
					</div>
				</div>
				<div class='locationName'>
					<h1 class="dataBlockHeaders">${location.waterBody}-Colorado</h1>
				</div>
			</div>
		</div>
		<!-- Location Banner End-->

		<!-- Location Details Center Page Start-->
		<div class='location-details-container'>
			<!-- Location Data Box Start-->
			<div class='location-details'>
				<h2 class="dataBlockHeaders">Location</h2>
				<div class='locationTitle'>
					<h3>${location.name }
						<c:if test="${location.name != location.waterBody}">
						 - ${location.waterBody}
					</c:if>
					</h3>
					<h3>${location.longitude}${location.latitude}</h3>
				</div>
				<h2 class="dataBlockHeaders">Accessibility</h2>
				<div class='difficulty'>
					<h3>${location.access.name }</h3>
				</div>
				<h2 class="dataBlockHeaders">Area</h2>
				<div class='locationArea'>
					<h3>${location.area}-Colorado</h3>
				</div>
			</div>
			<!-- Location Data Box End-->

			<!-- Location Description Start -->
			<div class='description-details'>
				<h2 class="dataBlockHeaders">Description</h2>
				<div class='locationDescription'>
					<p>${location.description}</p>
				</div>
				<h2 class="dataBlockHeaders">Location Notes</h2>
				<div class='locationFishingNotes'>${location.fishingNotes}</div>
			</div>
			<!-- Location Description End-->

			<!-- Reports Box Start -->
			<div class='current-report-details'>
				<h2 class="dataBlockHeaders">Current Reports</h2>
				<div class="reportControl">
				<c:choose>
					<c:when test="${empty location.reports}">
						<div class='report'>
							<h3>No Reports Submitted</h3>
						</div>
					</c:when>
					<c:otherwise>
						<c:forEach items="${location.reports}" var="report">
							<c:if test="${report.active eq true }">
								<div class='report'>
									<a class="reportLink" href="#${report.id}" aria-label="close">${report.date}
										<br>Report Id: ${report.id}
										<br>
										 By: ${report.userProfile.user.userName} | Fish Caught: <c:if
											test="${fn:length(report.caughtFishList) != 0}">
								${fn:length(report.caughtFishList)} 
							</c:if> <c:if test="${fn:length(report.caughtFishList) == 0}">
								None
							</c:if>
									</a>
								</div>
							</c:if>
						</c:forEach>
					</c:otherwise>
				</c:choose>
				</div>
				<!-- Map Details-->
		<div class='map-container'>
			<div class='map-details'>

				<div id="map"></div>
    <script>
    var map;
     function initMap() {/*  */
    	 /* var j; */
       map = new google.maps.Map(document.getElementById('map'), {
   		zoom:14,
   		center: new google.maps.LatLng(${location.getLongitude()}, ${location.getLatitude()}),
   		zoom: 13,
   		mapTypeId: google.maps.MapTypeId.ROADMAP
   	});
   	var infowindow = new google.maps.InfoWindow({});
   	var marker;
   	var i = 0;
   	var markers = [];
   	var mapInfo;
   	 
   		marker = new google.maps.Marker({
   			position: new google.maps.LatLng(${location.getLongitude()}, ${location.getLatitude()}),
   			map: map
   		});
   		google.maps.event.addListener(
   		      marker,
   		      'click',
   		      (function(marker, i) {
   		        return function() {
   		          infowindow.setContent('<font size="3" color="black"><strong> Name: "${location.getName()}"</strong></font><br><font size="2" color="blue">\r\
   		          		BodyOfWater: "${location.getWaterBody()}"<br> Accessibility: "${location.getAccess().getName()}"<br>\
   		        		URL: <a href="${location.getMapUrl()}">"${location.getMapUrl()}"</a></font>')
   		          infowindow.open(map, marker)
   		        }
   		      })(marker, i)
   		    )
/*    		markers.push(marker); */
   		i++;
    	/*  var markerCluster = new MarkerClusterer(map, markers);
      google.maps.event.addDomListener(window, 'load', initMap);  */
     }
     
   
     
   </script>
       <script src="https://developers.google.com/maps/documentation/javascript/examples/markerclusterer/markerclusterer.js">
   </script>
    <script
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBy5Cu9_ocZUjeCAfmNH3GqaMU-rOIm_Fg&callback=initMap"
        async defer></script>

			</div>
		</div>
		<!-- Extra Details-->
			</div>
			<!-- Reports Box End -->
		</div>


	<!-- Location Details Center Page End-->

	</div>
	<!-- Page Information Start-->

	<!-- Nav Bar Start-->
	<ul class="botnav">
		<c:choose>
			<c:when test="${sessionScope.user != null}">
				<!-- <li id="navLeft"><a href="getUserSplash.do">Home</a></li> -->
			</c:when>
		</c:choose>
		<li id="navLeft"><a class="btn" href="#searchModal">Search</a></li>
		<li id="navLeft"><a href="showAllLocations.do">All Locations</a></li>
		<c:choose>
			<c:when test="${sessionScope.user != null}">
				<li id="navLeft"><a class="btn" href="#userModal">${user.userName}'s Profile</a></li>
				<li id="navLeft"><a class="btn" href="#addReportModal">Add
						Report</a></li>
			</c:when>
		</c:choose>
		<li id="navRight" class="right"><a href="logoutUser.do"> <c:choose>
					<c:when test="${sessionScope.user != null}">Logout</c:when>
					<c:otherwise>Login</c:otherwise>
				</c:choose>
		</a></li>
	</ul>
	<!-- Nav Bar End-->
	<!--  Bottom of Page End-->


	<%-- 
        		<a href="${location.mapUrl}">Map of Location</a>
        		 --%>

<!-- Add Report Modal Start-->
	<div class="light-modal" id="addReportModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Add A New Report</h3>
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content EMILY! edit here-->

				<form action="createReport.do" method="POST">

					<input type="hidden" value="${location.id }" name="locationId">
					<input type="hidden" value="${user.userProfile.id }"
						name="profileId"> <input type="hidden" value="true"
						name="active">

					<label for="comment">Comment: </label> <input type="text"
						name="comment"> <br> <br> <label
						for="caughtFishForReport">List of Fish</label> <select
						name="fishTypeId">
						<c:forEach var="curFish" items="${fishList}">
							<option value="${curFish.id}">${curFish.name}</option>
						</c:forEach>

					</select> <label for="lengthInches">Length of Fish (inches): </label> <input
						type="text" name="lengthInches"> <br> <label
						for="weightLbs">Weight of Fish (lbs): </label> <input type="text"
						name="weightLbs"> <br> <label for="rodType">Rod
						Type Used: </label> <input type="text" name="rodType"> <br> <label
						for="lureType">Lure Type Used: </label> <input type="text"
						name="lureType"> <br> <br> <br> <input

						type="submit" value="Submit Form" class="light-modal-close-btn"
						aria-label="close" />


				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- Add Report Modal End-->


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

					Search by <select name="searchCategory">
						<option value="location">Body of Water:</option>
						<!-- <option value="fish" >Fish:</option> -->


						<option value="accessibility">Accessibility (Easy,Medium, Hard):</option>
					</select>
					<br>
					<br>
					<input type="text" name="keyword" /> 
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
				<h3 class="light-modal-heading">${user.userName}'s Profile</h3>
				<!-- <a href="#updateUserModal" class="light-modal-close-btn"
					aria-label="close">Update Profile</a> -->
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
						<p>${user.userProfile.lastName},${user.userProfile.firstName}</p>
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

				<form id="updateForm" action="updateUserProfileReport.do"
					method="POST">
					<h4>User Name:</h4>
					<p></p>
					<br> <label for="email">Email: </label> <input type="text"
						name="email" value="${sessionScope.user.email}"> <br>
					<label for="firstName">First Name: </label> <input type="text"
						name="firstName"
						value="${sessionScope.user.userProfile.firstName}"> <br>
					<label for="lastName">Last Name: </label> <input type="text"
						name="lastName" value="${sessionScope.user.userProfile.lastName}">
					<br> <label for="city">City: </label> <input type="text"
						name="city" value="${sessionScope.user.userProfile.city}">
					<br> <label for="state">State: </label> <input type="text"
						name="email" value="${sessionScope.user.userProfile.state}">
					<br> <br> <label for="aboutMe">About Me: </label> <input
						type="text" name="aboutMe"
						value="${sessionScope.user.userProfile.aboutMe}"> <br>
					<label for="imageUrl">Profile Picture: </label> <input type="text"
						name="imageUrl" value="${sessionScope.user.userProfile.imageUrl}">
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


	<!-- Report Modal-->
	<c:forEach items="${location.reports}" var="report">


		<c:if test="${report.active eq true }">

			<div class="light-modal" id="${report.id}" role="dialog"
				aria-labelledby="light-modal-label" aria-hidden="false">

				<div class="light-modal-content animated zoomInUp">
					<!-- light modal header -->

					<div class="light-modal-header">
						<h3 class="light-modal-heading">
							<b>${report.userProfile.user.userName}'s</b> Report On
							${report.date}
						</h3>
						<c:choose>
							<c:when test="${user.id eq report.userProfile.user.id}">
								<a href="#${report.id}${user.id}" class="light-modal-close-btn"
									aria-label="close">Update</a>
								<input type="submit" class="light-modal-close-btn"
									form="{report.id }{report.id }{report.id }" value="Delete" />
							</c:when>
						</c:choose>
					</div>

					<!-- light modal body Start-->
					<div class="light-modal-body">
						<!-- My Content Start-->
						<!-- Content Container Start-->
						<div class="reportBody">
							<!-- Report Details Container Start -->
							<div class="reportDetails">

								<h3>Comment:</h3>
								<p>${report.comment }</p>
							</div>
							<!-- Report Details Container End -->
							<!--  Fish Reported or Not Container Start -->
							<div class="reportFishBlock">
								<div class="fishes">
									<h3>Fish Caught at this Location:</h3>
									<hr>

									<c:if test="${fn:length(report.caughtFishList) == 0}">
								No Fish added to this Report
							</c:if>
									<c:if test="${fn:length(report.caughtFishList) != 0}">
										<c:forEach items="${report.caughtFishList }" var="caughtFish">
											<a href="${caughtFish.fishType.wikiUrl }" target="_blank">
												<img class="fish-image"
												src="${caughtFish.fishType.imageUrl}"> <br> <b>Fish
													Type:</b> ${caughtFish.fishType.name } <br> <b>Size:</b>${caughtFish.lengthInches }
												inches, ${caughtFish.weightLbs} lbs. <br> <b>Rod
													Type:</b> ${caughtFish.rodType } <br> <b>Lure Type:</b>
												${caughtFish.lureType } <br> <br>
											</a>
										</c:forEach>
									</c:if>
								</div>

							</div>
							<!--  Fish Reported or Not Container End-->
						</div>
						<!-- Content Container End-->
						<!-- My Content End-->
					</div>
					<!-- light modal body End-->

					<!-- light modal footer -->
					<div class="light-modal-footer">
						<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>

						<form action="deleteReport.do" method="POST"
							id="{report.id }{report.id }{report.id }">
							<input type="hidden" name="reportId" value="${report.id }">
						</form>


					</div>

				</div>
			</div>
		</c:if>

		<!-- Update Report Modal-->
		<div class="light-modal" id="${report.id}${user.id}" role="dialog"
			aria-labelledby="light-modal-label" aria-hidden="false">

			<div class="light-modal-content animated zoomInUp">
				<!-- light modal header -->
				<div class="light-modal-header">


					<h3 class="light-modal-heading">Update Report Report Id:
						${report.id}</h3>

					<input type="submit" class="light-modal-close-btn"
						aria-label="close" form="${user.id}${report.id}"
						value="Commit Update" />

					<!-- <a href="#updateUserReportModal" class="light-modal-close-btn"
					aria-label="close">Commit Update</a> -->



				</div>
				<!-- light modal body -->
				<div class="light-modal-body">
					<!-- My Content -->



				<form action="updateReport.do" id="${user.id}${report.id}" method="POST">
				<input type="hidden" value="${report.id}" name="id">
						<%-- <c:forEach items="${report.caughtFishList }" var="caughtFish">

							<label for="fishType">Fish Type: </label>
							<input type="text" name="fishType"
								value="${caughtFish.fishType.name}">
							<br>
							<label for="lengthInches">Fish Length (inches): </label>
							<input type="text" name="lengthInches"
								value="${caughtFish.lengthInches}">
							<br>
							<label for="weightLbs">Fish Weight (lbs): </label>
							<input type="text" name="weightLbs"
								value="${caughtFish.weightLbs}">
							<br>
							<label for="rodType">Rod Type: </label>
							<input type="text" name="rodType" value="${caughtFish.rodType}">
							<br>
							<label for="lureType">Lure Type: </label>
							<input type="text" name="lureType" value="${caughtFish.lureType}">
							<br>
						</c:forEach> --%>
						<%-- <input type="text" name="comment" value="${report.caught.comment}"> --%>

							<br>
					<br>
					<label for="comment">Comment:</label> 
					<input type="text" name="comment" value="${report.comment}" size=50>
					<br>



					</form>
				</div>
				<!-- light modal footer -->
				<div class="light-modal-footer">
					<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>

				<!-- <a href="#updateUserModal" class="light-modal-close-btn"></a>
				<a href="removeReport.do" method="POST" class="light-modal-close-btn"
					aria-label="close">Delete Report</a> -->
				<form action="deleteReport.do" method="POST">

						<input type="hidden" name="reportId" value="${report.id }">
						<input type="submit" value="Delete Report">
					</form>

				</div>
			</div>
		</div>

		<!-- Update Report Modal-->


	</c:forEach>
	<!-- Report Modal-->




</body>
</html>