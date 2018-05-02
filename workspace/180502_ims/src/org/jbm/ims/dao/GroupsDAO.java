package org.jbm.ims.dao;

import java.util.List;

import org.jbm.ims.vo.Group;


public interface GroupsDAO {
	
	public List<Group> selectList();
	
	public int delete(int no);
	
	public int insert(Group group);

}
