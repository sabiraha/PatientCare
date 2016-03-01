/**
 * Generic AJAX GET call function.
 * Description: Should be used when passing minimal data
 * @param reqUrl
 * @param functionName
 */
function makeAjaxGETCall(reqUrl, functionName) {
	var response;
	var res;
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
		if (req) {
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (req.status == 200) {
							if(req.responseText.indexOf("Forgot Password") > 0){
								var url=ctx+'/login.ast?method=displayHome';
								var a = document.createElement('a');
								a.setAttribute('href', url);
								a.setAttribute('target', '_parent');
								document.body.appendChild(a);
								a.click();
					       }else {
					    	   response = 'OK';
							   res = req.responseText;
					       }
					} else {
						response = 'Error';
					}
					var func = eval(functionName);
					func(response, res);
				}
			};
		}
		try {
			req.open("GET", reqUrl);
		} catch (e) {
		}
		req.send(null);
	}
}

/**
 * Generic AJAX POST call function.
 * Description: Should be used when submitting a form
 * @param reqUrl
 * @param functionName
 */
function makeAjaxPOSTCall(reqUrl, functionName,data) {
	var response;
	var res;
	if (window.XMLHttpRequest) {
		req = new XMLHttpRequest();
		if (req) {
			req.onreadystatechange = function() {
				if (req.readyState == 4) {
					if (req.status == 200) {
						if(req.responseText.indexOf("Forgot Password") > 0){
							var url=ctx+'/login.ast?method=displayHome';
							var a = document.createElement('a');
							a.setAttribute('href', url);
							a.setAttribute('target', '_parent');
							document.body.appendChild(a);
							a.click();
				       }else {
				    	   	response = 'OK';
							res = req.responseText;
				       }
					} else {
						response = 'Error';
					}
					var func = eval(functionName);
					func(response, res);
				}
			};
		}
		try {
			req.open("POST", reqUrl);
		} catch (e) {
		}
		req.send(data);
	}
}

/**
 * Function to validate presence of invalid characters in the text-fields/text-area
 * @param filedValue
 * @returns {Boolean}
 */
function validateSpecialCharaters(filedValue) {
	var bool = true;
	var iChars = "~!^&()\\{}[]\"\'#%";
	for ( var i = 0; i < filedValue.length; i++) {
		if (iChars.indexOf(filedValue.charAt(i)) != -1) {
			bool = false;
			break;
		}
	}
	return bool;
}

/**
 * Function to return special characters
 */
function getSpecialCharacters() {
	var iChars = "~!^&()\\{}[]\\'#%";
	return iChars;
}

/**
 * This function displays the overlay with a message
 * @param message
 */
function showOverlay(message) {
	var o = document.getElementById('overlay');
	o.style.visibility = 'visible';
	document.getElementById('loadingMessage').innerHTML = message;
}
/**
 * This method hides the overlay
 */
function hideOverlay() {
	var o = document.getElementById('overlay');
	o.style.visibility = 'hidden';
}