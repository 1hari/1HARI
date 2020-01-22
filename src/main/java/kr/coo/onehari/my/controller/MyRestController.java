package kr.coo.onehari.my.controller;

import java.io.FileOutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.coo.onehari.my.dto.Theme;
import kr.coo.onehari.my.service.MyService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("ajax/")
public class MyRestController {
	@Autowired
	private MyService myService;
	
	//개인설정 파일 drop 시 파일명 반환 김정하 / 2020. 1. 22
	@RequestMapping("filename.hari")
	public Map<String, String> filename(MultipartFile file) {
		System.out.println(file.getOriginalFilename());
		Map<String, String> fileNameJson = new HashMap<String, String>();
		fileNameJson.put("fileName", file.getOriginalFilename());
		return fileNameJson;
	}
	
	//개인설정 가져오기 오형남 / 2020. 1. 16, 김정하 / 2020. 1. 22 
	@RequestMapping("getMyTheme.hari")
	public Theme getMyTheme(Principal principal) {
		String empNum = principal.getName();
		Theme theme = myService.getMyTheme(empNum);
		return theme;
	}
	
	@RequestMapping("setMyTheme.hari")
	public String setMyTheme(Theme theme, HttpServletRequest request, Principal principal) {
		System.out.println(theme);
		theme.setEmpNum(Integer.parseInt(principal.getName()));
		MultipartFile file = theme.getFile(); //view에서 DTO에 저장된 파일받아오기
		String filename = "";
		String path = request.getServletContext().getRealPath("/resources/hari/profileFileUpload"); //서버의 실 경로
		
		if(file != null) { //파일이 있으면
			filename = file.getOriginalFilename(); //파일명
			System.out.println("폴더경로 : " + path);
			
			String fpath = path + "\\" + filename;
			
			if(!filename.equals("")) { //실제 파일 업로드
				FileOutputStream fs = null;

				try {
					fs = new FileOutputStream(fpath);
					fs.write(file.getBytes());
					fs.close();
					
				} catch (Exception e) {
					log.debug("filewrite : " + e.getMessage());
				}
			}
		}
		theme.setProfileFileRoot(path); //첨부파일경로 저장
		theme.setProfileFileName(filename); //첨부파일 이름 저장
		
		int result = myService.setMyTheme(theme);
		String resultString = "false";
		
		if(result > 0) {
			resultString = "true";
		}
		
		return resultString;
	}
	
}
