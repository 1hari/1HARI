package kr.coo.onehari.util.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.util.service.WeatherService;
import lombok.extern.slf4j.Slf4j;
import java.io.InputStream;
import java.net.URL;
import org.apache.cxf.io.CachedOutputStream;
import org.apache.tomcat.util.http.fileupload.IOUtils;
/*
 * 작성자: 오형남
 * 시작: 2020. 1. 30
 * 내용: 날씨 API
 */
@Slf4j
@RestController
@RequestMapping("ajax/")
public class WeatherController {
	
	@Autowired
	private WeatherService weatherService;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder; // 비밀번호 암호화

	// 형남 0122 팀 별 근무시간 가져오기(전월)
	@RequestMapping(value = "getWeather.hari", method = RequestMethod.GET)
	public String getWeather(@RequestParam("weatherUrl") String weatherUrl) {
    	URL url = null;
    	InputStream in = null;
    	CachedOutputStream bos = null;
    	String data = null;

//   	String weatherUrl = request.getParameter("weatherUrl");
//    	
//    	URL url = new URL(weatherUrl);
//    	
//    	InputStream in = url.openStream();
//    	CachedOutputStream bos = new CachedOutputStream();
//    	IOUtils.copy(in, bos);
//    	in.close();
//    	bos.close();
//    	
//    	String data = bos.getOut().toString();
		try {
	    	url = new URL(weatherUrl);
	    	in = url.openStream();
	    	bos = new CachedOutputStream();
	    	IOUtils.copy(in, bos);
	    	in.close();
	    	bos.close();
	    	
	    	data = bos.getOut().toString();
	    	System.out.println(data);
		} catch (Exception e) {
			log.debug("getAllEmpTA 예외발생: " + e.getMessage());
		}
		return data;
	}
}
