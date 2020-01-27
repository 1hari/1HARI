package kr.coo.onehari.sign.controller;

import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.coo.onehari.hr.dto.AnnUse;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Team;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.sign.dto.SignDto;
import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;
import kr.coo.onehari.sign.service.SignService;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("1hariSign/")
//전자결재 controller
public class SignController {

	//부서명 가져오는 service
	@Autowired
	private CorpService corpService;
	
	//양식 가져오는 service;
	@Autowired
	private SignFormService signFormService;
	
	//사원 가져오는 service;
	@Autowired
	private EmpService empService;
	
	//sign service
	@Autowired
	private SignService signService;

	//홈 화면 김정하 / 2020. 1. 7
	@RequestMapping("signHome.hari")
	public String signForm(Model model, String msg, String isOk, Principal principal) {
		String loginUser = principal.getName();
		HashMap<String, String> map = new HashMap<String, String>(); 
		
		map.put("loginUser", loginUser);
		map.put("pg", "3");
		map.put("cp", "0");
		
		//전자결재 기안 리스트
		map.put("code","1");
		List<SignDto> signDraftList = signService.selectSignList(map);

		//전자결재 완료 리스트
		map.put("code","2");
		List<SignDto> signCompletetList = signService.selectSignList(map);
		
		//전자결재 반려 리스트
		map.put("code","3");
		List<SignDto> signReturnList = signService.selectSignList(map);
		
		//전자결재 결재대기 리스트
		map.put("code","4");
		List<SignDto> signWaitingList = signService.selectSignList(map);
		
		model.addAttribute("signDraftList", signDraftList);
		model.addAttribute("signCompletetList", signCompletetList);
		model.addAttribute("signReturnList", signReturnList);
		model.addAttribute("signWaitingList", signWaitingList);
		model.addAttribute("msg", msg);
		model.addAttribute("isOk", isOk);
		
		return "1hariSign.signHome";
	}	
	
	//문서기안 화면 김정하 / 2020. 1. 8~
	@RequestMapping(value="docuDraft.hari", method = RequestMethod.GET)
	public String formDraft(String signFormCode, String signNum, Model model, Principal principal,String msg, String isOk) {
		
		if(signFormCode != null) {
			//폼가져오기
			SignFormDto form = signFormService.selectForm(signFormCode);
			model.addAttribute("form", form);
			
		}else {
			//반려문서 가져오기
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("signNum", signNum);
			map.put("pg", "3");
			map.put("cp", "0");
			map.put("code", "6"); //문서보기
			List<SignDto> signDocu = signService.selectSignList(map);
			
			model.addAttribute("signDocu", signDocu);
		}
		
		//기안자 정보 가져오기
		EmpDto emp = empService.empDefault(principal.getName());
		model.addAttribute("emp", emp);
		
		//부서 가져오기
		List<Team> teamList = corpService.getTeamCodes();
		model.addAttribute("teamList", teamList);
		
		
		//사원 가져오기
		List<EmpDto> empList = empService.empDefaultList();
		model.addAttribute("empList", empList);
		
		//성공,실패 메시지 전달
		model.addAttribute("msg", msg);
		model.addAttribute("isOk", isOk);
		
		return "1hariSign.docuDraft";
	}
		
	//문서기안 처리 김정하 / 2020. 1. 12~
	@RequestMapping(value="docuDraft.hari", method = RequestMethod.POST)
	public String formDraft(SignDto sign, HttpServletRequest request, Model model) {
		CommonsMultipartFile file = sign.getFile(); //view에서 DTO에 저장된 파일받아오기
		String filename = "";
		System.out.println(sign);
		
		if(file != null) { //파일이 있으면
			filename = file.getOriginalFilename(); //파일명
			String path = request.getServletContext().getRealPath("/WEB-INF/views/1hariSign/upload"); //서버의 실 경로
			//System.out.println("폴더경로 : " + path);
			
			String fpath = path + "\\" + filename;
			
			if(!filename.equals("")) { //실제 파일 업로드
				FileOutputStream fs=null;

				try {
					fs = new FileOutputStream(fpath);
					fs.write(file.getBytes());
					fs.close();
					
				} catch (Exception e) {
					log.debug("filewrite : " + e.getMessage());
				}
			}
			sign.setSignFileRoot(path); //첨부파일경로 저장
		}
		sign.setSignFileName(filename); //첨부파일 이름 저장
		
		int result = signService.insertSign(sign);
		String view = "";
			
		if(result > 0 ) { //DB insert 성공시
			view = "redirect:signHome.hari";
			model.addAttribute("msg", "기안완료되었습니다.");
			model.addAttribute("isOk", "true");
			
		}else {
			view = "redirect:docuDraft.hari";
			model.addAttribute("signFormCode", sign.getSignFormCode());
			model.addAttribute("msg", "기안 실패 되었습니다. 다시 확인 바랍니다.");
			model.addAttribute("isOk", "false");
		}
		return view;
	}
	
