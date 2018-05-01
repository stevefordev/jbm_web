package org.jbm.ims.controller;

import java.util.List;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.jbm.ims.service.GroupsService;
import org.jbm.ims.service.IdolsService;
import org.jbm.ims.vo.Group;
import org.jbm.ims.vo.Idol;

@Controller
public class IdolsController {

  private IdolsService idolsService;

  public void setIdolsService(IdolsService idolsService) {
    this.idolsService = idolsService;
  }

  @RequestMapping("/insertIdol.ims")
  public String insertIdol() {


    return "idolForm";
  }

  @RequestMapping("/test.ims")
  public String test(Idol idol) {

    idolsService.register(idol);

    return "redirect:/idolList.ims";
  }

  /**
   * 
   * JSP (InternalResourceView) 에 출력할 데이터가 있으면(모델이 필요하면) 모델을 인자로 받음(스프링이 넣어줌)
   */
  @RequestMapping("/idolList.ims")
  public String idols(Model model) {

    List<Idol> list = idolsService.getIdols();

    // 모델에 'list' 라는 이름으로 list 레퍼런스를 attribute로 등록
    model.addAttribute("list", list);

    return "idolList";
  }

  @RequestMapping("/deleteIdol.ims")
  public String deleteGroup(int no) {

    boolean a = idolsService.remove(no);

    return "redirect:/idolList.ims";
  }
}
