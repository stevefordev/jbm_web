package com.jbm.mmp.service;

import com.jbm.mmp.dao.ManiasDAO;
import com.jbm.mmp.vo.Mania;

public class ManiasServiceImpl implements ManiasService {

  private ManiasDAO maniasDAO;

  public void setManiasDAO(ManiasDAO maniasDAO) {
    this.maniasDAO = maniasDAO;
  }

  @Override
  public boolean register(Mania mania) {
    // TODO Auto-generated method stub
    return 1 == maniasDAO.insert(mania);
  }
  
  @Override
  public Mania login(Mania mania) {
    // TODO Auto-generated method stub
    return maniasDAO.selectLogin(mania);
  }
 
  @Override
  public Mania getUser(int no) {
    // TODO Auto-generated method stub
    return maniasDAO.selectOne(no);
  }
  
  @Override
  public Mania getUserById(String id) {
    // TODO Auto-generated method stub
    return maniasDAO.selectById(id);
  }
}
