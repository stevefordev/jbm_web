package org.jbm.ims.service;

import java.util.List;

import org.jbm.ims.vo.Group;


public interface GroupsService {
	
	public List<Group> getList();
	
	public boolean remove(int no);
	public boolean register(Group group);

}
