package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//직급 테이블
public class Rank {
	private int rankCode; //직급코드
	private String rankName; //직급명
	private int sal; //직급별 연봉
	private double incomeTaxRate; //직급별 소득세율
}