package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//사용자 설정(테마색, 프로필사진) 테이블
public class Theme {
	private int empNum; //사번
	private String themeColor; //테마색
	private String themeFileName; //배경사진명
	private String themeFileRoot; //배경사진 경로
	private String profileFileName; //프로필사진명
	private String profileFileRoot; //프로필사진 경로
}
