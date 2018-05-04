package org.jbm.ims.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import org.jbm.ims.vo.Idol;
import oracle.net.aso.i;


public class IdolsDAOImpl implements IdolsDAO {

  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public List<Idol> selectList(Map<String, Object> pageRange) {

    return session.selectList("idols.selectList", pageRange);
  }

  @Override
  public int delete(int no) {
    return session.delete("idols.delete", no);
  }

  @Override
  public int insert(Idol idol) {
    return session.insert("idols.insert", idol);
  }

  @Override
  public Idol selectOne(int no) {
    return session.selectOne("idols.selectOne", no);
  }

  @Override
  public int update(Idol idol) {
    return session.update("idols.update", idol);
  }

  @Override
  public List<Idol> selectList(int groupNo) {
    // TODO Auto-generated method stub
    return session.selectList("idols.selectListByGroupNo", groupNo);
  }

  @Override
  public int selectTotal() {
    // TODO Auto-generated method stub
    return session.selectOne("idols.selectTotal");
  }

}
