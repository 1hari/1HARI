package kr.coo.onehari.pay.service;

import java.security.Principal;
import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.hr.dto.PayDto;
import kr.coo.onehari.pay.dao.PayDao;
import lombok.extern.slf4j.Slf4j;


@Service
@Slf4j
public class PayService {
	
	@Autowired
	private SqlSession sqlsession;
	
	public JSONObject getPayList(String empNumStr) {
		PayDao dao = sqlsession.getMapper(PayDao.class);
		JSONObject root=new JSONObject();
		JSONArray array=new JSONArray();
		List<PayDto> payList=null;
		try {
			payList = dao.getPayList(empNumStr);
			for (PayDto payDto : payList) {
				JSONObject object=new JSONObject();
				object.put("payMonth", payDto.getPayMonth());
				object.put("basicSal", payDto.getBasicSal());
				object.put("payNPension", payDto.getPayNPension());
				object.put("payHInsurance", payDto.getPayHInsurance());
				object.put("payCInsurance", payDto.getPayCInsurance());
				object.put("empInsurance", payDto.getEmpInsurance());
				object.put("payIncomeTax", payDto.getPayIncomeTax());
				object.put("payLIncomeTax", payDto.getPayLIncomeTax());
				array.add(object);
			}
			root.put("payList", array);
			
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getPayList : " + e.getMessage());
		}
		return root;
	}
	
}

