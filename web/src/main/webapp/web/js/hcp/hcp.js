"use strict";

/** ****GLOBAL REGULAR EXPRESSION BLOCK - START ****** */
// User name check
var REGEX_NAME = /^[a-zA-Z ]+$/;
// User email check
var REGEX_EMAIL = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/;
// User age check
var REGEX_AGE = /^(\d?[1-9]|[1-9]0)$/;
// User mobile check
var REGEX_MOBILE = /^\+\d{1,3}\s*\d{9,10}$/;

// ******GLOBAL REGULAR EXPRESSION BLOCK - END *******//

// **** GLOBAL VARIABLES START ****//
var patientDetails = new Object();
patientDetails.userInfo = {};
patientDetails.diseases = {};
patientDetails.habits = {};
// **** GLOBAL VARIABLES END ****//

/**
 * Reset patient data
 */
function resetPatientRegisterData() {
	patientDetails.userInfo = {};
	patientDetails.diseases = {};
	patientDetails.habits = {};
}

/**
 * Basic login form validation
 * 
 * @returns {Boolean}
 */
function validateLogin() {
	// User id field
	if ($("#hcpName").val() == "") {
		// Modify this line to show it on a dialog box
		alert("Please enter User ID");
		$("#hcpName").focus();
		return false;
	}
	// Login field
	if ($("#hcpPass").val() == "") {
		// Modify this line to show it on a dialog box
		alert("Please enter password");
		$("#hcpPass").focus();
		return false;
	}
	return true;
}

/**
 * Utility method to send POST AJAX requests
 */
function AJAXPOST(requestURI, dataToSend, callBackOnSuccess, callBackOnError) {
	$.ajax({
		type : "POST",
		contentType : "application/json; charset=utf-8",
		data : JSON.stringify(dataToSend),
		cache : false,
		url : requestURI,
		success : function(data, text) {
			callBackOnSuccess(data);
		},
		error : function(request, error, errorThrown) {
			callBackOnError(request, error, errorThrown);
		}
	});
}

/**
 * Utility method to send GET AJAX requests
 */
function AJAXGET(requestURI, callBackOnSuccess, callBackOnError) {
	$.ajax({
		url : requestURI,
		success : function(data, text) {
			callBackOnSuccess(data);
		},
		error : function(request, error, errorThrown) {
			callBackOnError(request, error, errorThrown);
		}
	});
}

/**
 * AJAX call to get the list of patients that need to be approved by HCP
 */
function getPatientListToAssign() {
	var requestURI = ctx + "/hcp/getPatientListToAssign.ptcn";
	// AJAX GET patient list to assign
	AJAXGET(
			requestURI,
			function(data) {
				$(".patient-data").html("");
				if (data.patientToAssignList.length > 0) {
					var table = "<table class='table table-striped table-bordered'><tr>"
							+ "<tr>"
							+ "<th class='text-center'>Patient ID</th>"
							+ "<th>Patient Name</th>"
							+ "<th>Patient Email</th>"
							+ "<th class='text-center'>Patient Age</th>"
							+ "<th class='text-center'>Assign to me</th>"
							+ "</tr>";

					for ( var i = 0; i < data.patientToAssignList.length; i++) {
						table += "<tr>" + "<td class='text-center'>"
								+ data.patientToAssignList[i].USER_ID + "</td>"
								+ "<td>" + data.patientToAssignList[i].USER_NME
								+ "</td>" + "<td>"
								+ data.patientToAssignList[i].USR_EML_ID
								+ "</td>" + "<td class='text-center'>"
								+ data.patientToAssignList[i].AGE + "</td>";

						if (data.patientToAssignList[i].IS_APPROVED == 'Y') {
							table += "<td class='text-center'><input type='checkbox' "
									+ "checked onclick=\"assignPatient("
									+ data.patientToAssignList[i].USER_ID
									+ ", this, 'Y');\"/></td>" + "</tr>";
						} else {
							table += "<td class='text-center'><input type='checkbox' onclick=\"assignPatient("
									+ data.patientToAssignList[i].USER_ID
									+ ", this, 'N');\"/></td>" + "</tr>";
						}
					}

					table += "</tr></table>";
					$(".patient-data").html(table);
				}
			}, function(request, error, errorThrown) {
				if (request.status && request.status == 400) {
					console.log(request.responseText);
				} else {
					// Modify this line to show it on a dialog box
					console.log("Something went wrong");
				}
			});
}

