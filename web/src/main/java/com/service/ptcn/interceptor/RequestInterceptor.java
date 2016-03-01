/**
 * This software is the confidential and proprietary information of

 * Wipro. You shall not disclose such Confidential Information and 
 * shall use it only in accordance with the terms of the license 
 * agreement you entered into with Wipro.
 *
 */

package com.service.ptcn.interceptor;

import java.io.IOException;


import java.util.HashMap;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

/**
 * This class intercepts each and every request to the application. Checks for a
 * valid session and redirects as per the case
 */
public class RequestInterceptor extends HandlerInterceptorAdapter {
	/**
	 * private static logger
	 */
	private static final Logger _LOGGER = Logger
			.getLogger(RequestInterceptor.class);
	
	
	public static final Map<String, String> _AUTHORIZEURL = new HashMap<String,String>();
    static {
    	_AUTHORIZEURL.put("/myaccount.ast", "agency");
    	_AUTHORIZEURL.put("/upload.ast", "agency admin");
    	_AUTHORIZEURL.put("/notifications.ast", "admin");
    	_AUTHORIZEURL.put("/approval.ast", "admin");
    	_AUTHORIZEURL.put("/delete.ast", "admin");
    }

	/**
	 * This method checks for a valid session in the intercepted request
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @param handler
	 *            Object
	 * @return boolean flag to indicate the execution result
	 * 
	 */
	public boolean preHandle(HttpServletRequest request,
			HttpServletResponse response, Object handler)
			throws ServletException, IOException {
		_LOGGER.debug("RequestInterceptor-preHandle()-STARTS");
		_LOGGER.debug("RequestInterceptor-preHandle()-ENDS");
		return true;
	}

	/**
	 * This method spits out the login page
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * 
	 */
	private void reLogin(HttpServletRequest req, HttpServletResponse res, String message) {
		try {
			try {
				req.getSession().invalidate();
			} catch (Exception e) {
			}
			String url = "/";
			if(!res.isCommitted()) {
				_LOGGER.info("URL::"+url);
				RequestDispatcher rd= req.getRequestDispatcher(url);
				req.setAttribute("fail", message);
				rd.forward(req, res);
			}else {
				res.sendRedirect(url);
			}
		} catch (Exception ioe) {
		}
	}
}