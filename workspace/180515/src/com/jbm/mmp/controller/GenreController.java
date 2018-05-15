package com.jbm.mmp.controller;


import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jbm.mmp.service.GenresService;
import com.jbm.mmp.util.WordCheckUtil;
import com.jbm.mmp.vo.Genre;
import com.jbm.mmp.vo.Mania;

@Controller
public class GenreController {

	// 필요한 서비스 의존성
	private GenresService genresService;

	// 의존성 주입용 setter
	public void setGenresService(GenresService genresService) {
		this.genresService = genresService;
	}

	

}