	//연차기안 화면 김정하 / 2020. 1. 24~
	@RequestMapping(value="annDraft.hari", method = RequestMethod.GET)
	public String annDraft(String signFormCode, String signNum, Model model, Principal principal,String msg, String isOk) {
			
		if(signFormCode != null) {
			if(!signFormCode.equals("0")) {//폼가져오기
				SignFormDto form = signFormService.selectForm(signFormCode);
				model.addAttribute("form", form);
			}
		}else {
			//반려문서 가져오기
			HashMap<String, String> map = new HashMap<String, String>(); 
			map.put("signNum", signNum);
			map.put("pg", "3");
			map.put("cp", "0");
			map.put("code", "6"); //문서보기
			List<SignDto> signDocu = signService.selectSignList(map);
			
			model.addAttribute("signDocu", signDocu);
		}
			
		//기안자 정보 가져오기
		EmpDto emp = empService.empDefault(principal.getName());
		model.addAttribute("emp", emp);
			
		//부서 가져오기
		List<Team> teamList = corpService.getTeamCodes();
		model.addAttribute("teamList", teamList);
			
		//사원 가져오기
		List<EmpDto> empList = empService.empDefaultList();
		model.addAttribute("empList", empList);
			
		//성공,실패 메시지 전달
		model.addAttribute("msg", msg);
		model.addAttribute("isOk", isOk);
			
		return "1hariSign.annDraft";
	}
	
	//연차기안 처리 김정하 / 2020. 1. 27~
	@RequestMapping(value="annDraft.hari", method = RequestMethod.POST)
	public String annDraft(SignDto sign, AnnUse annUse, Model model) {
		System.out.println(sign);
		System.out.println(annUse);
		
		sign.setSignFormCode("0");
		annUse.setEmpNum(sign.getDraftEmp());
		
		int result = 0; //signService.insertSign(sign);
		String view = "";
		
		try {
			result = signService.insertAnn(sign, annUse);
		} catch (Exception e) {
			log.debug("AnnInsertTran : " + e.getMessage());
		}
		
		if(result > 0 ) { //DB insert 성공시
			view = "redirect:signHome.hari";
			model.addAttribute("msg", "기안완료되었습니다.");
			model.addAttribute("isOk", "true");
			
		}else {
			view = "redirect:annDraft.hari";
			model.addAttribute("msg", "기안 실패 되었습니다. 다시 확인 바랍니다.");
			model.addAttribute("isOk", "false");
		}
		return view;
	}
	
	//내 문서함 화면 김정하 / 2020. 1. 7~
	@RequestMapping("myDocu.hari")
	public String myDocu() {
		return "1hariSign.myDocu";
	}
	
	//전체 문서함 화면 김정하 / 2020. 1. 22~
	@RequestMapping("admin/adminDocu.hari")
	public String adminDocu() {
		return "1hariSign.adminDocu";
	}
	

	//전자결재 문서보기 김정하 / 2020. 1. 15~
	@RequestMapping("signDocuView.hari")
	public String docuView(String signNum, Model model) {
		HashMap<String, String> map = new HashMap<String, String>(); 
		map.put("signNum", signNum);
		map.put("pg", "3");
		map.put("cp", "0");
		map.put("code", "6"); //문서보기
		List<SignDto> signDocu = signService.selectSignList(map);
		
		model.addAttribute("signDocu", signDocu);
		
		return "1hariPopUp.signDocuView";
	}
	
	//첨부파일 다운로드
	@RequestMapping("download.hari")
	public void download(String path, String file, HttpServletRequest request, HttpServletResponse response) {
		
		//한글 처리 형식 지정 String sEncoding = new String(filename.getBytes("euc-kr"),"8859_1");
		//response.setHeader("Content-Disposition","attachment;filename= " + sEncoding);
		//response.setHeader("Content-Disposition","attachment;filename= " + filename +";");
		//한글 파일명 처리 (Filtter 처리 확인) -> 경우 ...
		//한글 파일 깨짐 현상 해결하기
	        
	     // String fname = new String(f.getBytes("ISO8859_1"),"UTF-8");
		try {
			String fname = new String(file.getBytes("euc-kr"), "8859_1");
			//System.out.println(fname);
	     
		     // 다운로드 기본 설정 (브라우져가 read 하지 않고 ... 다운 )
		     // 요청 - 응답 간에 헤더정보에 설정을 강제 다운로드
		     // response.setHeader("Content-Disposition", "attachment;filename=" +
		     // new String(fname.getBytes(),"ISO8859_1"));
		     
		     response.setHeader("Content-Disposition", "attachment;filename=" + fname + ";"); //한글 처리
		     
		     // 파일명 전송
		     // 파일 내용전송
		     String fullpath = request.getServletContext().getRealPath(path + "/" + file);
		     //System.out.println(fullpath);
		     
		     FileInputStream fin = new FileInputStream(fullpath);
			// 출력 도구 얻기 :response.getOutputStream()
		     ServletOutputStream sout = response.getOutputStream();
		     byte[] buf = new byte[1024]; // 전체를 다읽지 않고 1204byte씩 읽어서
		     int size = 0;
		     
		     while ((size = fin.read(buf, 0, buf.length)) != -1) { // buffer 에 1024byte 담고
		    	 // 마지막 남아있는 byte 담고 그다음 없으면 탈출
		    	 sout.write(buf, 0, size); // 1kbyte씩 출력
		     }
		     fin.close();
		     sout.close();
		} catch (Exception e) {
			log.debug("filewrite : " + e.getMessage());
		}
	}
	
}
