package org.jbm.ims.service;

import java.util.List;
import java.util.Map;
import org.jbm.ims.vo.Group;


public interface GroupsService {

  public List<Group> getList();

  public  Map<String, Object> getGroup(int no);

  public boolean remove(int no);

  public boolean register(Group group);

}
