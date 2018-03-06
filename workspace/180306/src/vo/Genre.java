package vo;

import util.FieldUtil;

public class Genre {
  private int no;
  private String name;
  
  public Genre() {
    super();
  }

  public int getNo() {
    return no;
  }

  public void setNo(int no) {
    this.no = no;
  }

  public String getName() {
    return name;
  }

  public void setName(String name) {
    this.name = name;
  }
  
  @Override
  public String toString() {    
    return FieldUtil.getAllFields(this).toString();
  }  
}
