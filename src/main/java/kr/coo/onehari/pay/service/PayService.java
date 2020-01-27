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
	
	
	
	public List<String> getYears(String empNumStr) {
		PayDao dao = sqlsession.getMapper(PayDao.class);
		List<String> years=null;
		try {
			years = dao.getYears(empNumStr);
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getYears : " + e.getMessage());
		}
		return years;
	}
	
	//급여리스트
	public List<PayDto> getPayList(String empNumStr, String year, String month) {
		PayDao dao = sqlsession.getMapper(PayDao.class);
		List<PayDto> payList=null;
		try {
			payList = dao.getPayList(empNumStr, year, month);
			System.out.println(payList.toString());
		} catch (ClassNotFoundException | SQLException e) {
			log.debug("getPayList : " + e.getMessage());
		}
		return payList;
	}
	
	
}

