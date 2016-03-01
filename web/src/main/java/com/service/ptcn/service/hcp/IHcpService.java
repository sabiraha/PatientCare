/**
 * 
 */
package com.service.ptcn.service.hcp;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

/**
 * @author sandk07
 * 
 */
public interface IHcpService {
	/**
	 * Get the list of patients to be approved by HCP
	 * 
	 * @param userId
	 * @return List<JSONObject>
	 */
	List<JSONObject> getPatientListToAssign(Integer userId);

	/**
	 * Checks if the requested HCP is available
	 * 
	 * @param request
	 * @return JSONObject
	 */
	JSONObject checkHcp(HttpServletRequest request);

	/**
	 * Assigns the patient to HCP
	 * 
	 * @param assigneeId
	 * @param assignerId
	 * @return Boolean
	 */
	Boolean assignPatient(Integer assigneeId, Integer assignerId);
	
	/**
	 * 
	 * @param assignerId
	 * @param patientData
	 * @return
	 */
	JSONObject registerPatient(String assignerId, JSONObject patientData);
	
	
	public List<JSONObject> getExistingDiseaseList();

}
