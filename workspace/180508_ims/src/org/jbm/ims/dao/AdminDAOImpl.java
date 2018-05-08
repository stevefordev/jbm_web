package org.jbm.ims.dao;

import org.apache.ibatis.session.SqlSession;
import org.jbm.ims.vo.Admin;

public class AdminDAOImpl implements AdminDAO {

  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public Admin selectLogin(Admin admin) {
    // TODO Auto-generated method stub
    return session.selectOne("admins.selectLogin", admin);
  }

}
