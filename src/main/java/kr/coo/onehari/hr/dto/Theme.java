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
	private String tColor; //테마색
	private String tFileName; //배경사진명
	private String tFileRoot; //배경사진 경로
	private String pFileName; //프로필사진명
	private String pFileRoot; //프로필사진 경로
}
