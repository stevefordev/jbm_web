package handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import controller.WSController;

public class WebSocketHandler 
extends TextWebSocketHandler{
	
	private WSController controller;
	
	public void setController(WSController controller) {
		this.controller = controller;
	}
	
	//연결됨(handShaking)
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		controller.add(session);
	}
	
	//닫혔음
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		controller.remove(session);
	}
	
	//메세지 처리
	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		controller.handleMsg(session,message.getPayload());
	}

}
