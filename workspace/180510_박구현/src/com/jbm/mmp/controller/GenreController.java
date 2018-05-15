package com.jbm.mmp.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jbm.mmp.service.GenresService;
import com.jbm.mmp.vo.Genre;

@Controller
public class GenreController {

  private GenresService genresService;

  public void setGenresService(GenresService genresService) {
    this.genresService = genresService;
  }

  /**
   * 장르 리스트 페이지
   * 
   * @param model
   * @return
   */
  @RequestMapping(value = "/genre", method = RequestMethod.GET)
  public String genre(Model model) {

    model.addAttribute("genres", genresService.getGenres());
    model.addAttribute("navGenreOn", true);
    return "genre";
  }

  /**
   * 장르 입력
   * 
   * @param genre
   * @param ra
   * @return
   */
  @RequestMapping(value = "/genre", method = RequestMethod.POST)
  public String register(Genre genre, RedirectAttributes ra) {

    // 먼저 디비에서 같은 이름으로 저장된 장르가 있는지 검사후
    // 이미 장르가 입력되었다면 alert 할수 있도록 조치
    if (genresService.getGenreByName(genre.getName()) == null) {
      genresService.register(genre);
    } else {
      ra.addFlashAttribute("isHaveGenre", true);
    }

    return "redirect:/genre";
  }

  /**
   * 장르 삭제
   * 
   * @param no
   * @param ra
   * @return
   */
  @RequestMapping(value = "/genre", method = RequestMethod.DELETE)
  public String delete(int no, RedirectAttributes ra) {

    // movieCount 가 0 인것만 지우기를 시도 하고
    // 삭제가 안된경우는 alert 할 수 있도록 조치
    if (!genresService.remove(no)) {
      ra.addFlashAttribute("genreHasMovie", true);
    }

    return "redirect:/genre";
  }
}
