package org.jbm.ims.dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import org.jbm.ims.vo.Group;
import org.springframework.stereotype.Repository;



@Repository
public class GroupsDAOImpl implements GroupsDAO {

  private SqlSession session;

  public void setSession(SqlSession session) {
    this.session = session;
  }

  @Override
  public List<Group> selectList() {
    return session.selectList("groups.selectList");
  }

  @Override
  public int delete(int no) {
    return session.delete("groups.delete", no);
  }

  @Override
  public int insert(Group group) {
    return session.insert("groups.insert", group);
  }

  @Override
  public Group selectOne(int no) {
    // TODO Auto-generated method stub
    return session.selectOne("groups.selectOne", no);
  }
}
