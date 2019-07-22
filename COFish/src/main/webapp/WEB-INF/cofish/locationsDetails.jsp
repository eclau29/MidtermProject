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

	<!-- Page Information-->
	<div id="page-data">
		<!-- Location Banner-->
		<div class='location-banner-container'>
			<div class='location-banner'>
				<div class='innerBox'>
					<div class='locationName'>
						<h1>${location.waterBody}</h1>
					</div>
					<div class='curDate'>
						<h2>
							Todays Date -
							<%=(new java.util.Date())%></h2>
					</div>
				</div>
			</div>
		</div>
		<!-- Location Banner-->

		<!-- Location Details-->
		<div class='location-details-container'>
			<div class='location-details'>

				<div class='locationTitle'>
					<h2>${location.name }</h2>
						<c:if test="${location.name != location.waterBody}">
							<h3>${location.waterBody}</h3>
						</c:if>
					</div>
				<div class='difficulty'>
					<h3>Difficulty: ${location.access.name }</h3>
				</div>
				

				<div class='locationArea'>
					Location Details
					<p>${location.area }</p>
				</div>
				<div class='locationDescription'>
				 <p>${location.description}</p>
				</div>
				<div class='locationFishingNotes'>
				Fishing Notes: ${location.fishingNotes}
				</div>
			</div>
		</div>
		<!-- Location Details-->

		<!-- Report List-->
		<div class='report-list-container'>
			<div class='current-report-details'>
				<h3>Current Reports</h3>
				<c:forEach items="${location.reports}" var="report">
					<div class='report'>
						<a class="reportLink" href="#${report.id}" aria-label="close">${report.date}
							<br> By: ${report.userProfile.user.userName} | Fish Caught:
							<c:if test="${fn:length(report.caughtFishList) != 0}">
								${fn:length(report.caughtFishList)} 
							</c:if> 
							<c:if test="${fn:length(report.caughtFishList) == 0}">
								None
							</c:if>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
		<!-- Report List-->
</div>
	<!-- Page Information-->
		<!-- Nav Bar -->
		<ul class="botnav">
			<c:choose>
				<c:when test="${sessionScope.user != null}">
					<li id="navLeft"><a href="getUserSplash.do">Home</a></li>
				</c:when>
			</c:choose>
			<li id="navLeft"><a class="btn" href="#searchModal">Search</a></li>
			<li id="navLeft"><a href="showAllLocations.do">Locations</a></li>
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
		<!-- Nav Bar -->

	

	<%--   <div class="w3-row-padding">
    <div class="w3-third w3-container w3-margin-bottom w3-margin-top">
      
      <div class="w3-container w3-white w3-padding-64">
        <p><b>Reports</b></p>
        <p>Praesent tincidunt sed tellus ut rutrum. Sed vitae justo condimentum, porta lectus vitae, ultricies congue gravida diam non fringilla.</p>
      </div>
    </div>
    <div class="w3-third w3-container w3-margin-bottom">
      
      <div class="w3-container w3-white">
        <p><b>Location Details</b></p>
        	Note: CSS doesn't like <ul> and <li> tags...
        	
        		<p>Location Name: ${location.name }
        		<br>
        		Body of Water: ${location.waterBody }
        		<br>
        		Region: ${location.area }
        		<br>
        		<a href="${location.mapUrl}">Map of Location</a>
        		<br>
        		Accessibility: ${location.access.name }
        		<br>
        		Location Description: ${location.description}
        		<br>
        		Fishing Notes: ${location.fishingNotes}</p>
        	
       
</div>  --%>




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
		<div class="light-modal" id="${report.id}" role="dialog"
			aria-labelledby="light-modal-label" aria-hidden="false">
			<div class="light-modal-content animated zoomInUp">
				<!-- light modal header -->
				<div class="light-modal-header">
					<h3 class="light-modal-heading">${report.userProfile.user.userName}'s
						Report On ${report.date}</h3>
					<c:choose>
						<c:when test="${user.id eq report.userProfile.user.id}">
							<a href="#updateUserReportModal" class="light-modal-close-btn"
								aria-label="close">Update Report</a>
						</c:when>
					</c:choose>
				</div>
				<!-- light modal body -->
				<div class="light-modal-body">
					<!-- My Content -->

					<br> <b>Date of Report:</b> ${report.date } <br> <b>Fish
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

				</div>
				<!-- light modal footer -->
				<div class="light-modal-footer">
					<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
				</div>
			</div>
		</div>
	</c:forEach>
	<!-- Report Modal-->

	<!-- Update Report Modal-->
	<div class="light-modal" id="updateUserReportModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Update Report</h3>

				<a href="#updateUserModal" class="light-modal-close-btn"
					aria-label="close">Commit Update</a>

			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->

				<form action="updateReport.do" method="GET">
					<label for="comment">Comment:</label> <input type="text"
						name="comment" value="${report.comment}"> <br> <label
						for="">Comment:</label> <input type="text" name="comment"
						value="${report.comment}"> <br>



				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
				<a href="#updateUserModal" class="light-modal-close-btn"
					aria-label="close">Delete Report</a>
			</div>
		</div>
	</div>
	<!-- Update Report Modal-->


</body>
</html>