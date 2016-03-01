/**
 * 
 */
package com.service.ptcn.dao.hcp;

import java.util.ArrayList;
import java.util.List;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

/**
 * @author sandk07
 * 
 */

@Service("_hcpDAO")
public class HcpDAO implements IHcpDAO {

	private static final Logger _LOGGER = Logger.getLogger(HcpDAO.class);

	// Constants
	private static final String NOT_APPLICABLE = "N/A";
	private static final String NOT_ACTIVE = "N";



	@Override
	public JSONObject checkHcp(String username, String password) {
		_LOGGER.info("HcpDAO-checkHcp-STARTS");

		JSONObject result = new JSONObject();
		try {
			
			// Check for user
			if(StringUtils.equals(username, "jhon@mail.com") && StringUtils.equals(password, "12345")){
				result.accumulate("USER_ID", "1");
				result.accumulate("USER_NME", "Jhon Doe");
			}

			if (result.isEmpty() == true) {
				result.accumulate("error", "empty");
			}
		} catch (Exception e) {
			_LOGGER.error("EXCEPTION :: HcpDAO-checkHcp :: " + e.getMessage());
			result.accumulate("error", "empty");
		}

		_LOGGER.info("HcpDAO-checkHcp-ENDS");
		return result;
	}

	@Override
	public List<JSONObject> getPatientListToAssign(Integer userId) {
		_LOGGER.info("HcpDAO-getPatientListToAssign-STARTS");

		List<JSONObject> result = new ArrayList<JSONObject>();
		try {
			
			JSONObject anderson = new JSONObject()
			.accumulate("USER_ID", 2)
			.accumulate("USER_NME", "Anderson Max")
			.accumulate("USR_EML_ID", "anderson@mail.com")
			.accumulate("AGE", 54)
			.accumulate("IS_APPROVED", "Y");
			
			JSONObject philip = new JSONObject()
			.accumulate("USER_ID", 3)
			.accumulate("USER_NME", "Philip Jhones")
			.accumulate("USR_EML_ID", "philip@mail.com")
			.accumulate("AGE", 63)
			.accumulate("IS_APPROVED", "N");
			
			JSONObject collins = new JSONObject()
			.accumulate("USER_ID", 4)
			.accumulate("USER_NME", "Collins Adams")
			.accumulate("USR_EML_ID", "collins@mail.com")
			.accumulate("AGE", 63)
			.accumulate("IS_APPROVED", "N");
			
			result.add(anderson);
			result.add(collins);
			result.add(philip);
			
			if (result.isEmpty() == true) {
				result.add(new JSONObject().accumulate("error", "empty"));
			}
		} catch (Exception e) {
			_LOGGER.error("EXCEPTION :: HcpDAO-getPatientListToAssign :: "
					+ e.getMessage());
			result.add(new JSONObject().accumulate("error", "empty"));
		}

		_LOGGER.info("HcpDAO-getPatientListToAssign-ENDS");
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public Boolean assignPatient(Integer assigneeId, Integer assignerId) {
		_LOGGER.info("HcpDAO-assignPatient-STARTS");

		
		int result = 0;
		try {

			Object[] params = { assigneeId, assignerId };

			result = 1;

			_LOGGER.info("HcpDAO-assignPatient-ENDS");

			// Check for affected rows
			if (result > 0) {
				return true;
			}

			return false;
		} catch (Exception e) {
			_LOGGER.error("EXCEPTION :: HcpDAO-assignPatient :: "
					+ e.getMessage());
			return false;
		}
	}

	@Override
	public List<JSONObject> getList(String query) {
		_LOGGER.info("HcpDAO-getList-STARTS");

		List<JSONObject> result = new ArrayList<JSONObject>();
		//result = jdbcTemplate.query(query, new WDAMJSONMapper());

		_LOGGER.info("HcpDAO-getList-ENDS");
		return result;
	}

	@Override
	@Transactional(rollbackFor = Exception.class)
	public JSONObject registerPatient(String assignerId, JSONObject patientData) {
		_LOGGER.info("HcpDAO-registerPatient-STARTS");

		// UPDATE PATIENTS TABLE
	
		// UPDATE THE HABITS TABLE
		addHabits(1,patientData.getJSONObject("habits"));

		// UPDATE THE DISEASE TABLE
		addDiseases(1,patientData.getJSONArray("diseases"));

		_LOGGER.info("HcpDAO-registerPatient-ENDS");
		return new JSONObject().accumulate("status", "success");
	}

	@Override
	public Integer addHabits(Integer patientId, JSONObject habits) {
		_LOGGER.info("HcpDAO-addHabits-STARTS");

		

		Object[] params = { patientId, habits.getString("HEIGHT"),
				habits.getString("WEIGHT"), habits.getString("SMOKE"),
				habits.getString("EXERCISE_HRS"), "M",// Manage disease
				"M"// Lifestyle info
		};

		//int rows = jdbcTemplate.update(habitQuery, params);

		_LOGGER.info("HcpDAO-addHabits-ENDS");
		return 1;
	}

	@Override
	public Integer addDiseases(Integer patientId, JSONArray diseases) {
		_LOGGER.info("HcpDAO-addDiseases-STARTS");
		final Integer pId = patientId;
		final JSONArray dsc = diseases;

		
		_LOGGER.info("HcpDAO-addDiseases-ENDS");
		return 1;
	}

}
