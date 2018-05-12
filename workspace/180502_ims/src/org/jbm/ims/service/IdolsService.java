package org.jbm.ims.service;

import java.util.List;
import java.util.Map;

import org.jbm.ims.vo.Idol;

public interface IdolsService {
	
	public Map<String, Object> getIdols(int page);
	
	public boolean remove(int no);
	
	public boolean modify(Idol idol);
	
	public boolean register(Idol idol);
	
	public Idol getIdol(int no);
	
	

}
