package org.jbm.ims.controller;


import org.jbm.ims.service.GroupsService;
import org.jbm.ims.service.IdolsService;
import org.jbm.ims.vo.Idol;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class IdolController {

  private IdolsService idolsService;

  public void setIdolsService(IdolsService idolsService) {
    this.idolsService = idolsService;
  }

  private GroupsService groupsService;

  public void setGroupsService(GroupsService groupsService) {
    this.groupsService = groupsService;
  }

  @RequestMapping(value = "/updateIdol.ims", method = RequestMethod.GET)
  public String xxxsdfadfa(Model model, int no) {

    // 수정폼은 idol이 필요함
    model.addAttribute("idol", idolsService.getIdol(no));
    model.addAttribute("groups", groupsService.getList());

    return "idolForm";
  }

  @RequestMapping(value = "/updateIdol.ims", method = RequestMethod.POST)
  public String sdfsdafasf(Idol idol) {

    idolsService.modify(idol);

    return "redirect:/idolDetail.ims?no=" + idol.getNo();
  }

  // idolForm.jsp로 이동(GET)
  @RequestMapping(value = "/insertIdol.ims", method = RequestMethod.GET)
  public String insertIdol(Model model) {

    model.addAttribute("groups", groupsService.getList());

    return "idolForm";
  }

  @RequestMapping("/idolDetail.ims")
  public void sdafasdfasdf(int no, Model model) {

    model.addAttribute("idol", idolsService.getIdol(no));

  }



  /*
   * 메서드에 인자로 VO를 넣으면 ModelAttribute라고 합니다.
   * 
   * 기본은 넘어온 파라미터명과 VO의 멤버필드의 이름이 같으면 멤버필드에 값을 입력합니다.
   * 
   * 만약 넘어온 파라미터와 멤버필드의 자료형이 맞지 않은 경우 400 bad request 에러가 떨어지게 됩니다.
   * 
   * VO와 파라미터 맵핑이 어디가 잘못되었는지 확인하고 싶으면 BindingResult객체를 받아서 확인할 수 있습니다. (400 에러 발생안함)
   * 
   */

  // POST방식
  @RequestMapping(value = "/insertIdol.ims", method = RequestMethod.POST)
  public String test(@ModelAttribute Idol idol, BindingResult result) {

    // System.out.println("이름 : "+idol.getName());
    // System.out.println("키 : "+idol.getHeight());
    // System.out.println("몸무게 : "+idol.getWeight());
    // System.out.println("생년월일 : " +idol.getBirthDate());
    // System.out.println("그룹번호 : " +idol.getGroupNo());

    idolsService.register(idol);

    // int count = result.getErrorCount();
    //
    // System.out.println("에러 갯수 : " + count);
    //
    // List<FieldError> errorList =
    // result.getFieldErrors();
    //
    // for(FieldError error : errorList) {
    // System.out.println("파라미터명 : "+error.getField());
    // System.out.println(error.getCode());
    // }

    // System.out.println("이름 : "+idol.getName());
    // System.out.println("키 : "+idol.getHeight());
    // System.out.println("몸무게 : "+idol.getWeight());

    return "redirect:/idolList.ims";
  }

  @RequestMapping(value = "/deleteIdol.ims", method = RequestMethod.GET)
  public String sdfasf() {

    return "redirect:http://jr.naver.com";
  }

  @RequestMapping(value = "/deleteIdol.ims", method = RequestMethod.POST)
  public String deleteIdol(int no) {

    idolsService.remove(no);

    return "redirect:/idolList.ims";
  }

  @RequestMapping("/idol/page/{page}")
  public String idolList(@PathVariable int page, Model model) {

    model.addAllAttributes(idolsService.getIdols(page));

    return "idolList";
  }

}
