package kr.coo.onehari.board.dto;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항 + 타임라인 보드타입 테이블
/*
 * 2020.01.14.화요일 3:54pm~
 * 작성자 김수연
 * 
 * */
public class BoardType {
	private int boardCode; //게시판 시퀀스번호 board_info_idx; private int board_info_idx; //게시판 번호 
	private String boardName; //게시판 이름  board_info_name; private String board_info_name; //게시판 이름 : 자유게시판  

}
