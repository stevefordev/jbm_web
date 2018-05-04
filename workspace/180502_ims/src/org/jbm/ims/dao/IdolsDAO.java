package org.jbm.ims.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.jbm.ims.vo.Idol;


public interface IdolsDAO {

  public int selectTotal();

  public List<Idol> selectList(Map<String, Object> pageRange);

  public List<Idol> selectList(int groupNo);

  public int delete(int no);

  public int update(Idol idol);

  public int insert(Idol idol);

  public Idol selectOne(int no);
}
