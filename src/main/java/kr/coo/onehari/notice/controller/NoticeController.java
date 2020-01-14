package kr.coo.onehari.notice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller
@RequestMapping("/1hariNotice")
public class NoticeController {
	@RequestMapping("/noticeList.hari")
	public String boardList() {
		return "1hariNotice.noticeList";
	}
}

