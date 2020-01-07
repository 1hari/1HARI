package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//소속 테이블
public class Team {
	private int teamCode; //소속 코드
	private String teamName; //소속명
}
