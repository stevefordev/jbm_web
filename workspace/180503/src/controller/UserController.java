package controller;

import java.util.List;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import service.UsersService;
import vo.User;

@Controller
public class UserController {

  private static final String LOGIN = "loginUser";
  private UsersService usersService;

  public void setUsersService(UsersService usersService) {
    this.usersService = usersService;
  }

  @RequestMapping("index.html")
  public String index(Model model, HttpSession session,
      @RequestParam(defaultValue = "1") int page) {


    if (session.getAttribute(this.LOGIN) != null) {
      model.addAllAttributes(usersService.getUserList(page));
    }
    return "index";
  }

  @RequestMapping(value = "/log.html", method = RequestMethod.POST)
  public String login(@ModelAttribute User user, HttpSession session, RedirectAttributes ra) {

    User loginUser = usersService.login(user);

    if (loginUser == null) {
      ra.addFlashAttribute("loginFail", true);
    } else {
      session.setAttribute(this.LOGIN, loginUser);
    }

    return "redirect:/index.html";
  }

  @RequestMapping(value = "/log.html", method = RequestMethod.GET)
  public String logout(HttpSession session) {
    session.invalidate();
    return "redirect:/index.html";
  }

  @RequestMapping("/members.html")
  public void members() {

  }

  @RequestMapping("/ajax/memberst.json")
  @ResponseBody
  public String sdfs() {
    System.out.println("ajax test");


    return "{'result' : true }";
  }

  @RequestMapping("/ajax/members.json")
  @ResponseBody
  public List<User> sdfss() {
    System.out.println("ajax test");
    return null;
  }
}
