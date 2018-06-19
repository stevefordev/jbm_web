package handler;

import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import controller.WSController;

public class WebSocketHandler extends TextWebSocketHandler {

  private WSController controller;

  public void setController(WSController controller) {
    this.controller = controller;
  }

  // 닫혔음
  @Override
  public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
    // TODO Auto-generated method stub
    super.afterConnectionClosed(session, status);
    System.out.println("닫혔음!!");
    controller.remove(session);
  }

  // 연결됨(handShaking)
  @Override
  public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    // TODO Auto-generated method stub
    super.afterConnectionEstablished(session);
    System.out.println("연결됨!!");
    controller.add(session);
    // WebSocketSession 에 id 가 있음
    // ip 도 있음

  }

  // 메시지 처리
  @Override
  protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    // TODO Auto-generated method stub
    super.handleTextMessage(session, message);
    System.out.println("메시지:" + message.getPayload());
    controller.handleMsg(session, message.getPayload());
  }

}
