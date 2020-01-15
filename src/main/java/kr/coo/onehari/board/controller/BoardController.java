
package kr.coo.onehari.board.controller;
 
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller; 
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.board.dto.Board;
import kr.coo.onehari.board.service.BoardService;
import kr.coo.onehari.hr.controller.HrController;
import lombok.extern.slf4j.Slf4j;  

/*
작성자: 김수연
시작: 2020. 1. 14
완료: 
내용: board 작업 시작
*/

@Slf4j
@Controller
@RequestMapping("1hariBoard/")
public class BoardController {

	@Autowired
	private BoardService boardservice;
	
	//add_content 등록하기 0115수 시작
	@RequestMapping("boardList.hari")
	public String boardInsert() {
		return "1hariBoard.boardList";
	}
	
	//add_content 등록하기 0115수 시작
	@RequestMapping(value = "boardList.hari", method = RequestMethod.GET)
	public String boardList() {
		
		return "1hariBoard.boardList";
	}
	
	
	// 컨텐츠 추가  작업 하는 중 1.14
	/*
	 * @RequestMapping(value = "/add_content.hari", method = RequestMethod.POST)
	 * public @ResponseBody String addContent(Board board) {
	 * System.out.println(board.toString()); JSONObject root =
	 * boardservice.add_content(board); System.out.println(root.toString()); return
	 * root.toJSONString(); }
	 */
}
/*@Controller

@RequestMapping("/1hariBoard") public class BoardController {
 
 @RequestMapping("/boardList.hari") public String boardList() {
	 return "1hariBoard.boardList"; 
	 
 }

}*/

/* vue controller만들었던 거 참고 
package controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import dto.Board;
import dto.Content;
import dto.User;
import service.BoardService;
import service.UserService;

@RestController
public class VueController {

	@Autowired
	private UserService user_service;
	@Autowired
	private BoardService board_service;

	// 회원가입 시 아이디 중복체크
	@RequestMapping(value = "/check_user_id.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Boolean> check_user_id(String user_id) {
		boolean result = user_service.check_user_id(user_id);
		HashMap<String, Boolean> check_result = new HashMap<>();
		if (result) {// 이미 가입된 아이디가 있으면 true => 존재하는 아이디입니다.
			check_result.put("check_result", true);
		} else {
			check_result.put("check_result", false);
		}
		return check_result;
	}

	// 회원가입
	@RequestMapping(value = "/join_user.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Boolean> join_user(User user) {
		System.out.println(user.toString());
		boolean result = user_service.join_user(user);
		HashMap<String, Boolean> check_result = new HashMap<>();
		if (result) {// 가입성공
			check_result.put("result", true);
		} else {// 가입실패
			check_result.put("result", false);
		}
		return check_result;
	}

	// 로그인
	@RequestMapping(value = "/login.do", method = RequestMethod.POST)
	public @ResponseBody String login(String user_id, String user_pw) {
		User result = user_service.login(user_id, user_pw);
		JSONObject jsonObject = new JSONObject();
//		HashMap<String, String> check_result = new HashMap<>();
		if (result != null) {// 로그인 성공
			jsonObject.put("result", true);
			jsonObject.put("user_idx", result.getUser_idx());
			jsonObject.put("user_name", result.getUser_name());
			jsonObject.put("user_id", user_id);
			System.out.println(jsonObject.toString());
		} else {// 가입실패
			jsonObject.put("result", false);
		}
		return jsonObject.toString();
	}

	// 정보수정
	@RequestMapping(value = "/user_modify.do", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Boolean> user_modify(User user, HttpServletRequest request) {
		System.out.println(request.getParameter("user_pw"));
		System.out.println(user.toString());
		HashMap<String, Boolean> check_result = new HashMap<>();

		if (user.isUser_login_chk() == false) {
			System.out.println("로그인 안되어있음");
			check_result.put("result", false);
			return check_result;
		}
		boolean result = user_service.user_modify(user);

		if (result) {// 수정성공
			check_result.put("result", true);
		} else {// 수정실패
			check_result.put("result", false);
		}
		return check_result;
	}

	// 보드 정보 가져오기(탑바)
	@RequestMapping(value = "/get_board_info.do", method = RequestMethod.GET)
	public @ResponseBody String get_board_info() {
		List<Board> list = board_service.get_board_info();
		JSONArray root = new JSONArray();
		if (!list.isEmpty() && list != null) {
			for (Board board : list) {
				JSONObject obj = new JSONObject();
				obj.put("board_info_idx", board.getBoard_info_idx());
				obj.put("board_info_name", board.getBoard_info_name());
				root.add(obj);
			}
		} else {
			System.out.println("실패");
		}
		return root.toJSONString();
	}
	
	// 게시판 리스트 가져오기
	@RequestMapping(value = "/get_board_list.do", method = RequestMethod.POST)
	public @ResponseBody String get_board_list(int board_idx, int page) {
		JSONObject root = board_service.get_board_list(board_idx, page);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	// 게시판 리스트 TOP5 가져오기
	@RequestMapping(value = "/get_top5_list.do", method = RequestMethod.POST)
	public @ResponseBody String get_top5_list(int board_idx) {
		JSONObject root = board_service.get_top5_list(board_idx);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	// 컨텐츠 추가  작업 하는 중 1.14
	@RequestMapping(value = "/add_content.do", method = RequestMethod.POST)
	public @ResponseBody String add_content(Content content) {
		System.out.println(content.toString());
		JSONObject root = board_service.add_content(content);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	// 컨텐츠 가져오기(Read)
	@RequestMapping(value = "/get_content.do", method = RequestMethod.POST)
	public @ResponseBody String get_content(int content_idx) {
		JSONObject root = board_service.get_content(content_idx);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	// 컨텐츠 수정하기(Read)
	@RequestMapping(value = "/modify_content.do", method = RequestMethod.POST)
	public @ResponseBody String modify_content(Content content) {
		JSONObject root = board_service.modify_content(content);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	// 컨텐츠 삭제하기(Read)
	@RequestMapping(value = "/delete_content.do", method = RequestMethod.POST)
	public @ResponseBody String delete_content(int content_idx) {
		JSONObject root = board_service.delete_content(content_idx);
		System.out.println(root.toString());
		return root.toJSONString();
	}
}
*/