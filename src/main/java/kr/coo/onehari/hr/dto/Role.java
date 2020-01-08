package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//권한 테이블
public class Role {
	private String roleName; //권한명
	private String roleDSCR; //권한명
}