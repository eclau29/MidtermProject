<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Raleway">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>



  
 	
   <!-- Page Information-->
  
    <div class='location-details-container'>
      <div class='location-details'>
        <div class='date'>Aug 14, 2016</div>
        <div class='signup'>Location Details</div>
        <div class='login'>Login</div>
      </div>
    </div>
    
    <div class='location-details--container'>
      <div class='location-details'>
        <div class='date'>Aug 14, 2016</div>
        <div class='signup'>Location Details</div>
        <div class='login'>Login</div>
      </div>
    </div>
    
    <div class='report-list-container'>
      <div class='report-list-details'>
        <div class='date'>Aug 14, 2016</div>
        <div class='signup'>Report List</div>
        <div class='login'>Login</div>
      </div>
    </div>
    
    <div class='current-report-container'>
      <div class='current-report-details'>
        <div class='date'>Aug 14, 2016</div>
        <div class='signup'>Current Report</div>
        <div class='login'>Login</div>
      </div>
    </div>
<!-- Page Information-->
    
            
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
        		<a href="${location.mapUrl }">Map of Location</a>
        		<br>
        		Accessibility: ${location.access.name }
        		<br>
        		Location Description: ${location.description}
        		<br>
        		Fishing Notes: ${location.fishingNotes}</p>
        	
        	
      </div>
    </div>
    <div class="w3-third w3-container">
     <div class="w3-container w3-white">
        <p><b>List of Reports for This Location</b></p>
        <p>
        	<c:forEach items="${location.reports }" var="report">
        		<p>
        		Posted By: ${report.userProfile.firstName }
        		<br>
        		Date of Report: ${report.date }
        		<br>
        		Fish Caught at this Location:
        			<c:forEach items="${report.caughtFishList }" var = "caughtFish">
        				${caughtFish.fishType.name }: ${caughtFish.lengthInches } inches, ${caughtFish.weightLbs } lbs
        				<br>
        				Rod Type: ${caughtFish.rodType }
        				<br>
        				Lure Type: ${caughtFish.lureType }
        				<br>
        			</c:forEach>
        		<br>
        		Comment: ${report.comment }
        		<br>
        		</p>
        		
        	
        	</c:forEach>
        </p>
      </div>
    </div>
  </div>
</div>
<div>
</div>  --%>
<!-- Grid Information-->



<!-- Nav Bar -->
		<ul class="botnav">
			<li id="navLeft"><a href="getUserSplash.do">Home</a></li>
			<li id="navLeft"><a class="btn" href="#searchModal">Search</a></li>
			<li id="navLeft"><a href="showAllLocations.do">Locations</a></li>
			<li id="navLeft"><a class="btn" href="#userModal">User Profile</a></li>
			<li id="navLeft"><a class="btn" href="#addReportModal">Add Report</a></li>
			<li id="navRight" class="right"><a href="logoutUser.do">Logout</a></li>
		</ul>
		<!-- Nav Bar -->
		
		<!-- Report Modal-->
	<div class="light-modal" id="reportModal" role="dialog"
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
	
	<!-- Add Report Modal-->
	<div class="light-modal" id="addReportModal" role="dialog"
		aria-labelledby="light-modal-label" aria-hidden="false">
		<div class="light-modal-content animated zoomInUp">
			<!-- light modal header -->
			<div class="light-modal-header">
				<h3 class="light-modal-heading">Add Report to ${location.name }</h3>
				
			</div>
			<!-- light modal body -->
			<div class="light-modal-body">
				<!-- My Content -->
				<form action="getSearchResults.do" method="GET">
				
					
				</form>
			</div>
			<!-- light modal footer -->
			<div class="light-modal-footer">
				<a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
			</div>
		</div>
	</div>
	<!-- Add Report Modal-->
	
	<!-- Update Report Modal-->
	<div class="light-modal" id="updateReportModal" role="dialog"
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
	<!-- Update Report Modal-->


</body>
</html>