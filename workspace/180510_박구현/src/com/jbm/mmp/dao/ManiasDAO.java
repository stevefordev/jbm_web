package com.jbm.mmp.dao;

import com.jbm.mmp.vo.Mania;

public interface ManiasDAO {
  public int insert(Mania mania);
  
  public Mania selectOne(Mania mania);
}
