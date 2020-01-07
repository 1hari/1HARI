package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//직책 테이블
public class Position {
	private int positionCode; //직책코드
	private String positionName; //직책명
}