<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Patient Centricity - HCP Login</title>

<script>
	var ctx = "${pageContext.request.contextPath}";
</script>
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/common/bootstrap.css
	type="text/css" />
<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/jquery-ui.css
	type="text/css" />

<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/hcp/layout.css
	type="text/css" />

<!-- Include the hcp css -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>

<!-- Include the hcp css -->
<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-1.10.2.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-ui.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/hcp/hcp.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/ajax.js></script>
<!-- HCP JS files -->

<script>
	history.pushState(null, null, ctx + '/hcp.ptcn');
	window.addEventListener('popstate', function(event) {
		history.pushState(null, null, ctx + '/hcp.ptcn');
	});

	//Clear messages
	function clearMsg() {
		//document.getElementById('err').innerHTML='&nbsp';
		//document.getElementById('err1').innerHTML='&nbsp';
	}
</script>

<style type="text/css">
.margin-top-70 {
	margin-top: 70px;
}
</style>

</head>
<body class="login-bg">
	<nav class="navbar navbar-default navbar-fixed-top">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<a class="navbar-brand" href="#"><img
				src=${pageContext.request.contextPath}/web/images/common/wipro_logo.png></a>
			<a class="navbar-brand logo-text" href="#">COLLABORATIVE CARE-HCP
				PORTAL</a>
		</div>

		<div class="pull-right nav-right" style="width: 20%;">
			<form class="form-horizontal">
				<div class="form-group">
					<label for="inputEmail3" class="col-sm-6 control-label">About
						us | Contact Us</label>
					<div class="col-sm-6">
						<select class="form-control">
							<option>English</option>
							<option>Others</option>
						</select>
					</div>
				</div>
			</form>



		</div>
	</div>
	</nav>


	<div class="container margin-top-120">
		<div class="row">
			<div class="col-md-8">
				<!-- Contents can go here -->
			</div>
			<div class="col-md-4">
				<div class="panel panel-default login">
					<div class="panel-body">
						<h4 class="text-muted text-center">LOG IN</h4>
						<hr />
						<form
							action=${pageContext.request.contextPath}/hcp/assign-patient.ptcn
							method="post">
							<center>
								<c:if test="${msg != null}">
									<div id=err class="alert alert-danger" role="alert">
										<b>${msg}</b>
									</div>
								</c:if>

								<c:if test="${logout != null}">
									<div id=err1 class="alert alert-success" role="alert">
										<b>${logout}</b>
									</div>
								</c:if>

							</center>
							<div class="form-group has-default has-feedback">
								<label for="hcpName">Email ID/Mobile</label> <input type="email"
									class="form-control" id=hcpName name="username"
									placeholder="jhon@mail.com"> <span
									class="fa fa-envelope form-control-feedback" aria-hidden="true"></span>
							</div>

							<div class="form-group has-default has-feedback">
								<label for="hcpPass">Password</label> <input type="password"
									class="form-control" id=hcpPass name="password"
									placeholder="Password"> <span
									class="fa fa-lock form-control-feedback" aria-hidden="true"></span>
							</div>

							<button type="submit"
								class="btn btn-default btn-block btn-info btn-lg"
								onclick="return validateLogin();">Login</button>

							<div class="clearfix margin-top-20">
								<a href="#" class="pull-left">Create an account?</a> <a href="#"
									class="pull-right">Forgot password?</a>
							</div>

						</form>
					</div>
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

</body>
</html>