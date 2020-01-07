package kr.coo.onehari.message.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//메세지 테이블
public class Message {
	private int messageNum; //메세지 시퀀스
	private int recEmp; //수신자 사번
	private int sendEmp; //발신자 사번
	private Timestamp mDate; //발송시간
	private String mContent; //메세지 내용
	private String mFileName; //첨부파일명
	private String mFileRoot; //첨부파일 경로
	private int isReceive; //수신 여부
	private int isMDel; //삭제 여부
}