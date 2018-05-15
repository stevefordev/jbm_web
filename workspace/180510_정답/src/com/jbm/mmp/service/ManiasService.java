package com.jbm.mmp.service;

import com.jbm.mmp.vo.Mania;

public interface ManiasService {
	
	public boolean join(Mania mania);
	
	public Mania checkId(String id);
	
	public Mania login(Mania mania);

}
