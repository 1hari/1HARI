package kr.coo.onehari.board.controller;

import java.util.List;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import kr.coo.onehari.board.dto.Board; //sts에서 content.java
import kr.coo.onehari.board.dto.BoardType; //sts에서 board.java
import kr.coo.onehari.board.service.BoardService;
import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
@RequestMapping("/1hariBoard")
public class BoardController {
	
	

	@Autowired
	private BoardService board_service;
	
	@RequestMapping("/boardList.hari")
	public String boardList() {
		return "1hariBoard.boardList";
	}
	

	

	// 보드 정보 가져오기(탑바)
	@RequestMapping(value = "/get_board_info.hari", method = RequestMethod.POST)
	public @ResponseBody String get_board_info() {
		List<BoardType> list = board_service.get_board_info();
		
		
		JSONArray root = new JSONArray();
		if (!list.isEmpty() && list != null) {
			for (BoardType boardtype : list) {
			JSONObject obj = new JSONObject();
				obj.put("boardCode", boardtype.getBoardCode());
				obj.put("boardName", boardtype.getBoardName());
				root.add(obj);
			}
		} else {
			System.out.println("실패");
		}
		return root.toJSONString();
}
	
	// 게시판 리스트 가져오기  // vue.js board_main.vue 에서 params.append axios.post 
	@RequestMapping(value = "/get_board_list.hari", method = RequestMethod.POST)
	public @ResponseBody String get_board_list(int board_idx, int page) {
		JSONObject root = board_service.get_board_list(board_idx, page);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	// 게시판 리스트 TOP5 가져오기
	@RequestMapping(value = "/get_top5_list.hari", method = RequestMethod.POST)
	public @ResponseBody String get_top5_list(int board_idx) {
		JSONObject root = board_service.get_top5_list(board_idx);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	// 컨텐츠 추가
	@RequestMapping(value = "/add_content.hari", method = RequestMethod.POST)
	public @ResponseBody String add_content(Board content) {
		System.out.println(content.toString()+"컨텐츠 추가되나요?");
		JSONObject root = board_service.add_content(content);
		System.out.println(root.toString()+"dd");
		return root.toJSONString();
	}
	
//	// 컨텐츠 가져오기(Read)
	@RequestMapping(value = "/get_content.hari", method = RequestMethod.POST)
	public @ResponseBody String get_content(int boardNum) {
		JSONObject root = board_service.get_content(boardNum);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	// 컨텐츠 수정하기(Read)
	@RequestMapping(value = "/modify_content.hari", method = RequestMethod.POST)
	public @ResponseBody String modify_content(Board board) {
		JSONObject root = board_service.modify_content(board);
		System.out.println(root.toString());
		return root.toJSONString();
	}	
	// 컨텐츠 삭제하기(Read)
	@RequestMapping(value = "/delete_content.hari", method = RequestMethod.POST)
	public @ResponseBody String delete_content(int boardNum) {
		JSONObject root = board_service.delete_content(boardNum);
		System.out.println(root.toString());
		return root.toJSONString();
	}

	
}



