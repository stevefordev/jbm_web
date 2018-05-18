package com.jbm.mmp.controller;

import java.io.File;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jbm.mmp.service.ManiasService;
import com.jbm.mmp.util.ResizeImageUtil;
import com.jbm.mmp.vo.Mania;

@Controller
public class ManiaController {

  private ManiasService maniasService;

  public void setManiasService(ManiasService maniasService) {
    this.maniasService = maniasService;
  }

  /**
   * index 페이지
   * 
   * @return
   */
  @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
  public String index() {
    return "index";
  }

  /**
   * 회원 가입 폼
   * 
   * @return
   */
  @RequestMapping(value = {"/mania/join"}, method = RequestMethod.GET)
  public String join() {
    return "join";
  }

  /**
   * 회원 가입 디비 입력
   * 
   * @return
   */
  @RequestMapping(value = {"/mania"}, method = RequestMethod.POST)
  public String register(@ModelAttribute Mania mania, MultipartFile upload,
      HttpServletRequest request, RedirectAttributes ra) {
    String fileName = "default.png";

    if (upload != null) {
      fileName = upload.getOriginalFilename();
      System.out.println(fileName);
      // 톰캣의 img 폴더 경로
      ServletContext context = request.getServletContext();
      String path = context.getRealPath("");

      // upload 경로 (원본 저장)
      String uploadPath = path + File.separator + "upload" + File.separator;

      // profile 경로 (프로필 100 * 100)
      String profilePath = path + File.separator + "profile" + File.separator;

      // UUID 를 이용하여 이름을 랜덤하게
      UUID uuid = UUID.randomUUID();

      int dotIdx = fileName.lastIndexOf(".");

      fileName = fileName.substring(dotIdx, fileName.length());
      fileName = uuid + fileName;

      File file = new File(uploadPath + fileName);

      try {
        upload.transferTo(file);
      } catch (Exception e) {
        e.printStackTrace();
      }

      ResizeImageUtil.resize(uploadPath + fileName, profilePath + fileName, 100);

    }

    mania.setProfile(fileName);

    maniasService.register(mania);


    ra.addFlashAttribute("joinSucc", true);

    return "redirect:/index";
  }

  /**
   * 
   * 
   * @param mania
   * @param session
   * @param ra
   * @return
   */
  @RequestMapping(value = {"/session"}, method = RequestMethod.POST)
  public String login(@ModelAttribute Mania mania, HttpSession session, RedirectAttributes ra) {
    System.out.println("session post");

    Mania loginUser = maniasService.login(mania);

    if (loginUser == null) {
      ra.addFlashAttribute("loginFail", true);
      return "redirect:/index";
    } else {
      session.setAttribute("loginUser", loginUser);
      return "redirect:/movie/page/1";
    }
  }

  @RequestMapping(value = {"/session"}, method = RequestMethod.DELETE)
  public String logout(HttpSession session) {
    System.out.println("session delete");
    session.invalidate();
    return "redirect:/index";
  }

}
