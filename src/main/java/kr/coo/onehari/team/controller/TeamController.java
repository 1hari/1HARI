package kr.coo.onehari.team.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("1hariTeam/")
public class TeamController {

	@RequestMapping("teamList.hari")
	public String teamList() {
		return "1hariTeam.teamList";
	}
}
