package com.jbm.mmp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jbm.mmp.service.ManiasService;
import com.jbm.mmp.util.ResizeImageUtil;
import com.jbm.mmp.vo.Mania;

@Controller
public class ManiaController {

	private ManiasService maniasService;

	// 세션의 attribute 이름(loginMania)
	public static final String LOGIN = "loginMania";

	public void setManiasService(ManiasService maniasService) {
		this.maniasService = maniasService;
	}

	@RequestMapping(value = { "/", "/index" }, method = RequestMethod.GET)
	public String index() {

		return "index";
	}

	@RequestMapping(value = "/session", method = RequestMethod.POST)
	public String login(Mania mania, HttpSession session, RedirectAttributes ra) {

		Mania loginMania = maniasService.login(mania);

		if (loginMania == null) {
			ra.addFlashAttribute("msg", "아이디나 비밀번호가 틀렸습니다. 다시 로그인해주세요.");
			return "redirect:/index";
		} else {
			session.setAttribute(LOGIN, loginMania);
			return "redirect:/movie/page/1";
		} // if~else end

	}

	@RequestMapping(value = "/session", method = RequestMethod.DELETE)
	public String logout(HttpSession session) {

		session.invalidate();
		return "redirect:/index";
	}

	@RequestMapping(value = "/ajax/mania/{id}", method = RequestMethod.GET)
	@ResponseBody
	public Mania checkId(@PathVariable String id) {
		return maniasService.checkId(id);
	}

	@RequestMapping(value = "/mania/join", method = RequestMethod.GET)
	public String joinForm() {
		return "join";
	}

	@RequestMapping(value = "/mania", method = RequestMethod.POST)
	public String join(@ModelAttribute Mania mania, 
			           RedirectAttributes ra) {

		boolean flag = maniasService.join(mania);

		if (flag) {
			ra.addFlashAttribute("msg", "회원가입에 성공하였습니다. 로그인해주세요.");
			return "redirect:/index";
		} else {
			ra.addFlashAttribute("msg", "회원가입이 실패하였습니다. 다시 시도해주세요.");
			return "redirect:/mania/join";
		}

	}

}
