package kr.coo.onehari.sign.websocket;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Configuration
public class SignWebSocketHandler extends TextWebSocketHandler{

	//접속된 user를 담기위해 id, websocketsession 저장
	private static Map<String, WebSocketSession> loginUsers = new HashMap<String, WebSocketSession>();
	
	private void log(String msg) {
		SimpleDateFormat simple = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String date = simple.format(new Date());
		log.info(date + " : " + msg);
		System.out.println(date + " : " + msg);
	}
	
	//연결
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		log(session.getPrincipal().getName() + " 접속");
		loginUsers.put(session.getPrincipal().getName(), session); //userid 와 session 저장
	}
	
	//연결해제
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		if(session.getPrincipal() != null) {
			if(loginUsers.containsKey(session.getPrincipal().getName())) {
				loginUsers.remove(session.getPrincipal().getName()); //연결해제된 id 삭제
				log(session.getPrincipal().getName() + " 해제");
			}
		}
	}
	
	//데이터 전송
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		String draftEmp = message.getPayload().split(",")[0];
		String empSign = message.getPayload().split(",")[1];
		String signCode = message.getPayload().split(",")[2];
				
		if(loginUsers.containsKey(empSign)) {
			TextMessage msg = null;
			if(signCode.equals("1") || signCode.equals("2")) {
				msg = new TextMessage("결재할 문서가 도착했습니다.");
			}			
			loginUsers.get(empSign).sendMessage(msg);
			log("기안자 : "+draftEmp + " / 결재자 : " + empSign);
		}
		
		if(loginUsers.containsKey(draftEmp)) {
			TextMessage msg = null;
			if(signCode.equals("2")) {
				msg = new TextMessage("기안하신 문서가 1차결재되었습니다.");
				
			}else if(signCode.equals("3")) {
				msg = new TextMessage("기안하신 문서가 승인되었습니다.");
				
			}else if(signCode.equals("4")) {
				msg = new TextMessage("기안하신 문서가 반려되었습니다.");
			}
			
			loginUsers.get(draftEmp).sendMessage(msg);
			//log("기안자 : "+draftEmp + " / 결재자 : " + empSign1);
		}
		
		
	}
	
	//연결에 문제 발생시
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception{
		log(session.getPrincipal().getName() + " / " + exception.getMessage());
	}
}
