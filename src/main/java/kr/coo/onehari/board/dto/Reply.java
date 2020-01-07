package kr.coo.onehari.board.dto;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항 게시판 댓글 테이블
public class Reply {
	private int replyNum; //댓글 시퀀스
	private int empNum; //댓글 작성자 사번
	private int boardNum; //해당 게시판 번호
	private String replyContent; //댓글 내용
	private Timestamp replyDate; //작성일
	private int isRDel; //삭제 여부
}