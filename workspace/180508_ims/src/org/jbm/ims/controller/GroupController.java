package org.jbm.ims.controller;



import java.util.ArrayList;
import java.util.List;
import org.jbm.ims.service.GroupsService;
import org.jbm.ims.vo.Group;
import org.jbm.ims.vo.Idol;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class GroupController {

  private GroupsService groupsService;

  public void setGroupsService(GroupsService groupsService) {
    this.groupsService = groupsService;
  }

  @RequestMapping("/groupDetail.ims")
  public String asdfasdfa(Model model, int no) {

    model.addAllAttributes(groupsService.getGroup(no));

    // Map<String, Object> map = groupsService.getGroup(no);
    // Group group = (Group)map.get("group");
    // List<Idol> list = (List<Idol>)map.get("list");
    // model.addAttribute("group",group);
    // model.addAttribute("list",list);

    return "detailGroup";
  }

  @RequestMapping(value = "/insertGroup.ims", method = RequestMethod.GET)
  public String dfgasdfsadfsadf() {

    return "groupForm";
  }

  @RequestMapping(value = "/insertGroup.ims", method = RequestMethod.POST)
  public String fgasdfsadfsadf(Group group) {

    groupsService.register(group);

    return "redirect:/groupList.ims";
  }


  // 넌뷰는 무조건 다 redirect
  // redirectView는 redirect:/index.ims


  /*
   * 포워드일때는 Model에 저장
   * 
   * 리다이렉트일때는 쎄쎤에 저장후 한번쓰고 다시 쎄션에서 removeAttribute() --> 이를 편리하게 하기 위해서 SpringMVC에서는
   * RedirectAttributes 가 있습니다.
   */
  @RequestMapping("/deleteGroup.ims")
  public String deleteGroup(int no, RedirectAttributes ra) {

    boolean result = groupsService.remove(no);

    if (!result) {

      // session에 저장되지만
      // 한번쓰고 사라짐
      ra.addFlashAttribute("isError", true);

    } // if end


    return "redirect:/groupList.ims";
  }

  @RequestMapping(value = "/group", method = RequestMethod.GET)
  public String groupList(Model model) {

    model.addAttribute("list", groupsService.getList());

    return "groupList";
  }

}
