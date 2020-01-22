package kr.coo.onehari.my.dto;

import org.springframework.web.multipart.MultipartFile;

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
	private String profileFileName; //프로필사진명
	private String profileFileRoot; //프로필사진 경로
	
	//파일업로드를 위해서
	private MultipartFile file;
}
