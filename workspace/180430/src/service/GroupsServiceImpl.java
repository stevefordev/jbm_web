package service;

import java.util.List;

import org.springframework.stereotype.Service;

import dao.GroupsDAO;
import vo.Group;

@Service
public class GroupsServiceImpl implements GroupsService {

	private GroupsDAO groupsDAO;

	public void setGroupsDAO(GroupsDAO groupsDAO) {
		this.groupsDAO = groupsDAO;
	}

	@Override
	public List<Group> getGroups() {
		// TODO Auto-generated method stub
		return groupsDAO.selectList();
	}
}
