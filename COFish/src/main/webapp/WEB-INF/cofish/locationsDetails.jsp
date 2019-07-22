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
<title>User Portal</title>
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
						<h2>Todays Date - <%=(new java.util.Date())%></h2>
					</div>
				</div>
				<div class='locationName'>
						<h1 class="dataBlockHeaders">${location.waterBody} - Colorado</h1>
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
					</c:if></h3>
					<h3>+${location.longitude} -${location.latitude}</h3>
				</div>
				<h2 class="dataBlockHeaders">Accessibility</h2>
				<div class='difficulty'>
					<h3>${location.access.name }</h3>
				</div>
				<h2 class="dataBlockHeaders">Area</h2>
				<div class='locationArea'>
					<h3>${location.area} - Colorado</h3>
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
							<br>Report Id: ${report.id} By: ${report.userProfile.user.userName} | Fish Caught:
							
							<c:if test="${fn:length(report.caughtFishList) != 0}">
								${fn:length(report.caughtFishList)} 
							</c:if> 
							<c:if test="${fn:length(report.caughtFishList) == 0}">
								None
							</c:if>
						</a>
					</div>
					</c:if>
				</c:forEach>
				</c:otherwise>
				</c:choose>
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
				<li id="navLeft"><a href="getUserSplash.do">Home</a></li>
			</c:when>
		</c:choose>
		<li id="navLeft"><a class="btn" href="#searchModal">Search</a></li>
		<li id="navLeft"><a href="showAllLocations.do">All Locations</a></li>
		<c:choose>
			<c:when test="${sessionScope.user != null}">
				<li id="navLeft"><a class="btn" href="#userModal">User
						Profile</a></li>
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

	<!-- Create Report Modal-->
	<div class="light-modal" id="addReportModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Add Report</h3>
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content EMILY! edit here-->

				<form action="createReport.do" method="POST">
					<input type="hidden" value="${location.id }" name="locationId">
					<input type="hidden" value="${user.userProfile.id }"
						name="profileId"> <input type="hidden" value="true"
						name="active">
					<!-- <label for="date">Date: </label>
					<input type="datetime-local" name="date">
					<br> -->
					<%--
					<label for="comment">Comment: </label> <input type="text"
						name="comment"> <br> <br> <input type="submit"
						value="Submit Form" class="light-modal-close-btn"
						aria-label="close" />


					<!-- <form action="createCaughtFish.do" method="POST"> -->
					<label for="caughtFish">Fish Caught: </label> <select
						name="fishType">
						<c:forEach items="${sessionScope.fishType}">
							<option value="${fishType.name }">Type of Fish:</option>
						</c:forEach>
					</select>
					<!-- line below is a test -->
					<input type="hidden" name="fishType" value="Rainbow Trout">
					<label for="lengthInches">Length of Fish (inches): </label> <input
						type="number" name="lengthInches"> <br> <label
						for="weightLbs">Weight of Fish (lbs): </label> <input
						type="number" name="weightLbs"> <br> <label
						for="rodType">Rod Type Used: </label> <input type="text"
						name="rodType"> <br> <label for="lureType">Lure
						Type Used: </label> <input type="text" name="lureType"> <br>
					<br> <br> <select name="fishType">
						<c:forEach items="${fishType}">
							<option value="${fishType.name }">Type of Fish:</option>
						</c:forEach>
					</select> <label for="lengthInches">Length of Fish (inches): </label> <input
						type="text" name="lengthInches"> <br> <label
						for="weightLbs">Weight of Fish (lbs): </label> <input type="text"
						name="lengthInches"> <br> <label for="rodType">Rod
						Type Used: </label> <input type="text" name="rodType"> <br> <label
						for="lureType">Lure Type Used: </label> <input type="text"
						name="lureType"> <br> <br> <br> <select
						name="fishType">
						<c:forEach items="${fishType}">
							<option value="${fishType.name }">Type of Fish:</option>
						</c:forEach>
					</select> <label for="lengthInches">Length of Fish (inches): </label> <input
						type="text" name="lengthInches"> <br> <label
						for="weightLbs">Weight of Fish (lbs): </label> <input type="text"
						name="lengthInches"> <br> <label for="rodType">Rod
						Type Used: </label> <input type="text" name="rodType"> <br> <label
						for="lureType">Lure Type Used: </label> <input type="text"
						name="lureType"> <br> <br> <br>
