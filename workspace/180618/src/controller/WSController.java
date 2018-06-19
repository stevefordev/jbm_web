package controller;

import java.awt.font.TextMeasurer;
import java.util.List;
import java.util.Vector;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;

public class WSController {

  private List<WebSocketSession> sessions;

  //
  // public WSController() {
  // sessions = new Vector<>();
  // }
  //
  public void setSessions(List<WebSocketSession> sessions) {
    this.sessions = sessions;
  }

  // 새로운 유저가 나가면
  public void remove(WebSocketSession session) {
    // TODO Auto-generated method stub
    System.out.println("나감!!");
    sessions.remove(session);
  }

  // 새로운 유저가 들어오면
  public void add(WebSocketSession session) {
    // TODO Auto-generated method stub
    System.out.println("id:" + session.getId());
    System.out.println("ip1:" + session.getRemoteAddress().getHostName());
    System.out.println("ip:" + session.getRemoteAddress().getAddress());
    System.out.println("들어옴!!");

    sessions.add(session);

    System.out.println("sessionSize:" + sessions.size());

  }

  public void handleMsg(WebSocketSession session, String msg) {
    // TODO Auto-generated method stub

    // 동시 접속자 전부
    broadcast(msg);
  }

  private void broadcast(String msg) {
    for (WebSocketSession session : sessions) {
      try {
        session.sendMessage(new TextMessage(msg.getBytes()));
      } catch (Exception e) {
        // TODO: handle exception
      }//try ~ catch end
    }//for end
  }//broadcast end
}
