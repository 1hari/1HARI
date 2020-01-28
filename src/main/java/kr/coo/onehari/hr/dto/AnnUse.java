package kr.coo.onehari.hr.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

//연차 DTO
@Getter
@Setter
@ToString
public class AnnUse {
	private int annListNum; //연차번호
	private int signNum; //전자결재 번호
	private String empNum; //연차사용자 사번
	private String startDate; //연차 시작 날짜
	private String endDate; //연차 끝 날짜
	private int useAnn; //연차사용일수
	private int isSign; //연차승인여부
}
