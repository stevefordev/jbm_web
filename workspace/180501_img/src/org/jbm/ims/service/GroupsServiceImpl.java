package org.jbm.ims.service;

import java.util.List;
import org.springframework.stereotype.Service;
import org.jbm.ims.dao.GroupsDAO;
import org.jbm.ims.vo.Group;

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

  @Override
  public boolean remove(int no) {
    // TODO Auto-generated method stub
    return 1 == groupsDAO.delete(no);
  }
}
