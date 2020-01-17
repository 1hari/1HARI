package kr.coo.onehari.board.service;

import java.util.List;

import javax.servlet.ServletContext;

import org.apache.ibatis.session.SqlSession;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.coo.onehari.board.dao.BoardDao;
import kr.coo.onehari.board.dto.BoardType;  //예전 sts파일에서 board.java
import kr.coo.onehari.board.dto.Board; //예전 sts파일에서 content.java

@Service
public class BoardService {

	@Autowired
	private SqlSession sqlsession;
	
	@Autowired
    ServletContext context;

	// 탑바 보드정보 가져오기
//	public List<BoardType> get_board_info() {
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//		List<BoardType> result = boarddao.getBoardInfo();
//		return result;
//	}

	// 게시판 별 컨텐츠 리스트 가져오기
//	public JSONObject get_board_list(int board_idx, int page) {
//		JSONObject root = new JSONObject();
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//
//		// 게시판 페이지 번호 가져오기
//		int idx_min = (page - 1) * 10 + 1;
//		int idx_max = idx_min + 9;
//
//		// 해당 게시판 정보 가져오기
//		BoardType boardtype = boarddao.getBoardInfoByIdx(board_idx); 
//		System.out.println(boardtype);
//		String board_name = boardtype.getBoardName();
//		root.put("board_info_name", board_name);
//
//		// 해당 게시판 컨텐츠 리스트 가져오기
//		List<Board> list = boarddao.getBoardList(board_idx, idx_min, idx_max);//* 변경함 
//
//		JSONArray board_list = new JSONArray();
//		for (Board board : list) {
//			JSONObject obj = new JSONObject();
//			obj.put("content_idx", board.getBoardNum());
//			obj.put("content_subject", board.getBoardTitle());
//			obj.put("content_writer_name", board.getWriter());
//			obj.put("content_date", board.getBoardWriteDate());
//			board_list.add(obj);
//		}
//		root.put("board_list", board_list);
//
//		// 하단 페이징
//		int contentCount = boarddao.getContentCount(board_idx);
//		System.out.println(contentCount);
//		int page_cnt = contentCount / 10;
//		if (page_cnt % 10 > 0) {
//			page_cnt++;
//		}
//		if (page_cnt == 0) {
//			page_cnt++;
//		}
//
//		int page_min = ((page - 1) / 10) * 10 + 1;
//		int page_max = page_min + 9;
//
//		if (page_max > page_cnt) {
//			page_max = page_cnt;
//		}
//
//		JSONArray page_array = new JSONArray();
//		for (int i = page_min; i <= page_max; i++) {
//			page_array.add(i);
//		}
//
//		root.put("page_array", page_array);
//
//		// 이전버튼
//		int pre = page_min - 1;
//		if (pre < 1) {
//			pre = 1;
//		}
//
//		// 다음버튼
//		int next = page_max + 1;
//		if (next > page_cnt) {
//			next = page_cnt;
//		}
//		root.put("pre", pre);
//		root.put("next", next);
//
//		return root;
//	}

	// 게시판 별 TOP5
//	public JSONObject get_top5_list(int board_idx) {
//		JSONObject root = new JSONObject();
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//
//		// 해당 게시판 정보 가져오기
//		BoardType boardtype = boarddao.getBoardInfoByIdx(board_idx);
//		System.out.println(boardtype);
//		String board_name = boardtype.getBoardName();
//		root.put("board_info_name", board_name);
//
//		// 해당 게시판 컨텐츠 리스트 가져오기
//		List<Board> list = boarddao.getTop5List(board_idx);
//
//		JSONArray board_list = new JSONArray();
//		for (Board board : list) {
//			JSONObject obj = new JSONObject();
//			obj.put("content_idx", board.getBoardNum());
//			obj.put("content_subject", board.getBoardTitle());
//			obj.put("content_writer_name", board.getWriter());
//			obj.put("content_date", board.getBoardWriteDate());
//			board_list.add(obj);
//		}
//		root.put("board_list", board_list);
//
//		return root;
//	}
	
	//컨텐츠 추가
	public JSONObject add_content(Board content) {
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
		System.out.println(content);
		int result = boarddao.addContent(content);
		if(result >0) {
			root.put("result", true);
			root.put("content_idx", content.getBoardNum());
		}else {
			root.put("result", false);
		}
		return root;
	}
	
	// 컨텐츠 가져오기(Read)
//	public JSONObject get_content(int contentIdx) {
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//		Board board = boarddao.getContent(contentIdx);
//		JSONObject root = new JSONObject();
//		root.put("content_idx", contentIdx);
//		root.put("content_subject", board.getBoardTitle());
//		root.put("content_text", board.getBoardContent());
//		root.put("content_file", board.getBoardFileName());
//		//root.put("content_writer_idx", board.getContent_writer_idx()); 우리 디비 테이블에 없음 
//		root.put("content_writer_name", board.getWriter());
//		root.put("content_date", board.getBoardWriteDate());
//		return root;
//	}
//	
	//컨텐츠 수정
//	public JSONObject modify_content(Board board) {
//		JSONObject root = new JSONObject();
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
////		CommonsMultipartFile file = content.getFile(); // 파일 가져오기
////		String filename =file.getOriginalFilename();
////		String path = context.getRealPath("/upload");
////
////		String fpath = path + "\\" + filename; // 문자로 인식
////		System.out.println("path입니당: " + fpath);
////		if (!filename.equals("") || filename!=null) { // 실제 파일 업로드
////			FileOutputStream fs = null;
////			try {
////				fs = new FileOutputStream(fpath);
////				fs.write(file.getBytes());
////				fs.close();
////			} catch (Exception e) {
////				System.out.println("filewrite : " + e.getMessage());
////			}
////		}
////		content.setContent_file(filename);
//		int result=0;
//		if(board.getBoardFileName() != null || board.getBoardFileName()=="") { //이미 파일이 있으면
//			result = boarddao.modifyContentFile(board);
//		}else {
//			result = boarddao.modifyContent(board);
//		}
//		if(result >0) {
//			root.put("result", true);
//		}else {
//			root.put("result", false);
//		}
//		return root;
//	}
//	
//	// 컨텐츠 삭제하기
//	public JSONObject delete_content(int contentIdx) {
//		BoardDao boarddao = sqlsession.getMapper(BoardDao.class);
//		JSONObject root = new JSONObject();
//		int result=boarddao.deleteContent(contentIdx);
//		if(result >0) {
//			root.put("result", true);
//		}else {
//			root.put("result", false);
//		}
//		return root;
//	}
}
