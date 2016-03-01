<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Centricity - HCP</title>
<script>
	var ctx = "${pageContext.request.contextPath}";
</script>
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/common/bootstrap.css
	type="text/css" />
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/jquery-ui.css
	type="text/css" />
<!-- Include the hcp css -->

<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/hcp/layout.css
	type="text/css" />

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-1.10.2.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-ui.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/ajax.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/hcp/hcp.js></script>



<!-- HCP JS files -->
<style type="text/css">
.margin-top-60 {
	margin-top: 60px;
}

.margin-top-50 {
	margin-top: 50px;
}

.bg-grey {
	background-color: #efefef;
}
</style>
</head>
<body class="login-bg-blur">
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><img
				src=${pageContext.request.contextPath}/web/images/common/wipro_logo.png></a>
			<a class="navbar-brand logo-text" href="#">COLLABORATIVE CARE-HCP
				PORTAL</a>
		</div>
		<div id="navbar" class="collapse navbar-collapse">

			<ul class="nav navbar-nav navbar-right margin-top-20">
				<li><a href="#"> Welcome <%=request.getSession().getAttribute("userName")%></a></li>
				<li><a href=${pageContext.request.contextPath}/hcp/logout.ptcn>Logout</a></li>
			</ul>

			<img
				src=${pageContext.request.contextPath}/web/images/common/patient.png
				class="pull-right margin-top-25">

		</div>
	</div>
	</nav>

	<div class="masthead margin-top-90">

		<nav>
		<ul class="nav nav-justified">
			<li class="active"><a
				href=${pageContext.request.contextPath}/hcp/assign-patient.ptcn>
					<i class="fa fa-user fa-2x"></i> <span class="child">Assign
						and view patients</span>
			</a></li>
			<li><a
				href=${pageContext.request.contextPath}/hcp/register-patient.ptcn>
					<i class="fa fa-user-plus fa-2x"></i> <span class="child">Register
						patients</span>
			</a></li>
			<li><a href="#"> <i class="fa fa-file-text fa-2x"></i> <span
					class="child">Patient's report</span>
			</a></li>
			<li><a href="#"> <i class="fa fa-video-camera fa-2x"></i> <span
					class="child">Virtual appointment</span>
			</a></li>
			<li><a href="#"> <i class="fa fa-graduation-cap fa-2x"></i>
					<span class="child">Patient education</span>
			</a></li>
			<li><a href="#"> <i class="fa fa-heartbeat fa-2x"></i> <span
					class="child">Update treatment schedule</span>
			</a></li>
			<li><a href="#"> <i class="fa fa-book fa-2x"></i> <span
					class="child">My learnings</span>
			</a></li>
		</ul>
		</nav>
	</div>

	<div class="container margin-top-50">
		<div class="panel panel-default">
			<div class="panel-body">
				<h5>Patients List</h5>

				<div class="patient-data-cnt">

					<div class="patient-data">Please wait...</div>

				</div>
			</div>
		</div>
	</div>

	<footer class="footer">
	<div class="container">
		<p class="text-center margin-top-20">Solution | Company | Legal |
			Follow Us</p>
	</div>
	</footer>

	<script type="text/javascript">
		$(document).ready(function() {
			getPatientListToAssign();
		});
	</script>
</body>
</html>