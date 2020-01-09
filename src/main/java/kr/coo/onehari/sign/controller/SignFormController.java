package kr.coo.onehari.sign.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.coo.onehari.sign.dto.SignFormDto;
import kr.coo.onehari.sign.service.SignFormService;

@Controller
@RequestMapping("1hariSign/")
//전자결재 controller
public class SignFormController {
	@Autowired
	private SignFormService service;
	
	//양식등록 화면 김정하 / 2020. 1. 7~
	@RequestMapping(value="admin/formInsert.hari", method = RequestMethod.GET)
	public String formInsert() {
		return "1hariSign.formInsert";
	}
	
	//양식 등록 김정하 / 2020. 1. 8~
	@RequestMapping(value="admin/formInsert.hari", method = RequestMethod.POST)
	public String formInsert(SignFormDto form, Model model) {
		int result = service.insertForm(form);
		String view = "";
		if(result > 0) {
			view = "redirect:../signForm.hari";
			model.addAttribute("msg", "등록완료되었습니다.");
		}else {
			view = "redirect:formInsert.hari";
			model.addAttribute("msg", "등록실패했습니다. 다시확인바랍니다.");
		}
		return view;
	}
	
}
