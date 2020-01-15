package kr.coo.onehari.board.dto;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항 + 타임라인 테이블
/*
작성자: 김수연
시작: 2020. 1. 14
완료: 
내용: board 작업 시작
*/
public class Board { //vuemavenproject에서 content.java dto
	
	private int empNum; //사번
	
	private int boardNum; //글번호 
	private int boardCode; //게시판 구분 번호  board_info_idx; 원래는 boardtype.java에 있다 
	private String boardTitle; //게시글 제목 content_subject;
	private String boardContent; //게시글 내용 content_text;
	private String writer; //작성자  content_writer_name;
	private Timestamp boardWriteDate; //작성일 content_date; //작성일 timestamp 는 보이게만 하고, crud안해도 됨 
	private int views; //조회수 
	private String boardFileName; //첨부파일명
	private String boardFileRoot; //첨부파일 경로
	private int isBDel; //게시글 삭제여부
}
