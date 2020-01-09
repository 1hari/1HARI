package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//재직구분 테이블
public class Employment {
	private int employmentCode; //소속 코드
	private String employmentName; //소속명
}
