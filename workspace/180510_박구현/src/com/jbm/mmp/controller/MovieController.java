package com.jbm.mmp.controller;

import java.io.File;
import java.util.Iterator;
import java.util.UUID;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import com.jbm.mmp.service.GenresService;
import com.jbm.mmp.service.MoviesService;
import com.jbm.mmp.util.ResizeImageUtil;
import com.jbm.mmp.vo.Mania;
import com.jbm.mmp.vo.Movie;

@Controller
public class MovieController {

  private MoviesService moviesService;
  private GenresService genresService;

  public void setMoviesService(MoviesService moviesService) {
    this.moviesService = moviesService;
  }

  public void setGenresService(GenresService genresService) {
    this.genresService = genresService;
  }

  /**
   * 영화 리스트 페이지
   * 
   * @param page
   * @param model
   * @return
   */
  @RequestMapping(value = "/movie/page/{page}", method = RequestMethod.GET)
  public String movieList(@PathVariable int page, Model model) {

    model.addAllAttributes(moviesService.getMovieList(page));
    return "movieList";
  }

  /**
   * 영화 입력 폼 페이지
   * 
   * @return
   */
  @RequestMapping(value = "/movie/register", method = RequestMethod.GET)
  public String movieForm(Model model) {

    model.addAttribute("genres", genresService.getGenres());
    return "movieForm";
  }

  /**
   * 영화 디비 입력
   * 
   * @param movie
   * @param genre
   * @param upload
   * @param request
   * @param ra
   * @return
   */
  @RequestMapping(value = "/movie", method = RequestMethod.POST)
  public String register(@ModelAttribute Movie movie, @RequestParam(value = "genre") int[] genres,
      MultipartFile upload, HttpServletRequest request, RedirectAttributes ra) {

    String fileName = "default.png";

    if (upload != null) {
      fileName = upload.getOriginalFilename();
      System.out.println(fileName);
      // 톰캣의 img 폴더 경로
      ServletContext context = request.getServletContext();
      String path = context.getRealPath("");

      // upload 경로 (원본 저장)
      String uploadPath = path + File.separator + "upload" + File.separator;

      // poster 경로
      String profilePath = path + File.separator + "poster" + File.separator;

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

      ResizeImageUtil.resize(uploadPath + fileName, profilePath + fileName, 236, 340);

    }

    movie.setPoster(fileName);

    moviesService.register(movie, genres);

    return "redirect:/movie/" + movie.getNo();
  }

  /**
   * 영화 상세
   * 
   * @param no
   * @param model
   * @return
   */
  @RequestMapping(value = "/movie/{no}", method = RequestMethod.GET)
  public String detail(@PathVariable int no, Model model) {

    model.addAllAttributes(moviesService.getMovie(no));
    return "movieDetail";
  }

  /**
   * 영화 수정 폼
   * 
   * @param no
   * @return
   */
  @RequestMapping(value = "/movie/{no}/update", method = RequestMethod.GET)
  public String updateForm(@PathVariable int no, Model model, @RequestHeader String referer) {
    model.addAllAttributes(moviesService.getMovieForUpdate(no));    
    return "movieUpdateForm";
  }

  /**
   * 영화 디비 수정
   * 
   * @param movie
   * @param genres
   * @param model
   * @return
   */
  @RequestMapping(value = "/movie", method = RequestMethod.PUT)
  public String update(@ModelAttribute Movie movie, @RequestParam(value = "genre") int[] genres,
      Model model) {

    moviesService.modify(movie, genres);

    return "redirect:/movie/" + movie.getNo();
  }

  /**
   * 영화 삭제
   * 
   * @return
   */
  @RequestMapping(value = "/movie", method = RequestMethod.DELETE)
  public String delete(int no) {

    moviesService.remove(no);
    return "redirect:/movie/page/1";
  }

  /**
   * 수정 페이지에서 포스터 비동기 업로드
   * 
   * @param request
   * @return
   */
  @RequestMapping(value = "/ajax/poster", method = RequestMethod.POST)
  @ResponseBody
  public String poster(MultipartHttpServletRequest request) {
    Iterator<String> itr = request.getFileNames();
    String fileName = "";
    if (itr.hasNext()) {
      MultipartFile mpf = request.getFile(itr.next());
      System.out.println(mpf.getOriginalFilename() + " uploaded!");
      try {
        System.out.println("file length : " + mpf.getBytes().length);
        System.out.println("file name : " + mpf.getOriginalFilename());

        fileName = mpf.getOriginalFilename();
        System.out.println(fileName);
        // 톰캣의 img 폴더 경로
        ServletContext context = request.getServletContext();
        String path = context.getRealPath("");

        // upload 경로 (원본 저장)
        String uploadPath = path + File.separator + "upload" + File.separator;

        // poster 경로
        String profilePath = path + File.separator + "poster" + File.separator;

        // UUID 를 이용하여 이름을 랜덤하게
        UUID uuid = UUID.randomUUID();

        int dotIdx = fileName.lastIndexOf(".");

        fileName = fileName.substring(dotIdx, fileName.length());
        fileName = uuid + fileName;

        File file = new File(uploadPath + fileName);

        try {
          mpf.transferTo(file);
        } catch (Exception e) {
          e.printStackTrace();
        }

        ResizeImageUtil.resize(uploadPath + fileName, profilePath + fileName, 236, 340);

      } catch (Exception e) {
        e.printStackTrace();
      }
    }
    return "{ \"data\" : \"" + fileName + "\"}";
  }
}
