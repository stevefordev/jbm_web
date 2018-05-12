package org.jbm.ims.controller;

import java.util.ArrayList;
import java.util.List;
import org.jbm.ims.service.GroupsService;
import org.jbm.ims.vo.Group;
import org.jbm.ims.vo.Idol;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GroupController {

  private GroupsService groupsService;

  public void setGroupsService(GroupsService groupsService) {
    this.groupsService = groupsService;
  }

  @RequestMapping(value = "/group/{no}", method = RequestMethod.GET)
  public String asdfasdfa(Model model, @PathVariable int no) {

    model.addAllAttributes(groupsService.getGroup(no));

    // Map<String, Object> map = groupsService.getGroup(no);
    // Group group = (Group)map.get("group");
    // List<Idol> list = (List<Idol>)map.get("list");
    // model.addAttribute("group",group);
    // model.addAttribute("list",list);

    return "detailGroup";
  }

  @RequestMapping(value = "/group/register", method = RequestMethod.GET)
  public String dfgasdfsadfsadf() {

    return "groupForm";
  }

  @RequestMapping(value = "/group", method = RequestMethod.POST)
  public String fgasdfsadfsadf(Group group) {

    groupsService.register(group);

    return "redirect:/group";
  }

  @RequestMapping(value = "/group/{no}/update", method = RequestMethod.GET)
  public String updateForm(@PathVariable int no, Model model) {

    model.addAllAttributes(groupsService.getGroup(no));

    return "groupForm";
  }

  @RequestMapping(value = "/group", method = RequestMethod.PUT)
  public String update(Group group) {

    groupsService.update(group);
    
    return "redirect:/group/";
  }


  // 넌뷰는 무조건 다 redirect
  // redirectView는 redirect:/index.ims


  /*
   * 포워드일때는 Model에 저장
   * 
   * 리다이렉트일때는 쎄쎤에 저장후 한번쓰고 다시 쎄션에서 removeAttribute() --> 이를 편리하게 하기 위해서 SpringMVC에서는
   * RedirectAttributes 가 있습니다.
   */
  @RequestMapping(value = "/group/{no}", method = RequestMethod.DELETE)
  public String deleteGroup(@PathVariable int no, RedirectAttributes ra) {

    boolean result = groupsService.remove(no);

    if (!result) {

      // session에 저장되지만
      // 한번쓰고 사라짐
      ra.addFlashAttribute("isError", true);
      return "redirect:/group/" + no;
    } else {
      return "redirect:/group";

    } // if end
  }

  @RequestMapping(value = "/group", method = RequestMethod.GET)
  public String groupList(Model model) {

    model.addAttribute("list", groupsService.getList());

    return "groupList";
  }

}
