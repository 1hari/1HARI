package kr.coo.onehari.board.dao;

import kr.coo.onehari.board.dto.Board;

/*
작성자: 김수연
시작: 2020. 1. 14
완료: 
내용: board 작업 시작
*/

//게시판 컨텐츠 추가하기 김수연 01.14 화요일 
public interface BoardDao { 
	//컨텐츠 추가하기 
	public int addContent(Board boardContent);
	
	//추가한 컨텐츠 글번호 가져오기
	public int getBoardNum();

}
	
// 아래가 vue 로 만든 dao코드 참고
//	//회원가입
//	public int joinUser(User user);
//	//정보수정
//	public int userModify(User user);	
//	//아이디 중복체크
//	public int userIdCheck(String userId);
//	//로그인
//	public User userLogin(String userId, String userPw);

//	//보드 정보 불러오기
//	public List<Board> getBoardInfo();
//	//컨텐츠 리스트 가져오기
//	public List<Content> getBoardList(int boardIdx,int idxMin, int idxMax);
//	//게시판 번호로 게시판 정보 가져오기(컨텐츠 리스트 가져오기에 포함)
//	public Board getBoardInfoByIdx(int boardIdx);
//	//게시판 페이지 하단부분
//	public int getContentCount(int boardIdx);
//	//컨텐츠 리스트 가져오기 TOP5
//	public List<Content> getTop5List(int boardIdx);
//	//컨텐츠 추가
//	public int addContent(Content content);
//	//추가한 컨텐츠 번호 가져오기
//	public int getContentIdx();
//	//컨텐츠 가져오기(Read)
//	public Content getContent(int contentIdx);
//	//컨텐츠 수정하기
//	public int modifyContent(Content content);
//	//이미 파일이 있던 컨텐츠 수정하기
//	public int modifyContentFile(Content content);
//	//컨텐츠 삭제하기
//	public int deleteContent(int contentIdx);

