package com.jbm.mmp.dao;

import com.jbm.mmp.vo.Mania;

public interface ManiasDAO {
  public int insert(Mania mania);
  
  public Mania selectLogin(Mania mania);
  
  public Mania selectOne(int no);
  
  public Mania selectById(String id);
}
