/*
작성자: 김수연
시작: 2020. 1. 14
완료: 
내용: board 작업 시작
*/


package kr.coo.onehari.board.service;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.board.dao.BoardDao;
import kr.coo.onehari.board.dto.*;

@Service
public class BoardService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
    ServletContext context;
	
//컨텐츠 추가
	public JSONObject add_content(Board board) throws ClassNotFoundException, SQLException {
		
	
		JSONObject root = new JSONObject();
		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//		CommonsMultipartFile file = content.getFile(); // 파일 가져오기
//		String filename =file.getOriginalFilename();
//		String path = context.getRealPath("/upload");
//
//		String fpath = path + "\\" + filename; // 문자로 인식
//		System.out.println("path입니당: " + fpath);
//		if (!filename.equals("") || filename!=null) { // 실제 파일 업로드
//			FileOutputStream fs = null;
//			try {
//				fs = new FileOutputStream(fpath);
//				fs.write(file.getBytes());
//				fs.close();
//			} catch (Exception e) {
//				System.out.println("filewrite : " + e.getMessage());
//			}
//		}
//		content.setContent_file(filename);

		int result = boarddao.addContent(board);
		if(result >0) {
			root.put("result", true);
			root.put("boardnum", board.getBoardNum()); //글번호를 뿌려놓기.... 
		}else {
			root.put("result", false);
		}
		return root;
	}
}

/*
@Service
public class BoardService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
    ServletContext context;

	// 탑바 보드정보 가져오기
	public List<Board> get_board_info() {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		List<Board> result = dao.getBoardInfo();
		return result;
	}

	// 게시판 별 컨텐츠 리스트 가져오기
	public JSONObject get_board_list(int board_idx, int page) {
		JSONObject root = new JSONObject();
		BoardDao dao = sqlsession.getMapper(BoardDao.class);

		// 게시판 페이지 번호 가져오기
		int idx_min = (page - 1) * 10 + 1;
		int idx_max = idx_min + 9;

		// 해당 게시판 정보 가져오기
		Board board = dao.getBoardInfoByIdx(board_idx); 
		System.out.println(board);
		String board_name = board.getBoard_info_name();
		root.put("board_info_name", board_name);

		// 해당 게시판 컨텐츠 리스트 가져오기
		List<Content> list = dao.getBoardList(board_idx, idx_min, idx_max);

		JSONArray board_list = new JSONArray();
		for (Content content : list) {
			JSONObject obj = new JSONObject();
			obj.put("content_idx", content.getContent_idx());
			obj.put("content_subject", content.getContent_subject());
			obj.put("content_writer_name", content.getContent_writer_name());
			obj.put("content_date", content.getContent_date());
			board_list.add(obj);
		}
		root.put("board_list", board_list);

		// 하단 페이징
		int contentCount = dao.getContentCount(board_idx);
		System.out.println(contentCount);
		int page_cnt = contentCount / 10;
		if (page_cnt % 10 > 0) {
			page_cnt++;
		}
		if (page_cnt == 0) {
			page_cnt++;
		}

		int page_min = ((page - 1) / 10) * 10 + 1;
		int page_max = page_min + 9;

		if (page_max > page_cnt) {
			page_max = page_cnt;
		}

		JSONArray page_array = new JSONArray();
		for (int i = page_min; i <= page_max; i++) {
			page_array.add(i);
		}

		root.put("page_array", page_array);

		// 이전버튼
		int pre = page_min - 1;
		if (pre < 1) {
			pre = 1;
		}

		// 다음버튼
		int next = page_max + 1;
		if (next > page_cnt) {
			next = page_cnt;
		}
		root.put("pre", pre);
		root.put("next", next);

		return root;
	}

	// 게시판 별 TOP5
	public JSONObject get_top5_list(int board_idx) {
		JSONObject root = new JSONObject();
		BoardDao dao = sqlsession.getMapper(BoardDao.class);

		// 해당 게시판 정보 가져오기
		Board board = dao.getBoardInfoByIdx(board_idx);
		System.out.println(board);
		String board_name = board.getBoard_info_name();
		root.put("board_info_name", board_name);

		// 해당 게시판 컨텐츠 리스트 가져오기
		List<Content> list = dao.getTop5List(board_idx);

		JSONArray board_list = new JSONArray();
		for (Content content : list) {
			JSONObject obj = new JSONObject();
			obj.put("content_idx", content.getContent_idx());
			obj.put("content_subject", content.getContent_subject());
			obj.put("content_writer_name", content.getContent_writer_name());
			obj.put("content_date", content.getContent_date());
			board_list.add(obj);
		}
		root.put("board_list", board_list);

		return root;
	}
	
	//컨텐츠 추가
	public JSONObject add_content(Content content) {
		JSONObject root = new JSONObject();
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
//		CommonsMultipartFile file = content.getFile(); // 파일 가져오기
//		String filename =file.getOriginalFilename();
//		String path = context.getRealPath("/upload");
//
//		String fpath = path + "\\" + filename; // 문자로 인식
//		System.out.println("path입니당: " + fpath);
//		if (!filename.equals("") || filename!=null) { // 실제 파일 업로드
//			FileOutputStream fs = null;
//			try {
//				fs = new FileOutputStream(fpath);
//				fs.write(file.getBytes());
//				fs.close();
//			} catch (Exception e) {
//				System.out.println("filewrite : " + e.getMessage());
//			}
//		}
//		content.setContent_file(filename);

		int result = dao.addContent(content);
		if(result >0) {
			root.put("result", true);
			root.put("content_idx", content.getContent_idx());
		}else {
			root.put("result", false);
		}
		return root;
	}
	
	// 컨텐츠 가져오기(Read)
	public JSONObject get_content(int contentIdx) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		Content content = dao.getContent(contentIdx);
		JSONObject root = new JSONObject();
		root.put("content_idx", contentIdx);
		root.put("content_subject", content.getContent_subject());
		root.put("content_text", content.getContent_text());
		root.put("content_file", content.getFile());
		root.put("content_writer_idx", content.getContent_writer_idx());
		root.put("content_writer_name", content.getUser_name());
		root.put("content_date", content.getContent_date());
		return root;
	}
	
	//컨텐츠 수정
	public JSONObject modify_content(Content content) {
		JSONObject root = new JSONObject();
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
//		CommonsMultipartFile file = content.getFile(); // 파일 가져오기
//		String filename =file.getOriginalFilename();
//		String path = context.getRealPath("/upload");
//
//		String fpath = path + "\\" + filename; // 문자로 인식
//		System.out.println("path입니당: " + fpath);
//		if (!filename.equals("") || filename!=null) { // 실제 파일 업로드
//			FileOutputStream fs = null;
//			try {
//				fs = new FileOutputStream(fpath);
//				fs.write(file.getBytes());
//				fs.close();
//			} catch (Exception e) {
//				System.out.println("filewrite : " + e.getMessage());
//			}
//		}
//		content.setContent_file(filename);
		int result=0;
		if(content.getContent_file() != null || content.getContent_file()=="") { //이미 파일이 있으면
			result = dao.modifyContentFile(content);
		}else {
			result = dao.modifyContent(content);
		}
		if(result >0) {
			root.put("result", true);
		}else {
			root.put("result", false);
		}
		return root;
	}
	
	// 컨텐츠 삭제하기
	public JSONObject delete_content(int contentIdx) {
		BoardDao dao = sqlsession.getMapper(BoardDao.class);
		JSONObject root = new JSONObject();
		int result=dao.deleteContent(contentIdx);
		if(result >0) {
			root.put("result", true);
		}else {
			root.put("result", false);
		}
		return root;
	}
}
*/