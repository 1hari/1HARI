package kr.coo.onehari.sign.controller;

import java.io.FileOutputStream;
import java.security.Principal;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import kr.coo.onehari.hr.dao.CorpDao;
import kr.coo.onehari.hr.dto.EmpDto;
import kr.coo.onehari.hr.dto.Team;
import kr.coo.onehari.hr.service.CorpService;
import kr.coo.onehari.hr.service.EmpService;
import kr.coo.onehari.sign.dto.SignDto;
import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;
import kr.coo.onehari.sign.service.SignService;
import lombok.extern.java.Log;
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
	@RequestMapping("signForm.hari")
	public String signForm(Model model, String msg, String isOk, Principal principal) {
		String draftEmp = principal.getName();
		HashMap<String, String> map = new HashMap<String, String>(); 
		
		map.put("draftEmp", draftEmp);
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
		
		return "1hariSign.signForm";
	}	
	
	//문서기안 화면 김정하 / 2020. 1. 8~
	@RequestMapping(value="docuDraft.hari", method = RequestMethod.GET)
	public String formDraft(String signFormCode, Model model, Principal principal,String msg, String isOk) {
		
		//폼가져오기
		SignFormDto form = signFormService.selectForm(signFormCode);
		model.addAttribute("form", form);
		
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
	
	//문서기안 화면 김정하 / 2020. 1. 12~
	@RequestMapping(value="docuDraft.hari", method = RequestMethod.POST)
	public String formDraft(SignDto sign, HttpServletRequest request, Model model) {
		CommonsMultipartFile file = sign.getFile(); //view에서 DTO에 저장된 파일받아오기
		String filename = "";
		System.out.println(sign);
		
		if(file != null) { //파일이 있으면
			filename = file.getOriginalFilename(); //파일명
			String path = request.getServletContext().getRealPath("/WEB-INF/views/1hariSign/upload"); //서버의 실 경로
			System.out.println("폴더경로 : " + path);
			
			String fpath = path + "\\" + filename;
			
			if(!filename.equals("")) { //실제 파일 업로드
				FileOutputStream fs=null;

				try {
					fs = new FileOutputStream(fpath);
					fs.write(file.getBytes());
					fs.close();
					
				} catch (Exception e) {
					System.out.println("filewrite : " + e.getMessage()); //syso 나중에 지워야지
					log.debug("filewrite : " + e.getMessage());
				}
			}
			sign.setSignFileRoot(path); //첨부파일경로 저장
		}
		sign.setSignFileName(filename); //첨부파일 이름 저장
		
		int result = signService.insertSign(sign);
		String view = "";
			
		if(result > 0 ) { //DB insert 성공시
			view = "redirect:signForm.hari";
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
	
	//내 문서함 화면 김정하 / 2020. 1. 7~
	@RequestMapping("myDocu.hari")
	public String myDocu() {
		
		return "1hariSign.myDocu";
	}
}
