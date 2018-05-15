package com.jbm.mmp.dao;

import org.apache.ibatis.session.SqlSession;
import com.jbm.mmp.vo.Mania;

public class ManiasDAOImpl implements ManiasDAO {

  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public int insert(Mania mania) {
    // TODO Auto-generated method stub
    return session.insert("manias.insert", mania);
  }
  
  @Override
  public Mania selectLogin(Mania mania) {
    // TODO Auto-generated method stub
    return session.selectOne("manias.selectLogin", mania);
  }
  
  @Override
  public Mania selectOne(int no) {
    // TODO Auto-generated method stub
    return session.selectOne("manias.selectOne", no);
  }
  
  @Override
  public Mania selectById(String id) {
    // TODO Auto-generated method stub
    return session.selectOne("manias.selectById", id);
  }
}
