package org.jbm.ims.controller;


import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.jbm.ims.service.GroupsService;
import org.jbm.ims.service.IdolsService;
import org.jbm.ims.util.ResizeImageUtil;
import org.jbm.ims.vo.Idol;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

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
  @RequestMapping(value = "/idol/register", method = RequestMethod.GET)
  public String insertIdol(Model model) {

    model.addAttribute("groups", groupsService.getList());

    return "idolForm";
  }

  @RequestMapping(value = "/idol/{idolNo}", method = RequestMethod.GET)
  public String sdafasdfasdf(@PathVariable int idolNo, Model model, @RequestHeader String referer) {

    System.out.println(referer);

    model.addAttribute("idol", idolsService.getIdol(idolNo));
    model.addAttribute("referer", referer);
    return "idolDetail";
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
  @RequestMapping(value = "/idol", method = RequestMethod.POST)
  public String test(@ModelAttribute Idol idol, BindingResult result, MultipartFile upload,
      HttpServletRequest request) {

    // 톰캣의 img 폴더 경로
    ServletContext context = request.getServletContext();
    String path = context.getRealPath("img");

    // upload 경로 (원본 저장)
    String uploadPath = path + File.separator + "upload" + File.separator;

    // profile 경로 (프로필 160 * 160)
    String profilePath = path + File.separator + "profile" + File.separator;

    // UUID 를 이용하여 이름을 랜덤하게
    UUID uuid = UUID.randomUUID();

    String fileName = upload.getOriginalFilename();

    int dotIdx = fileName.lastIndexOf(".");

    fileName = fileName.substring(dotIdx, fileName.length());
    fileName = uuid + fileName;

    File file = new File(uploadPath + fileName);

    try {
      upload.transferTo(file);
    } catch (Exception e) {
      e.printStackTrace();
    }

    ResizeImageUtil.resize(uploadPath + fileName, profilePath + fileName, 160);

    idol.setImage(fileName);
    idolsService.register(idol);

    return "redirect:/idol/" + idol.getNo();
  }

  @RequestMapping(value = "/idol/{no}", method = RequestMethod.DELETE)
  public String deleteIdol(@PathVariable int no, String referer, HttpServletRequest request) {

    idolsService.remove(no);

    return "redirect:" + referer;
  }

  @RequestMapping("/idol/page/{page}")
  public String idolList(@PathVariable int page, Model model) {

    model.addAllAttributes(idolsService.getIdols(page));

    return "idolList";
  }

}
