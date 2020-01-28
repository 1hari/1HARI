package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//연차정보 DTO
@Getter
@Setter
@ToString
public class EmpAnn {
	private String empNum; //연차사용자 사번
	private String hireDate; //입사일
	private String totalAnn; //총 연차
	private int useAnn; //사용 연차
}
