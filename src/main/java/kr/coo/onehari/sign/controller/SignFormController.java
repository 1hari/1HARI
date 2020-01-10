package kr.coo.onehari.sign.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;

@Controller
@RequestMapping("1hariSign/admin/")
//전자결재 controller
public class SignFormController {
	@Autowired
	private SignFormService service;
	
	//양식관리 화면 김정하 / 2020. 1. 10~
	@RequestMapping("formList.hari")
	public String formList(Model model, String msg, String isOk) {
		List<SignFormDto> formList = service.selectAllForm();
		model.addAttribute("formList", formList);
		model.addAttribute("msg", msg);
		model.addAttribute("isOk", isOk);
		return "1hariSign.formList";
	}
	
	//양식등록 화면 김정하 / 2020. 1. 7
	@RequestMapping(value="formInsert.hari", method = RequestMethod.GET)
	public String formInsert() {
		return "1hariSign.formInsert";
	}
	
	//양식 등록 김정하 / 2020. 1. 8 ~ 9
	@RequestMapping(value="formInsert.hari", method = RequestMethod.POST)
	public String formInsert(SignFormDto form, Model model) {
		int result = service.insertForm(form);
		String view = "";
		if(result > 0) {
			view = "redirect:formList.hari";
			model.addAttribute("msg", "등록완료되었습니다.");
			model.addAttribute("isOk", "true");
		}else {
			view = "redirect:formInsert.hari";
			model.addAttribute("msg", "등록실패했습니다. 다시확인바랍니다.");
			model.addAttribute("isOk", "false");
		}
		return view;
	}
	
	//양식 삭제 김정하 / 2020. 1. 7
	@RequestMapping("formDelete.hari")
	public String formDelete(String signFormCode, Model model) {
		int result = service.deleteForm(signFormCode);
		
		if(result > 0) {
			model.addAttribute("msg", "삭제완료되었습니다.");
			model.addAttribute("isOk", "true");
		}else {
			model.addAttribute("msg", "삭제실패했습니다. 다시확인바랍니다.");
			model.addAttribute("isOk", "false");
		}
		return "redirect:formList.hari";
	}
	
}
