
/*
작성자: 양찬식
시작: 2020. 1. 15
완료: 
내용:depart부서별게시판 작업 시작
*/

package kr.coo.onehari.depart.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/1hariDepart")
public class DepartController {
	@RequestMapping("/departList.hari")
	public String departList() {
		return "1hariDepart.departList";
	}
}
