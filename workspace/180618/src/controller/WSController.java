package controller;

import java.awt.font.TextMeasurer;
import java.util.List;
import java.util.Vector;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import com.fasterxml.jackson.databind.ObjectMapper;
import vo.Protocol;

public class WSController {

  private List<WebSocketSession> sessions;
  private ObjectMapper mapper;

  //
  // public WSController() {
  // sessions = new Vector<>();
  // }
  //
  public void setSessions(List<WebSocketSession> sessions) {
    this.sessions = sessions;
  }

  public void setMapper(ObjectMapper mapper) {
    this.mapper = mapper;
  }

  // 새로운 유저가 나가면
  public void remove(WebSocketSession session) {
    // TODO Auto-generated method stub
    System.out.println("나감!!");
    sessions.remove(session);
  }

  // 새로운 유저가 들어오면
  public void add(WebSocketSession session) throws Exception {
    // TODO Auto-generated method stub
    System.out.println("id:" + session.getId());
    System.out.println("ip1:" + session.getRemoteAddress().getHostName());
    System.out.println("ip:" + session.getRemoteAddress().getAddress());
    System.out.println("들어옴!!");

    sessions.add(session);

    System.out.println("sessionSize:" + sessions.size());

    // 프로토콜 객체 생성
    Protocol protocol = new Protocol();
    protocol.setCode(1);
    protocol.setIp(session.getRemoteAddress().getAddress().getHostAddress());
    protocol.setId(session.getId());

    String json = mapper.writeValueAsString(protocol);
    session.sendMessage(new TextMessage(json.getBytes()));

  }

  public void handleMsg(WebSocketSession session, String msg) {
    // TODO Auto-generated method stub

    System.out.println("msg:" + msg);

    try {
      Protocol protocol = mapper.readValue(msg, Protocol.class);

      switch (protocol.getCode()) {
        case 2:
       // 동시 접속자 전부
          broadcast(msg);
          break;
        case 4:
       // 동시 접속자 전부
          broadcast(msg);
        default:
          break;
      }
    } catch (Exception e) {
      // TODO: handle exception
    }
    
  }

  private void broadcast(String msg) {
    for (WebSocketSession session : sessions) {
      try {
        session.sendMessage(new TextMessage(msg.getBytes()));
      } catch (Exception e) {
        // TODO: handle exception
      } // try ~ catch end
    } // for end
  }// broadcast end
}
