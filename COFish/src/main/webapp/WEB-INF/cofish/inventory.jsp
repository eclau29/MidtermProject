<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<!-- Modal Template-->
<div class="light-modal" id="searchModal" role="dialog" aria-labelledby="light-modal-label" aria-hidden="false">
        <div class="light-modal-content animated zoomInUp">
            <!-- light modal header -->
            <div class="light-modal-header">
                <h3 class="light-modal-heading">Search Reports</h3>
                <a href="#" class="light-modal-close-icon" aria-label="close">&times;</a>
            </div>
            <!-- light modal body -->
            <div class="light-modal-body">
                <!-- Your content -->
                <form action="searchResults.do" method="GET">
			Search by Location: <input type="text" /> <input type="submit"
				value="Show Locations" />
		</form>
            </div>
            <!-- light modal footer -->
            <div class="light-modal-footer">
                <a href="#" class="light-modal-close-btn" aria-label="close">Close</a>
            </div>
        </div>
    </div>
    <!-- Model Template -->

</body>
</html>