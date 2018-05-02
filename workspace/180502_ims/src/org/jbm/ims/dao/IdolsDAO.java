package org.jbm.ims.dao;

import java.util.List;

import org.jbm.ims.vo.Idol;


public interface IdolsDAO {
	
	public List<Idol> selectList();
	
	public int delete(int no);
	
	public int update(Idol idol);
	
	public int insert(Idol idol);
	
	public Idol selectOne(int no);

}
