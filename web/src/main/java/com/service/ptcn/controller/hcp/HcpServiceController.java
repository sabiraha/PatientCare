/**
 * 
 */
package com.service.ptcn.controller.hcp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.service.ptcn.service.hcp.IHcpService;

/**
 * @author sandk07
 * 
 */
@RestController
public class HcpServiceController {
	private static final Logger _LOGGER = Logger
			.getLogger(HcpServiceController.class);

	@Autowired
	private IHcpService _hcpService;

	/**
	 * This method is used to get Patient list to be approved
	 * 
	 * @param request
	 *            HttpServletRequest
	 * @param response
	 *            HttpServletResponse
	 * @return JSONObject
	 * 
	 */
	@RequestMapping(value = "/hcp/getPatientListToAssign.ptcn", method = RequestMethod.GET)
	public @ResponseBody
	JSONObject getPatientListToAssign(HttpServletRequest request,
			HttpServletResponse response) {
		_LOGGER.info("HcpServiceController-getPatientToAssignList-STARTS");

		String assignerId = request.getSession().getAttribute("userId")
				.toString();
		_LOGGER.info("USER ID: " + assignerId);

		JSONObject data = new JSONObject();
		List<JSONObject> result = new ArrayList<JSONObject>();
		result = _hcpService
				.getPatientListToAssign(Integer.valueOf(assignerId));
		data.accumulate("patientToAssignList", result);

		_LOGGER.info("HcpServiceController-getPatientToAssignList-ENDS");
		return data;
	}

	/**
	 * Call to approve the patient for an HCP
	 * 
	 * @param assignee
	 * @param request
	 * @param response
	 * @return JSONObject
	 */
	@RequestMapping(value = "/hcp/{assignee}/assign.ptcn", method = RequestMethod.GET)
	public @ResponseBody
	JSONObject assignPatient(@PathVariable String assignee,
			HttpServletRequest request, HttpServletResponse response) {
		_LOGGER.info("HcpServiceController-assignPatient-STARTS");

		String assignerId = request.getSession().getAttribute("userId")
				.toString();

		_LOGGER.info("ASSIGNER ID: " + assignerId);
		_LOGGER.info("ASSIGNEE ID : " + assignee);

		Boolean result = _hcpService.assignPatient(Integer.valueOf(assignee),
				Integer.valueOf(assignerId));

		_LOGGER.info("HcpServiceController-assignPatient-ENDS");

		if (result) {
			return new JSONObject().accumulate("status", "success");
		}
		return new JSONObject().accumulate("status", "failure");
	}

	/**
	 * Register a patient from HCP module
	 * 
	 * @param patientData
	 * @param request
	 * @param response
	 * @return JSONObject
	 */
	@RequestMapping(value = "/hcp/registerPatient.ptcn", method = RequestMethod.POST, headers = { "Content-type=application/json" })
	public @ResponseBody
	JSONObject registerPatient(@RequestBody String patientData,
			HttpServletRequest request, HttpServletResponse response) {
		_LOGGER.info("HcpServiceController-registerPatient-STARTS");

		String assignerId = request.getSession().getAttribute("userId")
				.toString();

		_LOGGER.info("ASSIGNER ID: " + assignerId);

		try {

			JSONObject js = JSONObject.fromObject(patientData);

			_hcpService.registerPatient(assignerId, js);

			_LOGGER.info("HcpServiceController-registerPatient-ENDS");

			return new JSONObject().accumulate("status", "success");
		} catch (Exception e) {
			_LOGGER.error("EXCEPTION :: HcpServiceController-registerPatient :: "
					+ e.getMessage());
			_LOGGER.info("HcpServiceController-registerPatient-ENDS");
			return new JSONObject().accumulate("status", "failure");
		}
	}
	
	@RequestMapping(value="/getExistingDiseaseList.ptcn")
	public @ResponseBody JSONObject getExistingDiseaseList(HttpServletRequest request,HttpServletResponse response){
		_LOGGER.info("AdminServiceController-getExistingDiseaseList-STARTS");
		JSONObject data=new JSONObject();
		List<JSONObject> result=new ArrayList<JSONObject>();
		result=_hcpService.getExistingDiseaseList();
		data.accumulate("existingDiseaseList", result);
		_LOGGER.info("AdminServiceController-getExistingDiseaseList-ENDS");
		return data;
	}

}
