package kr.coo.onehari.sign.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//전자결재 문서양식 테이블
public class SignFormDto {
	private int signFormCode; //문서양식 코드
	private String sFormName; //문서양식명
	private String sFormContent; //문서양식 html
}
