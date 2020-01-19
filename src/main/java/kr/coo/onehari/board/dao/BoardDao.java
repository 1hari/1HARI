package kr.coo.onehari.board.dao;

import java.util.List;

import kr.coo.onehari.board.dto.Board; //예전 maven파일에서  content.java파일 
import kr.coo.onehari.board.dto.BoardType; //예전 maven파일에서 board.java

/*
작성자: 김수연
시작: 2020. 1. 14
완료: 
내용: board 작업 시작
*/


public interface BoardDao { 
	
	//컨텐츠 리스트 가져오기  김수연  0116 목 
	//public List<Content> getTopList(int boardCode);
	
	//게시판 컨텐츠 추가하기 김수연 01.14 화요일 
	//public int addContent(Board board) throws ClassNotFoundException, SQLException;
	
	//추가한 컨텐츠 글번호  가져오기 김수연  01.14 화요일 
	//public int getBoardNum() throws ClassNotFoundException, SQLException;
	
	
	// 0116 목 김수연 시작 
	//보드 정보 불러오기
	//public List<BoardType> getBoardInfo();
	//컨텐츠 리스트 가져오기
	//public List<Board> getBoardList(int boardIdx,int idxMin, int idxMax);
	//게시판 번호로 게시판 정보 가져오기(컨텐츠 리스트 가져오기에 포함)
	//public BoardType getBoardInfoByIdx(int boardIdx);
	//게시판 페이지 하단부분
	//public int getContentCount(int boardIdx);
	//컨텐츠 리스트 가져오기 TOP5
	//public List<Board> getTop5List(int boardIdx);
	
	//컨텐츠 추가 (Create1)
	public int addContent(Board content);
	//추가한 컨텐츠 번호 가져오기 (Create2)
	public int getContentIdx();
	
	//컨텐츠 가져오기(Read)
	public Board getContent(int contentIdx);
	//컨텐츠 수정하기 (Modify)
	//public int modifyContent(Board content);
	//이미 파일이 있던 컨텐츠 수정하기 (Modify)
	//public int modifyContentFile(Board content);
	//컨텐츠 삭제하기 (Delete)
	//public int deleteContent(int contentIdx);

}
	


