package kr.coo.onehari.sign.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//전자결재 테이블
public class SignDto {
	private int signNum; //전자결재 시퀀스
	private int draftEmp; //작성자
	private int empSign1; //결재자1
	private int empSign2; //결재자2
	private int signFormCode; //문서양식 코드
	private int signCode; //결재 구분번호
	private String signTitle; //전자결재 제목
	private String signContent; //전자결재 내용
	private Timestamp signDate; //작성일
	private int isSign1; //결재여부1
	private int isSign2; //결재여부2
	private String signComment; //전자결재 코멘트
	private String signFileName; //첨부파일명
	private String signFileRoot; //첨부파일 경로
}