/**
 * AJAX call to assign a patient to an HCP
 * 
 * @param assigneeId
 * @param idRef
 * @param isApproved
 * @returns {Boolean}
 */
function assignPatient(assigneeId, idRef, isApproved) {

	var requestURI = ctx + "/hcp/" + assigneeId + "/assign.ptcn";

	// Check if already approved
	if (isApproved == "Y") {
		// Modify this line to show it on a dialog box
		alert("This Patient has been assigned to you already.");
		$(idRef).prop('checked', true);
		return false;
	}

	// Verify the checkbox is checked
	if ($(idRef).is(":checked")) {

		// Modify this line to show it on a dialog box
		var conf = confirm("Are you sure you want to assign this patient to yourself?");
		if (conf) {
			// AJAX GET request to assign a patient to HCP
			AJAXGET(requestURI, function(data) {
				if (data.status == "success") {

					// *****ADD THE LOGIC TO SEND EMAIL AT THIS POINT***** //

					// Modify this line to show it on a dialog box
					alert("Confirmation sent to Patient's Email ID");
					// Reload the patient data
					getPatientListToAssign();
				} else {
					// Modify this line to show it on a dialog box
					alert("Something went worng, Please try again later!");
					$(idRef).prop('checked', false);
				}
			}, function(request, error, errorThrown) {
				if (request.status && request.status == 400) {
					console.log(request.responseText);
					// Modify this line to show it on a dialog box
					alert("Something went worng, Please try again later!");
					$(idRef).prop('checked', false);
				} else {
					// Modify this line to show it on a dialog box
					alert("Something went worng, Please try again later!");
					$(idRef).prop('checked', false);
				}
			});

		} else {
			// Modify this line to show it on a dialog box
			alert("Request has been cancelled!!")
			$(idRef).prop('checked', false);
			return false;
		}
	}
}

/**
 * Register patient wizard
 * 
 * Note: Added Regex basic validations for fields
 * 
 * @param step
 * @returns {Boolean}
 */
function regPatientWizard(step) {

	if (step == 2) {

		/** STEP 1 FIELD VALIDATIONS * */
		// var userInfo = new Object();
		// Validate Name
		if (REGEX_NAME.test($("#userName").val())) {
			patientDetails.userInfo.USER_NME = $("#userName").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Invalid User Name");
			return false;
		}

		// Validate Email
		if (REGEX_EMAIL.test($("#email").val())) {
			patientDetails.userInfo.USR_EML_ID = $("#email").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Invalid User Email");
			return false;
		}

		// Validate Gender
		if ($('input[name=gender]:checked').val() != undefined) {
			patientDetails.userInfo.GENDER = $('input[name=gender]:checked')
					.val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please select gender");
			return false;
		}

		// Validate Country
		if ($("#country").val() != null) {
			patientDetails.userInfo.COUNTRY = $("#country").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please select a country");
			return false;
		}

		// Validate Age
		if (REGEX_AGE.test($("#age").val())) {
			patientDetails.userInfo.AGE = $("#age").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Invalid Age");
			return false;
		}

		// Validate phone
		if (($("#phone").val()).match(REGEX_MOBILE) != null) {
			patientDetails.userInfo.PHN_NO = $("#phone").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Invalid mobile number");
			return false;
		}

		$(".step-1").hide();
		$(".step-2").show();

		// console.log(JSON.stringify(patientDetails));

		// Get the list of diseases
		getExistingDiseaseList();
	} else if (step == 3) {

		/** STEP 2 FIELD VALIDATIONS * */
		var diseases = new Object();

		var selectedDiseases = [];
		$('.diseases-list input:checked').each(function() {
			var disease = new Object();

			disease.DISEASE_ID = $(this).attr('value');
			disease.DISEASE_DESC = $(this).attr('data');

			selectedDiseases.push(disease);
		});

		if (selectedDiseases.length > 0) {
			diseases = selectedDiseases;
		} else {
			// Modify this line to show it on a dialog box
			alert("Please select diseases");
			return false;
		}

		// Accumulate the diseases object
		patientDetails.diseases = diseases;

		$(".step-2").hide();
		$(".step-3").show();
	} else if (step = 'complete') {
		/** STEP 3 FIELD VALIDATIONS * */

		// var habits = new Object();
		if ($("#height").val() != "") {
			patientDetails.habits.HEIGHT = $("#height").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please enter patients height");
			return false;
		}

		if ($("#weight").val() != "") {
			patientDetails.habits.WEIGHT = $("#weight").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please enter patients weight");
			return false;
		}

		if ($("#excercise-time").val() != "") {
			patientDetails.habits.EXERCISE_HRS = $("#excercise-time").val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please enter patients total excercise time");
			return false;
		}

		if ($('input[name=smoke]:checked').val() != undefined) {
			patientDetails.habits.SMOKE = $('input[name=smoke]:checked').val();
		} else {
			// Modify this line to show it on a dialog box
			alert("Please choose patients somking habit");
			return false;
		}

		// console.log(JSON.stringify(patientDetails));

		registerPatient(patientDetails);
	}
}

