package org.jbm.ims.controller;

import javax.servlet.http.HttpSession;
import org.jbm.ims.service.AdminsService;
import org.jbm.ims.vo.Admin;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class AdminController {

  public static final String LOGIN = "loginAdmin";

  private AdminsService adminService;

  public void setAdminService(AdminsService adminService) {
    this.adminService = adminService;
  }

  @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
  public String index() {
    System.out.println("index");
    return "index";
  }

  @RequestMapping(value = {"/session"}, method = RequestMethod.POST)
  public String login(@ModelAttribute Admin admin, HttpSession session, RedirectAttributes ra) {
    System.out.println("session post");

    System.out.println(admin.getId());
    System.out.println(admin.getPassword());
    Admin loginUser = adminService.login(admin);

    if (loginUser == null) {
      ra.addFlashAttribute("loginFail", true);
    } else {
      session.setAttribute(this.LOGIN, loginUser);
    }

    return "redirect:/";
  }

  @RequestMapping(value = {"/session"}, method = RequestMethod.DELETE)
  public String logout(HttpSession session) {
    System.out.println("session delete");
    session.invalidate();
    return "redirect:/";
  }
}
