package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ExamController {

  @RequestMapping(value = {"/", "/index"}, method = RequestMethod.GET)
  public String index() {
    System.out.println("index");
    return "index";
  }

  @RequestMapping(value = "/grandprix", method = RequestMethod.GET)
  public String get() {
    System.out.println("get");
    return "grandprixList";
  }

  @RequestMapping(value = "/grandprix", method = RequestMethod.POST)
  public String post() {
    System.out.println("POST");
    return "redirect:/grandprix";
  }

  @RequestMapping(value = "/grandprix", method = RequestMethod.PUT)
  public String put() {
    System.out.println("PUT");
    return "redirect:/grandprix";
  }

  @RequestMapping(value = "/grandprix", method = RequestMethod.DELETE)
  public String delete() {
    System.out.println("DELETE");
    return "redirect:/grandprix";
  }
}
