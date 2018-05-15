package com.jbm.mmp.service;

import com.jbm.mmp.vo.Mania;

public interface ManiasService {

  public boolean register(Mania mania);
  
  public Mania login(Mania mania);
  
  public Mania getUser(int no);
  
  public Mania getUserById(String id);
}
