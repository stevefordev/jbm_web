package com.jbm.mmp.controller;

import java.net.URL;

import javax.servlet.http.HttpSession;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;
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

	// genre.jsp 페이지
	@RequestMapping(value = "/genre", method = RequestMethod.GET)
	public String genre(Model model) {

		model.addAttribute("genres", genresService.getGenres());

		return "genre";
	}

	// 장르 삭제
	@RequestMapping(value = "/genre", method = RequestMethod.DELETE)
	public String delete(int no, RedirectAttributes ra) {

		try {
			genresService.remove(no);
		} catch (Exception e) {
			e.printStackTrace();
			ra.addFlashAttribute("msg", "해당 장르에 대한 영화가 있어서 삭제가 불가능합니다.");
		}

		return "redirect:/genre";
	}

	// 장르 입력
	@RequestMapping(value = "/genre", method = RequestMethod.POST)
	public String insert(Genre genre, HttpSession session, RedirectAttributes ra) {

		// 세션에서 로그인된 정보 얻기
		Mania loginMania = (Mania) session.getAttribute("loginMania");

		// System.out.println("POST /genre:"+genre.getName());
		
		//장르명 얻기
		String word = genre.getName().trim();
		
		genre.setName(word);

		//우리말샘 API를 활용하여 실제 존재하는 단어인지
		//확인함(WordCheckUtil)
		if (WordCheckUtil.checkWord(word)) {
			
			//단어가 맞다면 장르 등록
			genre.setManiaNo(loginMania.getNo());

			boolean result = genresService.register(genre);

			//기존의 장르가 있다면 
			if (!result) {
				ra.addFlashAttribute("msg", genre.getName() + "은 존재합니다.");
			}
			
		} else {
			ra.addFlashAttribute("msg", genre.getName() + "은 단어가 아닙니다.");
		}

		return "redirect:/genre";
	}

}
