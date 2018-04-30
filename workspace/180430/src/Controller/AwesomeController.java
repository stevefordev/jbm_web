package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class AwesomeController {

	@RequestMapping("/index.html")
	public String index() {
		System.out.println("index");
		return "index";
	}

	@RequestMapping("/test.html")
	public String test() {
		System.out.println("test");
		return "test";
	}
}