--%>

					<label for="comment">Comment: </label>
					<input type="text" name="comment">
					<br>
					<br>
					<label for="caughtFishForReport">List of Fish</label>
					<select name="fishTypeId">
						<c:forEach var="curFish" items="${fishList}">
							<option value="${curFish.id}">${curFish.name}</option>
						</c:forEach>
					</select>
					
								<label for="lengthInches">Length of Fish (inches): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="weightLbs">Weight of Fish (lbs): </label>
								<input type="text" name="weightLbs">
								<br>
								<label for="rodType">Rod Type Used: </label>
								<input type="text" name="rodType">
								<br>
								<label for="lureType">Lure Type Used: </label>
								<input type="text" name="lureType">
								<br>
								<br>
								<br>
					
					<input

						type="submit" value="Submit Form" class="light-modal-close-btn"
						aria-label="close" />

					<!-- <form action="createCaughtFish.do" method="POST"> -->
					<%-- <label for="caughtFish">Fish Caught: </label>
							<select name="fishType">
									<option value="fishType">Rainbow Trout: </option>
							</select>
								<!-- line below is a test -->
								<input type="hidden" name="fishType" value="Rainbow Trout">
								<label for="lengthInches">Length of Fish (inches): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="weightLbs">Weight of Fish (lbs): </label>
								<input type="text" name="weightLbs">
								<br>
								<label for="rodType">Rod Type Used: </label>
								<input type="text" name="rodType">
								<br>
								<label for="lureType">Lure Type Used: </label>
								<input type="text" name="lureType">
								<br>
								<br>
								<br>
								
								
							<select name="fishType">
								<c:forEach items="${fishType}">
									<option value="${fishType.name }">Type of Fish: </option>
								</c:forEach>
							</select>
							
								<label for="lengthInches">Length of Fish (inches): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="weightLbs">Weight of Fish (lbs): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="rodType">Rod Type Used: </label>
								<input type="text" name="rodType">
								<br>
								<label for="lureType">Lure Type Used: </label>
								<input type="text" name="lureType">
								<br>
								<br>
								<br>
								
								
							<select name="fishType">
								<c:forEach items="${fishType}">
									<option value="${fishType.name }">Type of Fish: </option>
								</c:forEach>
							</select>
							
								<label for="lengthInches">Length of Fish (inches): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="weightLbs">Weight of Fish (lbs): </label>
								<input type="text" name="lengthInches">
								<br>
								<label for="rodType">Rod Type Used: </label>
								<input type="text" name="rodType">
								<br>
								<label for="lureType">Lure Type Used: </label>
								<input type="text" name="lureType">
								<br>
								<br>
								<br> --%>

				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- Report Modal-->

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
						<option value="accessibility">Accessibility (Easy,
							Medium, Hard):</option>
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
				<a href="#updateUserModal" class="light-modal-close-btn"
					aria-label="close">Update</a>
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
				<p>${user.userProfile.city},${user.userProfile.state}</p>
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
				<input type="submit" class="light-modal-close-btn" form="updateForm"
					value="Commit Update" />
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<form id="updateForm" action="updateUserProfileReport.do" method="POST">
					<h4>User Name:</h4>
					<p></p>
					<br>
				<label for="email">Email: </label> 
					<input type="text" name="email" value="${sessionScope.user.email}">
					<br>
				<label for="firstName">First Name: </label> 
					<input type="text" name="firstName" value="${sessionScope.user.userProfile.firstName}">
					<br>
				<label for="lastName">Last Name: </label> 
					<input type="text" name="lastName" value="${sessionScope.user.userProfile.lastName}">
					<br>
				<label for="city">City: </label> 
					<input type="text" name="city" value="${sessionScope.user.userProfile.city}">
					<br>
				<label for="state">State: </label> 
					<input type="text" name="email" value="${sessionScope.user.userProfile.state}">
					<br>
					<br>
				<label for="aboutMe">About Me: </label> 
					<input type="text" name="aboutMe" value="${sessionScope.user.userProfile.aboutMe}">
					<br>
				<label for="imageUrl">Profile Picture: </label> 
					<input type="text" name="imageUrl" value="${sessionScope.user.userProfile.imageUrl}">
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

	<!-- Add Report Modal-->
	<%-- <div class="light-modal" id="addReportModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Add Report to ${location.name }</h3>

			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<form action="createReport.do" method="POST">
				
				
				
				 <input type="submit" value="Add Report" class="light-modal-close-btn" aria-label="close" />
				
				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div> --%>
	<!-- Add Report Modal-->

	<!-- Report Modal-->
	<c:forEach items="${location.reports}" var="report">

	
				<c:if test="${report.active eq true }">
				
		<div class="light-modal" id="${report.id}" role="dialog"
			aria-labelledby="light-modal-label" aria-hidden="false">
			
			<div class="light-modal-content animated zoomInUp">
				<!-- light modal header -->
				
				<div class="light-modal-header">
					<h3 class="light-modal-heading">${report.userProfile.user.userName}'s
						Report On ${report.date}</h3>
					<c:choose>
						<c:when test="${user.id eq report.userProfile.user.id}">
								<a href="#${report.id}${user.id}" class="light-modal-close-btn" aria-label="close">Update</a>
						</c:when>
					</c:choose>
				</div>
				<!-- light modal body -->
				<div class="light-modal-body">
					<!-- My Content -->


					<br> <b>Date of Report:</b> ${report.date } <br> <br> <b>Fish
						Caught at this Location:</b> <br>
					<c:forEach items="${report.caughtFishList }" var="caughtFish">
						<b>Fish Type:</b> ${caughtFish.fishType.name }


        				<br>
							<b>Size:</b>${caughtFish.lengthInches } inches, ${caughtFish.weightLbs} lbs.
        				<br>
							<b>Rod Type:</b> ${caughtFish.rodType }
        				<br>
							<b>Lure Type:</b> ${caughtFish.lureType }
        				<br>
						</c:forEach>
						<br> <b>Comment:</b>
						<p>${report.comment }</p>
						<br>
					<form action="deleteReport.do" method="POST" id="{report.id }{report.id }{report.id }">
						<input type="hidden" name="reportId" value="${report.id }">
					</form>

					</div>
					<!-- light modal footer -->
					<div class="light-modal-footer">
						<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
						
						<input type="submit" class="light-modal-close-btn"
								 form="{report.id }{report.id }{report.id }" value="Delete"/>
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

				<h3 class="light-modal-heading">Update Report  Report Id: ${report.id}</h3>
				
				<input type="submit" class="light-modal-close-btn"
					aria-label="close" form= "${user.id}${report.id}" value="Commit Update"/>

				<!-- <a href="#updateUserReportModal" class="light-modal-close-btn"
					aria-label="close">Commit Update</a> -->


			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->


				<form action="updateReport.do" id="${user.id}${report.id}" method="POST">
				<input type="hidden" value="${report.id}" name="id">
						<c:forEach items="${report.caughtFishList }" var="caughtFish">
							<label for="fishType">Fish Type: </label>
							<input type="text" name="fishType" value="${caughtFish.fishType.name}">
							<br>
							<label for="lengthInches">Fish Length (inches): </label>
							<input type="text" name="lengthInches" value="${caughtFish.lengthInches}">
							<br>
							<label for="weightLbs">Fish Weight (lbs): </label>
							<input type="text" name="weightLbs" value="${caughtFish.weightLbs}">
							<br>
							<label for="rodType">Rod Type: </label>
							<input type="text" name="rodType" value="${caughtFish.rodType}">
							<br>
							<label for="lureType">Lure Type: </label>
							<input type="text" name="lureType" value="${caughtFish.lureType}">
							<br>
						</c:forEach>
						<%-- <input type="text" name="comment" value="${report.caught.comment}"> --%>
							<br>
					<br>
					<label for="comment">Comment:</label> 
					<input type="text" name="comment" value="${report.comment}">
					<br>

				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
				<!-- <a href="#updateUserModal" class="light-modal-close-btn" -->
				<!-- <a href="deleteReport.do" method="POST" class="light-modal-close-btn"
					aria-label="close">Delete Report</a> -->
				<%-- <form action="deleteReport.do" method="POST">
						<input type="hidden" name="reportId" value="${report.id }">
						<input type="submit" value="Delete Report">
					</form> --%>
			</div>
		</div>
	</div>
	
	<!-- Update Report Modal-->
				
				
	</c:forEach>
	<!-- Report Modal-->

	


</body>
</html>