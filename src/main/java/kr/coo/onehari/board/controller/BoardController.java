package kr.coo.onehari.board.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/1hariBoard")
public class BoardController {
	@RequestMapping("/boardList.hari")
	public String boardList() {
		return "1hariBoard.boardList";
	}
}
