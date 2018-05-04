package service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
  public Map<String, Object> getUserList(int page) {
    // TODO Auto-generated method stub
    // TODO Auto-generated method stub

    // 한 페이지에 보여질 게시물 수
    int numPage = 2;

    // 한 페이지에 보여질 페이징 블록 갯수
    int numBlock = 3;

    Map<String, Object> pageRange = new HashMap<>();

    int end = page * numPage;
    int start = end - numPage + 1;

    pageRange.put("start", start);
    pageRange.put("end", end);

    // 아이돌 목록(list)

    List<User> list = usersDAO.selectList(pageRange);

    Map<String, Object> model = new HashMap<>();

    model.put("list", list);

    // 페이지네이션 처리
    int total = this.getTotal();
    String url = "/index.html";
    String param = "page=";

    String paginate = util.PaginateUtil.getPaginate(page, total, numPage, numBlock, url, param);
    model.put("paginate", paginate);
    return model;
  }
  
  @Override
  public int getTotal() {
    // TODO Auto-generated method stub
    return usersDAO.selectTotal();
  }
}
