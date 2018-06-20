package util;

import com.fasterxml.jackson.databind.ObjectMapper;
import vo.Protocol;

public class JsonParseTest {
  public void ddd() {

    ObjectMapper om = new ObjectMapper();

    try {
      Protocol protocol = om.readValue("", Protocol.class);
      System.out.println(protocol.toString());
    } catch (Exception e) {
      // TODO: handle exception
    }
  }
}
