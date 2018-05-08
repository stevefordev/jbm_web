package org.jbm.ims.service;

import org.jbm.ims.dao.AdminDAO;
import org.jbm.ims.vo.Admin;

public class AdminsServiceImpl implements AdminsService {

  private AdminDAO adminDAO;

  public void setAdminDAO(AdminDAO adminDAO) {
    this.adminDAO = adminDAO;
  }

  @Override
  public Admin login(Admin admin) {
    // TODO Auto-generated method stub
    return adminDAO.selectLogin(admin);
  }
}
