/**
 * 
 */
package com.service.ptcn.controller.hcp;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.service.ptcn.service.hcp.IHcpService;

/**
 * @author sandk07
 * 
 */

@Controller
public class HcpController {

	/**
	 * private static logger
	 */
	private static final Logger _LOGGER = Logger.getLogger(HcpController.class);

	/** PAGE URLS **/
	private static final String HCP_LOGIN = "hcp/hcp_login";
	private static final String HCP_HOME = "hcp/hcp";
	private static final String HCP_REGISTER_PATIENT = "hcp/hcp_register_patient";

	@Autowired
	private IHcpService _hcpService;

	/**
	 * This method is used to load HCP login page
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 * 
	 */
	@RequestMapping(value = "/hcp.ptcn")
	public String showPage(HttpServletRequest request,
			HttpServletResponse response) {
		HttpSession session = request.getSession();
		String forward = null;

		if (null != session.getAttribute("userName")
				&& null == request.getParameter("msg")) {
			forward = checkHcp(request, response);
		} else {
			if (null != request.getParameter("msg")) {
				session.invalidate();
				request.setAttribute("logout", "You have been logged out.");
			}
			forward = HCP_LOGIN;
		}

		return forward;
	}

	/**
	 * This method is used to validate hcp login
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 * 
	 */
	@RequestMapping(value = "/hcp/assign-patient.ptcn")
	public String checkHcp(HttpServletRequest request,
			HttpServletResponse response) {
		_LOGGER.info("HcpController-checkHcp-STARTS");
		String forward = null;
		HttpSession session = request.getSession();

		// Check for session
		if (null == session.getAttribute("userName")) {
			// Check for request data
			if (request.getParameter("username") != null) {

				// Call the service to authenticate the user
				JSONObject result = _hcpService.checkHcp(request);

				if (!result.containsKey("error")) {
					// Set the user id in session
					session.setAttribute("userId", result.get("USER_ID"));
					// Set the user name in session
					session.setAttribute("userName", result.get("USER_NME"));
					// Set the user name in request object
					request.setAttribute("userName", result.get("USER_NME"));
					// Create the forward request URI
					forward = HCP_HOME;
				} else {
					forward = HCP_LOGIN;
					request.setAttribute("msg", "Invalid Credentials");
				}

			} else {
				forward = HCP_LOGIN;
				request.setAttribute("msg", "Invalid Session");
			}
		} else {
			request.setAttribute("userName", session.getAttribute("userName"));
			forward = HCP_HOME;
		}

		_LOGGER.info("HcpController-checkHcp-ENDS");
		return forward;
	}

	/**
	 * Simple logout functionality added for logging out the HCP user
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return String
	 */
	@RequestMapping(value = "/hcp/logout.ptcn")
	public String logout(HttpServletRequest request,
			HttpServletResponse response) {
		_LOGGER.info("HcpController-logout-STARTS");
		String forward = null;
		HttpSession newsession = request.getSession(false);

		if (newsession != null) {
			// Invalidate the session data and log out the user
			newsession.invalidate();
		}

		request.setAttribute("logout", "You have been logged out.");
		forward = HCP_LOGIN;
		_LOGGER.info("HcpController-logout-ENDS");
		return forward;
	}

	/**
	 * Patient registration route
	 * 
	 * @param request
	 * @param response
	 * @return String
	 */
	@RequestMapping(value = "/hcp/register-patient.ptcn")
	public String registerPatientPage(HttpServletRequest request,
			HttpServletResponse response) {
		_LOGGER.info("HcpController-registerPatient-STARTS");
		String forward = null;

		forward = HCP_REGISTER_PATIENT;
		_LOGGER.info("HcpController-registerPatient-ENDS");
		return forward;
	}

}
