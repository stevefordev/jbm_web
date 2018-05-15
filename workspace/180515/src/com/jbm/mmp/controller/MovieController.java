package com.jbm.mmp.controller;


import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.jbm.mmp.service.GenresService;
import com.jbm.mmp.service.MoviesService;
import com.jbm.mmp.vo.Movie;

@Controller
public class MovieController {

  private Log log = LogFactory.getLog(MovieController.class);
  private GenresService genresService;

  public void setGenresService(GenresService genresService) {
    this.genresService = genresService;
  }

  private MoviesService moviesService;

  public void setMoviesService(MoviesService moviesService) {
    this.moviesService = moviesService;
  }

  @RequestMapping(value = "/index", method = RequestMethod.GET)
  public String index(Model model) {
    log.info("GET /index");
    log.debug("GET /index");
    log.error("GET /index");
    log.fatal("GET /index");

    model.addAllAttributes(moviesService.getMovies(1));

    return "index";
  }
  
  @RequestMapping(value="/movie/register", method=RequestMethod.GET)
  public String registerForm(Model model) {
   
    model.addAttribute("genres", genresService.getGenres());
    return "form";
  }
  
  @RequestMapping(value="/movie", method=RequestMethod.POST)
  public String register(@ModelAttribute Movie movie,@RequestParam(value="genre") int[] genres) {
    
    moviesService.register(movie, genres);
    return "redirect:/index";
  }

}
