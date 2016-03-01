/**
 * 
 */
package com.service.ptcn.service.hcp;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import net.sf.json.JSONObject;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.service.ptcn.dao.hcp.IHcpDAO;

/**
 * @author sandk07
 * 
 */
@Service("_hcpService")
public class HcpService implements IHcpService {
	private static final Logger _LOGGER = Logger.getLogger(HcpService.class);

	@Autowired
	private IHcpDAO _hcpDAO;


	@Override
	public List<JSONObject> getPatientListToAssign(Integer userId) {
		_LOGGER.info("HcpService-getPatientListToAssign-STARTS");

		List<JSONObject> result = _hcpDAO.getPatientListToAssign(userId);

		_LOGGER.info("HcpService-getPatientListToAssign-ENDS");
		return result;
	}

	@Override
	public JSONObject checkHcp(HttpServletRequest request) {
		_LOGGER.info("HcpService-checkHcp-STARTS");

		JSONObject result = _hcpDAO.checkHcp(
				StringUtils.lowerCase(request.getParameter("username")),
				request.getParameter("password"));

		_LOGGER.info("HcpService-checkHcp-STARTS");

		return result;
	}

	@Override
	public Boolean assignPatient(Integer assigneeId, Integer assignerId) {
		_LOGGER.info("HcpService-assignPatient-STARTS");

		Boolean result = _hcpDAO.assignPatient(assigneeId, assignerId);

		_LOGGER.info("HcpService-assignPatient-STARTS");
		return result;
	}

	@Override
	public JSONObject registerPatient(String assignerId, JSONObject patientData) {
		_LOGGER.info("HcpService-registerPatient-STARTS");

		JSONObject result = _hcpDAO.registerPatient(assignerId, patientData);

		_LOGGER.info("HcpService-registerPatient-STARTS");
		return result;
	}
	
	@Override
	public List<JSONObject> getExistingDiseaseList() {
		_LOGGER.info("AdminService-getExistingDiseaseList-STARTS");
		List<JSONObject> result=new ArrayList<JSONObject>();
		
		JSONObject astama = new JSONObject().accumulate("DISEASE_ID",1).accumulate("DISEASE_DESC", "Asthama");
		JSONObject depression = new JSONObject().accumulate("DISEASE_ID",2).accumulate("DISEASE_DESC", "Depression");
		JSONObject heartburn = new JSONObject().accumulate("DISEASE_ID",3).accumulate("DISEASE_DESC", "HeartBurn");
		JSONObject diabetes = new JSONObject().accumulate("DISEASE_ID",4).accumulate("DISEASE_DESC", "Pre-Diabetes");
		
		result.add(astama);
		result.add(depression);
		result.add(heartburn);
		result.add(diabetes);
		
		
		_LOGGER.info("AdminService-getExistingDiseaseList-ENDS");
		return result;
	}

}
