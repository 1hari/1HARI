
package kr.coo.onehari.board.controller;
 
import java.sql.SQLException;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.coo.onehari.board.dto.Board;
import kr.coo.onehari.board.service.BoardService;
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
public class BoardController2 {

	@Autowired
	private BoardService boardservice; 
	

	//1. add_content 등록하기 0115수 김수연
	@RequestMapping("boardList.hari")
	public String boardInsert() {
		return "1hariBoard.boardList";
	}
	
	//2. add_content 등록하기 0115수 김수연
	@RequestMapping(value = "boardList.hari", method = RequestMethod.POST) //axios.post 로 보낸 걸로 받아서 
	public @ResponseBody String boardList(Board board) throws ClassNotFoundException, SQLException {
		JSONObject root = boardservice.add_content(board);
		
		return root.toJSONString(); //"1hariBoard.boardList";
	}
		
	//3.게시판 리스트 가져오기 0116목 김수연
	@RequestMapping(value = "/get_board_list.hari", method = RequestMethod.POST)
	public @ResponseBody String get_board_list(int board_idx, int page) {
		JSONObject root = boardservice.get_board_list(board_idx, page);
		System.out.println(root.toString());
		return root.toJSONString();
	}
	
	
	
}
