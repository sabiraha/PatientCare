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
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.5.0/css/font-awesome.min.css">

<link rel="stylesheet"
	href=${pageContext.request.contextPath}/web/css/hcp/layout.css
	type="text/css" />

<link href='https://fonts.googleapis.com/css?family=Roboto'
	rel='stylesheet' type='text/css'>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-1.10.2.min.js></script>
<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/jquery-ui.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/common/ajax.js></script>

<script type="text/javascript"
	src=${pageContext.request.contextPath}/web/js/hcp/hcp.js></script>
<!-- HCP JS files -->

<style>
.margin-top-60 {
	margin-top: 60px;
}

.margin-top-50 {
	margin-top: 50px;
}

.push-right-10 {
	margin-right: 10px;
}

.default-hide {
	display: none;
}

.row {
	margin-right: 0px;
	margin-left: 0px;
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
			<li><a
				href=${pageContext.request.contextPath}/hcp/assign-patient.ptcn>
					<i class="fa fa-user fa-2x"></i> <span class="child">Assign
						and view patients</span>
			</a></li>
			<li class="active"><a
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


	<div class="row margin-top-20">
		<div class="container">
			<div class="row">
				<div class="col-md-3"></div>
				<div class="col-md-6">
					<div class="panel panel-default register">
						<div class="panel-body">


							<div class="step-1">


								<div>
									<div class="row progress-text">
										<div class="col-md-4 text-center active">
											<span class="circle">1</span> User profile
										</div>
										<div class="col-md-4 text-center">
											<span class="circle">2</span> Disease page
										</div>
										<div class="col-md-4 text-center">
											<span class="circle">3</span> My Habits
										</div>
									</div>
								</div>

								<hr />

								<h4 class="text-muted">Enter patient's basic information</h4>

								<div class="row">
									<div class="col-md-4">
										<img data-src="holder.js/140x140" class="img-thumbnail"
											alt="140x140" style="width: 140px; height: 140px;"
											src="data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBlbmNvZGluZz0iVVRGLTgiIHN0YW5kYWxvbmU9InllcyI/PjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgdmlld0JveD0iMCAwIDE0MCAxNDAiIHByZXNlcnZlQXNwZWN0UmF0aW89Im5vbmUiPjwhLS0KU291cmNlIFVSTDogaG9sZGVyLmpzLzE0MHgxNDAKQ3JlYXRlZCB3aXRoIEhvbGRlci5qcyAyLjYuMC4KTGVhcm4gbW9yZSBhdCBodHRwOi8vaG9sZGVyanMuY29tCihjKSAyMDEyLTIwMTUgSXZhbiBNYWxvcGluc2t5IC0gaHR0cDovL2ltc2t5LmNvCi0tPjxkZWZzPjxzdHlsZSB0eXBlPSJ0ZXh0L2NzcyI+PCFbQ0RBVEFbI2hvbGRlcl8xNTBkM2M2MDAxMSB0ZXh0IHsgZmlsbDojQUFBQUFBO2ZvbnQtd2VpZ2h0OmJvbGQ7Zm9udC1mYW1pbHk6QXJpYWwsIEhlbHZldGljYSwgT3BlbiBTYW5zLCBzYW5zLXNlcmlmLCBtb25vc3BhY2U7Zm9udC1zaXplOjEwcHQgfSBdXT48L3N0eWxlPjwvZGVmcz48ZyBpZD0iaG9sZGVyXzE1MGQzYzYwMDExIj48cmVjdCB3aWR0aD0iMTQwIiBoZWlnaHQ9IjE0MCIgZmlsbD0iI0VFRUVFRSIvPjxnPjx0ZXh0IHg9IjQ1LjUiIHk9Ijc0LjUiPjE0MHgxNDA8L3RleHQ+PC9nPjwvZz48L3N2Zz4="
											data-holder-rendered="true" />

										<nav>
										<ul class="pager">
											<li><a href="#">Upload Photo</a></li>

										</ul>
										</nav>
									</div>
									<div class="col-md-8">
										<form class="form-horizontal">
											<div class="form-group">
												<label for="userName" class="col-sm-2 control-label">Name</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="userName"
														placeholder="No Special Characters">
												</div>
											</div>
											<div class="form-group">
												<label for="email" class="col-sm-2 control-label">Email</label>
												<div class="col-sm-10">
													<input type="email" class="form-control" id="email"
														placeholder="jhon.smith@email.com">
												</div>
											</div>

											<div class="form-group">
												<label for="inputEmail3" class="col-sm-2 control-label">Gender</label>
												<div class="col-sm-10">
													<div class="checkbox pull-left">
														<label> <input type="radio" name="gender"
															class="gender" value="F"> Female
														</label>
													</div>
													<div class="checkbox pull-left">
														<label> <input type="radio" name="gender"
															class="gender" value="M"> Male
														</label>
													</div>
													<!-- <div class="checkbox pull-left">
														<label> <input type="radio" name="gender"
															class="gender" value="O"> I rather not say
														</label>
													</div> -->
												</div>
											</div>

											<div class="form-group">
												<label for="country" class="col-sm-2 control-label">Country</label>
												<div class="col-sm-10">
													<select id="country" class="form-control">
														<option disabled="disabled" selected="selected">Select</option>
														<option value="AF">Afghanistan</option>
														<option value="AL">Albania</option>
														<option value="DZ">Algeria</option>
														<option value="AS">American Samoa</option>
														<option value="AD">Andorra</option>
														<option value="AG">Angola</option>
														<option value="AI">Anguilla</option>
														<option value="AG">Antigua &amp; Barbuda</option>
														<option value="AR">Argentina</option>
														<option value="AA">Armenia</option>
														<option value="AW">Aruba</option>
														<option value="AU">Australia</option>
														<option value="AT">Austria</option>
														<option value="AZ">Azerbaijan</option>
														<option value="BS">Bahamas</option>
														<option value="BH">Bahrain</option>
														<option value="BD">Bangladesh</option>
														<option value="BB">Barbados</option>
														<option value="BY">Belarus</option>
														<option value="BE">Belgium</option>
														<option value="BZ">Belize</option>
														<option value="BJ">Benin</option>
														<option value="BM">Bermuda</option>
														<option value="BT">Bhutan</option>
														<option value="BO">Bolivia</option>
														<option value="BL">Bonaire</option>
														<option value="BA">Bosnia &amp; Herzegovina</option>
														<option value="BW">Botswana</option>
														<option value="BR">Brazil</option>
														<option value="BC">British Indian Ocean Ter</option>
														<option value="BN">Brunei</option>
														<option value="BG">Bulgaria</option>
														<option value="BF">Burkina Faso</option>
														<option value="BI">Burundi</option>
														<option value="KH">Cambodia</option>
														<option value="CM">Cameroon</option>
														<option value="CA">Canada</option>
														<option value="IC">Canary Islands</option>
														<option value="CV">Cape Verde</option>
														<option value="KY">Cayman Islands</option>
														<option value="CF">Central African Republic</option>
														<option value="TD">Chad</option>
														<option value="CD">Channel Islands</option>
														<option value="CL">Chile</option>
														<option value="CN">China</option>
														<option value="CI">Christmas Island</option>
														<option value="CS">Cocos Island</option>
														<option value="CO">Colombia</option>
														<option value="CC">Comoros</option>
														<option value="CG">Congo</option>
														<option value="CK">Cook Islands</option>
														<option value="CR">Costa Rica</option>
														<option value="CT">Cote D'Ivoire</option>
														<option value="HR">Croatia</option>
														<option value="CU">Cuba</option>
														<option value="CB">Curacao</option>
														<option value="CY">Cyprus</option>
														<option value="CZ">Czech Republic</option>
														<option value="DK">Denmark</option>
														<option value="DJ">Djibouti</option>
														<option value="DM">Dominica</option>
														<option value="DO">Dominican Republic</option>
														<option value="TM">East Timor</option>
														<option value="EC">Ecuador</option>
														<option value="EG">Egypt</option>
														<option value="SV">El Salvador</option>
														<option value="GQ">Equatorial Guinea</option>
														<option value="ER">Eritrea</option>
														<option value="EE">Estonia</option>
														<option value="ET">Ethiopia</option>
														<option value="FA">Falkland Islands</option>
														<option value="FO">Faroe Islands</option>
														<option value="FJ">Fiji</option>
														<option value="FI">Finland</option>
														<option value="FR">France</option>
														<option value="GF">French Guiana</option>
														<option value="PF">French Polynesia</option>
														<option value="FS">French Southern Ter</option>
														<option value="GA">Gabon</option>
														<option value="GM">Gambia</option>
														<option value="GE">Georgia</option>
														<option value="DE">Germany</option>
														<option value="GH">Ghana</option>
														<option value="GI">Gibraltar</option>
														<option value="GB">Great Britain</option>
														<option value="GR">Greece</option>
														<option value="GL">Greenland</option>
														<option value="GD">Grenada</option>
														<option value="GP">Guadeloupe</option>
														<option value="GU">Guam</option>
														<option value="GT">Guatemala</option>
														<option value="GN">Guinea</option>
														<option value="GY">Guyana</option>
														<option value="HT">Haiti</option>
														<option value="HW">Hawaii</option>
														<option value="HN">Honduras</option>
														<option value="HK">Hong Kong</option>
														<option value="HU">Hungary</option>
														<option value="IS">Iceland</option>
														<option value="IN">India</option>
														<option value="ID">Indonesia</option>
														<option value="IA">Iran</option>
														<option value="IQ">Iraq</option>
														<option value="IR">Ireland</option>
														<option value="IM">Isle of Man</option>
														<option value="IL">Israel</option>
														<option value="IT">Italy</option>
														<option value="JM">Jamaica</option>
														<option value="JP">Japan</option>
														<option value="JO">Jordan</option>
														<option value="KZ">Kazakhstan</option>
														<option value="KE">Kenya</option>
														<option value="KI">Kiribati</option>
														<option value="NK">Korea North</option>
														<option value="KS">Korea South</option>
														<option value="KW">Kuwait</option>
														<option value="KG">Kyrgyzstan</option>
														<option value="LA">Laos</option>
														<option value="LV">Latvia</option>
														<option value="LB">Lebanon</option>
														<option value="LS">Lesotho</option>
														<option value="LR">Liberia</option>
														<option value="LY">Libya</option>
														<option value="LI">Liechtenstein</option>
														<option value="LT">Lithuania</option>
														<option value="LU">Luxembourg</option>
														<option value="MO">Macau</option>
														<option value="MK">Macedonia</option>
														<option value="MG">Madagascar</option>
														<option value="MY">Malaysia</option>
														<option value="MW">Malawi</option>
														<option value="MV">Maldives</option>
														<option value="ML">Mali</option>
														<option value="MT">Malta</option>
														<option value="MH">Marshall Islands</option>
														<option value="MQ">Martinique</option>
														<option value="MR">Mauritania</option>
														<option value="MU">Mauritius</option>
														<option value="ME">Mayotte</option>
														<option value="MX">Mexico</option>
														<option value="MI">Midway Islands</option>
														<option value="MD">Moldova</option>
														<option value="MC">Monaco</option>
														<option value="MN">Mongolia</option>
														<option value="MS">Montserrat</option>
														<option value="MA">Morocco</option>
														<option value="MZ">Mozambique</option>
														<option value="MM">Myanmar</option>
														<option value="NA">Nambia</option>
														<option value="NU">Nauru</option>
														<option value="NP">Nepal</option>
														<option value="AN">Netherland Antilles</option>
														<option value="NL">Netherlands (Holland, Europe)</option>
														<option value="NV">Nevis</option>
														<option value="NC">New Caledonia</option>
														<option value="NZ">New Zealand</option>
														<option value="NI">Nicaragua</option>
														<option value="NE">Niger</option>
														<option value="NG">Nigeria</option>
														<option value="NW">Niue</option>
														<option value="NF">Norfolk Island</option>
														<option value="NO">Norway</option>
														<option value="OM">Oman</option>
														<option value="PK">Pakistan</option>
														<option value="PW">Palau Island</option>
														<option value="PS">Palestine</option>
														<option value="PA">Panama</option>
														<option value="PG">Papua New Guinea</option>
														<option value="PY">Paraguay</option>
														<option value="PE">Peru</option>
														<option value="PH">Philippines</option>
														<option value="PO">Pitcairn Island</option>
														<option value="PL">Poland</option>
														<option value="PT">Portugal</option>
														<option value="PR">Puerto Rico</option>
														<option value="QA">Qatar</option>
														<option value="ME">Republic of Montenegro</option>
														<option value="RS">Republic of Serbia</option>
														<option value="RE">Reunion</option>
														<option value="RO">Romania</option>
														<option value="RU">Russia</option>
														<option value="RW">Rwanda</option>
														<option value="NT">St Barthelemy</option>
														<option value="EU">St Eustatius</option>
														<option value="HE">St Helena</option>
														<option value="KN">St Kitts-Nevis</option>
														<option value="LC">St Lucia</option>
														<option value="MB">St Maarten</option>
														<option value="PM">St Pierre &amp; Miquelon</option>
														<option value="VC">St Vincent &amp; Grenadines</option>
														<option value="SP">Saipan</option>
														<option value="SO">Samoa</option>
														<option value="AS">Samoa American</option>
														<option value="SM">San Marino</option>
														<option value="ST">Sao Tome &amp; Principe</option>
														<option value="SA">Saudi Arabia</option>
														<option value="SN">Senegal</option>
														<option value="RS">Serbia</option>
														<option value="SC">Seychelles</option>
														<option value="SL">Sierra Leone</option>
														<option value="SG">Singapore</option>
														<option value="SK">Slovakia</option>
														<option value="SI">Slovenia</option>
														<option value="SB">Solomon Islands</option>
														<option value="OI">Somalia</option>
														<option value="ZA">South Africa</option>
														<option value="ES">Spain</option>
														<option value="LK">Sri Lanka</option>
														<option value="SD">Sudan</option>
														<option value="SR">Suriname</option>
														<option value="SZ">Swaziland</option>
														<option value="SE">Sweden</option>
														<option value="CH">Switzerland</option>
														<option value="SY">Syria</option>
														<option value="TA">Tahiti</option>
														<option value="TW">Taiwan</option>
														<option value="TJ">Tajikistan</option>
														<option value="TZ">Tanzania</option>
														<option value="TH">Thailand</option>
														<option value="TG">Togo</option>
														<option value="TK">Tokelau</option>
														<option value="TO">Tonga</option>
														<option value="TT">Trinidad &amp; Tobago</option>
														<option value="TN">Tunisia</option>
														<option value="TR">Turkey</option>
														<option value="TU">Turkmenistan</option>
														<option value="TC">Turks &amp; Caicos Is</option>
														<option value="TV">Tuvalu</option>
														<option value="UG">Uganda</option>
														<option value="UA">Ukraine</option>
														<option value="AE">United Arab Emirates</option>
														<option value="GB">United Kingdom</option>
														<option value="US">United States of America</option>
														<option value="UY">Uruguay</option>
														<option value="UZ">Uzbekistan</option>
														<option value="VU">Vanuatu</option>
														<option value="VS">Vatican City State</option>
														<option value="VE">Venezuela</option>
														<option value="VN">Vietnam</option>
														<option value="VB">Virgin Islands (Brit)</option>
														<option value="VA">Virgin Islands (USA)</option>
														<option value="WK">Wake Island</option>
														<option value="WF">Wallis &amp; Futana Is</option>
														<option value="YE">Yemen</option>
														<option value="ZR">Zaire</option>
														<option value="ZM">Zambia</option>
														<option value="ZW">Zimbabwe</option>
													</select>
												</div>
											</div>

											<div class="form-group">
												<label for="age" class="col-sm-2 control-label">Age</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="age"
														placeholder="Age">
												</div>
											</div>

											<div class="form-group">
												<label for="phone" class="col-sm-2 control-label">Mobile</label>
												<div class="col-sm-10">
													<input type="text" class="form-control" id="phone"
														placeholder="+91 987654321">
												</div>
											</div>

											<div class="form-group">
												<div class="col-sm-offset-2 col-sm-10">
													<button type="button" class="btn btn-info pull-right"
														onclick="regPatientWizard(2)">Next</button>
												</div>
											</div>
										</form>
									</div>
								</div>
							</div>
							<div class="step-2 default-hide">

								<div>
									<div class="row progress-text">
										<div class="col-md-4 text-center active">
											<span class="circle">1</span> User profile
										</div>
										<div class="col-md-4 text-center active">
											<span class="circle">2</span> Disease page
										</div>
										<div class="col-md-4 text-center">
											<span class="circle">3</span> My Habits
										</div>
									</div>
								</div>

								<hr />

								<h4 class="text-muted">Please select the diseases</h4>

								<div class="diseases-list">Please wait...</div>

								<div class="form-group">
									<div class="col-sm-offset-2 col-sm-10">
										<button type="button" class="btn btn-info pull-right"
											onclick="regPatientWizard(3)">Next</button>
									</div>
								</div>
							</div>
							<div class="step-3 default-hide">
								<div>
									<div class="row progress-text">
										<div class="col-md-4 text-center active">
											<span class="circle">1</span> User profile
										</div>
										<div class="col-md-4 text-center active">
											<span class="circle">2</span> Disease page
										</div>
										<div class="col-md-4 text-center active">
											<span class="circle">3</span> My Habits
										</div>
									</div>
								</div>

								<hr />

								<h4 class="text-muted">Almost done!</h4>

								<div class="col-sm-12">
									<form class="form-horizontal">
										<div class="form-group">
											<label for="height" class="col-sm-4 control-label">Height</label>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="height"
													placeholder="5ft 7&#34;">
											</div>
										</div>
										<div class="form-group">
											<label for="weight" class="col-sm-4 control-label">Weight</label>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="weight"
													placeholder="68 Kg">
											</div>
										</div>
										<div class="form-group">
											<label for="excercise-time" class="col-sm-4 control-label">Hours
												patient excercise daily</label>
											<div class="col-sm-8">
												<input type="email" class="form-control" id="excercise-time"
													placeholder="3 Hrs">
											</div>
										</div>

										<div class="form-group">
											<label for="smoke" class="col-sm-4 control-label">Does
												the patient smoke?</label>
											<div class="col-sm-8">
												<div class="checkbox pull-left push-right-20">
													<label> <input type="radio" name="smoke" value="Y">
														Yes
													</label>
												</div>
												<div class="checkbox pull-left push-right-20">
													<label> <input type="radio" name="smoke" value="N">
														No
													</label>
												</div>
												<div class="checkbox pull-left">
													<label> <input type="radio" name="smoke" value="O">
														I rather not say
													</label>
												</div>
											</div>
										</div>

										<div class="form-group">
											<div class="col-sm-offset-4 col-sm-8">
												<button type="button" class="btn btn-info pull-right"
													onclick="regPatientWizard('complete')">Submit</button>
											</div>
										</div>

										<div class="register-status-msg"></div>
									</form>

								</div>
							</div>



						</div>
					</div>
				</div>
				<div class="col-md-3"></div>
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