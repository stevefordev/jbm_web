package controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.View;
import org.springframework.web.servlet.view.InternalResourceView;

@Controller
public class HelloController {

	@RequestMapping("/end.jbm")
	public void end() {
		System.out.println("end");		
	}
	
	@RequestMapping("/hello.jbm")
	public void aa() {
		System.out.println("aa");		
	}
	/*
	@RequestMapping("/hello.jbm")
	public String aa() {
		System.out.println("aa");
		return "hello";
	}
	*/

	@RequestMapping("/hellos.jbm")
	public String a() {
		System.out.println("aa");
		return "/WEB-INF/view/hello.jsp";
	}

	@RequestMapping("/login.jbm")
	public ModelAndView b() {
		System.out.println("aa");

		return new ModelAndView("/WEB-INF/view/hello.jsp");
	}

	@RequestMapping("/logout.jbm")
	public View c() {
		System.out.println("aa");
		View view = new InternalResourceView("/WEB-INF/view/hello.jsp");
		return view;
	}
}
