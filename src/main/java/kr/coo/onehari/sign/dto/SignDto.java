package kr.coo.onehari.sign.dto;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//전자결재 테이블
public class SignDto {
	private int signNum; //전자결재 시퀀스
	
	//DB는 int / form 태그 값 받기위해 String 으로 변경
	private String draftEmp; //작성자 사번
	private String draftEmpName; //작성자 이름 김정하 / 2020. 1. 14
	private String empSign1; //결재자1 사번
	private String empSign1Name; //결재자1 이름 김정하 / 2020. 1. 14
	private String empSign2; //결재자2 사번
	private String empSign2Name; //결재자2 이름 김정하 / 2020. 1. 14
	private String signFormCode; //문서양식 코드
	private String signFormFormName; //문서양식명 김정하 / 2020. 1.13
	//----------------------------------------------
	
	private int signCode; //결재 구분번호
	private String signName; //결재구분명 김정하 / 2020. 1.13
	private String signTitle; //전자결재 제목
	private String signContent; //전자결재 내용
	private String signDate; //작성일
	private int isSign1; //결재여부1
	private int isSign2; //결재여부2
	private String signComment; //전자결재 코멘트
	private String signFileName; //첨부파일명
	private String signFileRoot; //첨부파일 경로
	
	//파일업로드를 위해서
	private CommonsMultipartFile file;
}