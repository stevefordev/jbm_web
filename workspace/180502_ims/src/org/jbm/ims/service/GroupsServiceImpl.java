package org.jbm.ims.service;

import java.util.List;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import org.jbm.ims.dao.GroupsDAO;
import org.jbm.ims.dao.IdolsDAO;
import org.jbm.ims.vo.Group;
import org.jbm.ims.vo.Idol;
import org.springframework.stereotype.Service;


@Service
public class GroupsServiceImpl implements GroupsService {

  private GroupsDAO groupsDAO;
  private IdolsDAO idolsDAO;

  public void setGroupsDAO(GroupsDAO groupsDAO) {
    this.groupsDAO = groupsDAO;
  }

  public void setIdolsDAO(IdolsDAO idolsDAO) {
    this.idolsDAO = idolsDAO;
  }

  @Override
  public List<Group> getList() {
    return groupsDAO.selectList();
  }

  @Override
  public boolean remove(int no) {

    try {
      return 1 == groupsDAO.delete(no);
    } catch (Exception e) {
      return false;
    }

  }

  @Override
  public boolean register(Group group) {
    return 1 == groupsDAO.insert(group);
  }

  @Override
  public Map<String, Object> getGroup(int no) {
    // TODO Auto-generated method stub
    Map<String, Object> map = new ConcurrentHashMap();
    Group group = groupsDAO.selectOne(no);
    List<Idol> list = idolsDAO.selectList(no);

    map.put("group", group);
    map.put("list", list);
    return map;
  }

}
