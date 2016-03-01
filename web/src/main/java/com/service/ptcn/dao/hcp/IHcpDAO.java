/**
 * 
 */
package com.service.ptcn.dao.hcp;

import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * @author sandk07
 * 
 */
public interface IHcpDAO {
	/**
	 * Get the list of Patients to be assigned to the HCP
	 * 
	 * @param userId
	 * @return List<JSONObject>
	 */
	List<JSONObject> getPatientListToAssign(Integer userId);

	/**
	 * Verify HCP details
	 * 
	 * @param username
	 * @param password
	 * @return JSONObject
	 */
	JSONObject checkHcp(String username, String password);

	/**
	 * Assign the patient to HCP
	 * 
	 * @param assigneeId
	 * @param assignerId
	 * @return Boolean
	 */
	Boolean assignPatient(Integer assigneeId, Integer assignerId);

	/**
	 * Get the list of data based on the query
	 * 
	 * @param query
	 * @return List<JSONObject>
	 */
	List<JSONObject> getList(String query);

	/**
	 * Register a new patient
	 * 
	 * @param assignerId
	 * @param patientData
	 * @return JSONObject
	 */
	JSONObject registerPatient(String assignerId, JSONObject patientData);

	/**
	 * Add habits for a patient
	 * 
	 * @param patientId
	 * @param habits
	 * @return Integer
	 */
	Integer addHabits(Integer patientId, JSONObject habits);

	/**
	 * Add diseases for a patient
	 * 
	 * @param patientId
	 * @param diseases
	 * @return Integer
	 */
	Integer addDiseases(Integer patientId, JSONArray diseases);

}
