package service;

import java.util.List;
import dao.UsersDAO;
import vo.User;

public class UsersServiceImpl implements UsersService {

  private UsersDAO usersDAO;

  public void setUsersDAO(UsersDAO usersDAO) {
    this.usersDAO = usersDAO;
  }
  
  @Override
  public User login(User user) {
    // TODO Auto-generated method stub
    return usersDAO.selectLogin(user);
  }
  
  @Override
  public List<User> getUserList() {
    // TODO Auto-generated method stub
    return usersDAO.selectList();
  }
}
