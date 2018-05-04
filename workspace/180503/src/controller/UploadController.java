package controller;

import java.io.File;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UploadController {

  @RequestMapping(value = "/upload.html", method = RequestMethod.GET)
  public void uploadForm() {

  }

  @RequestMapping(value = "/upload.html", method = RequestMethod.POST)
  public String upload(MultipartFile image, RedirectAttributes ra, HttpServletRequest request) {

    // 실제 톰캣의 경로
    ServletContext context = request.getServletContext();
    String root = context.getRealPath("/");
    String profilePath = root + "profile" + File.separator;

    String fileName = image.getOriginalFilename();

    // 새로운 파일 객체
    File file = new File(profilePath + fileName);

    try {
      image.transferTo(file);
    } catch (Exception e) {
      e.printStackTrace();
    }
    
    ra.addFlashAttribute("src", fileName);
    
    return "redirect:/upload.html";
  }
}
