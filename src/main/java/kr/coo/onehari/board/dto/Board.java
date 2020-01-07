package kr.coo.onehari.board.dto;

import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
//공지사항 + 타임라인 테이블
public class Board {
	private int boardNum; //게시판 시퀀스번호
	private int empNum; //사번
	private int boardCode; //게시판 구분번호
	private String boardTitle; //게시판 제목
	private String boardContent; //게시판 내용
	private String boardWriter; //작성자
	private Timestamp bWriteDate; //작성일
	private int views; //조회수
	private String boardFileName; //첨부파일명
	private String boardFileRoot; //첨부파일 경로
	private int isBDel; //게시글 삭제여부
}
