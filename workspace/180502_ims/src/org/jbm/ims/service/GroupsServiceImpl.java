package org.jbm.ims.service;

import java.util.List;

import org.jbm.ims.dao.GroupsDAO;
import org.jbm.ims.vo.Group;
import org.springframework.stereotype.Service;


@Service
public class GroupsServiceImpl
implements GroupsService {
	
	private GroupsDAO groupsDAO;
	
	public void setGroupsDAO(GroupsDAO groupsDAO) {
		this.groupsDAO = groupsDAO;
	}
	
	@Override
	public List<Group> getList() {
		return groupsDAO.selectList();
	}
	
	@Override
	public boolean remove(int no) {
		
		try {
			return 1==groupsDAO.delete(no);
		}catch(Exception e) {
			return false;
		}

	}
	
	@Override
	public boolean register(Group group) {
		return 1== groupsDAO.insert(group);
	}

}