/**
 * AJAX call To get the list of existing diseases
 */
function getExistingDiseaseList() {
	var requestURI = ctx + "/getExistingDiseaseList.ptcn";

	// AJAX GET request to get disease details
	AJAXGET(
			requestURI,
			function(data) {
				if (data.existingDiseaseList.length > 0) {

					var diseases = data.existingDiseaseList;

					var checkBoxes = "<div class='row'><form>";

					var checkBoxes_row_1 = "<div class='col-md-6'>";
					var checkBoxes_row_2 = "<div class='col-md-6'>";

					for ( var i = 0; i < diseases.length; i++) {
						// Splitting the data's into two rows on the UI
						if ((diseases.length) / 2 <= i) {
							checkBoxes_row_1 += "<div class='checkbox'><label>";
							checkBoxes_row_1 += "<input type='checkbox' name='diseases_"
									+ i
									+ "' value='"
									+ diseases[i].DISEASE_ID
									+ "' data='"
									+ diseases[i].DISEASE_DESC
									+ "'> " + diseases[i].DISEASE_DESC + "<br>";
							checkBoxes_row_1 += "</label></div>";
						} else {
							checkBoxes_row_2 += "<div class='checkbox'><label>";
							checkBoxes_row_2 += "<input type='checkbox' name='diseases_"
									+ i
									+ "' value='"
									+ diseases[i].DISEASE_ID
									+ "' data='"
									+ diseases[i].DISEASE_DESC
									+ "'> " + diseases[i].DISEASE_DESC + "<br>";
							checkBoxes_row_2 += "</label></div>";
						}
					}

					checkBoxes_row_1 += "</div>";
					checkBoxes_row_2 += "</div>";

					checkBoxes += checkBoxes_row_1 + checkBoxes_row_2;

					checkBoxes += "</form></div>";

					$(".diseases-list").html(checkBoxes);
				}
			},
			function(request, error, errorThrown) {
				if (request.status && request.status == 400) {
					console.log(request.responseText);
				} else {
					// Modify this line to show it on a dialog box
					console
							.log("Something went worng, Please try again later!");
				}
			});
}

/**
 * AJAX call for Registering a patient
 * 
 * @param patientData
 */
function registerPatient(patientData) {
	var requestURI = ctx + "/hcp/registerPatient.ptcn";
	// AJAX POST request to register a patient
	AJAXPOST(
			requestURI,
			patientData,
			function(data) {
				if (data.status == "success") {
					// Modify this line to show it on a dialog box
					$(".register-status-msg")
							.html(
									"<div class='alert alert-success' role='alert'>Patient details has been Saved successfully!</div>");
					// Reset all data
					resetPatientRegisterData();
				} else {
					// Modify this line to show it on a dialog box
					$(".register-status-msg")
							.html(
									"<div class='alert alert-danger' role='alert'>Something went worng, Please try again later!</div>");
					// Reset all data
					resetPatientRegisterData();
				}
			},
			function(request, error, errorThrown) {
				if (request.status && request.status == 400) {
					console.log(request.responseText);
				} else {
					console
							.log("Something went worng, Please try again later!");
					// Modify this line to show it on a dialog box
					$(".register-status-msg")
							.html(
									"<div class='alert alert-danger' role='alert'>Something went worng, Please try again later!</div>");
					// Reset all data
					resetPatientRegisterData();
				}
			});
}
