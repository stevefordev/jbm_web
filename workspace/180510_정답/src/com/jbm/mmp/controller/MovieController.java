package com.jbm.mmp.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.jbm.mmp.service.GenresService;
import com.jbm.mmp.service.MoviesService;
import com.jbm.mmp.util.ResizeImageUtil;
import com.jbm.mmp.vo.Mania;
import com.jbm.mmp.vo.Movie;

@Controller
public class MovieController {
	
	private GenresService genresService;
	
	public void setGenresService(GenresService genresService) {
		this.genresService = genresService;
	}
	
	private MoviesService moviesService;
	
	public void setMoviesService(MoviesService moviesService) {
		this.moviesService = moviesService;
	}
	
	@RequestMapping(value="/movie/page/{no}",method=RequestMethod.GET)
	public String movieList(@PathVariable int no,Model model) {
		
		model.addAllAttributes(moviesService.getMovies(no));
		
		return "movieList";
	}
	
	
	@RequestMapping(value="/movie/{no}",method=RequestMethod.GET)
	public String movie(@PathVariable int no,Model model) {
		
		model.addAllAttributes(moviesService.getMovie(no));
		
		return "movieDetail";
	}
	
	//수정 
	@RequestMapping(value="/movie",method=RequestMethod.PUT)
	public String update(Movie movie, int[] genre) {
		
		System.out.println("PUT");
		
		moviesService.modify(movie,genre);
		
		return "redirect:/movie/"+movie.getNo();
	}
	
	
	
	@RequestMapping(value="/movie/{no}/update",method=RequestMethod.GET)
	public String updateForm(@PathVariable int no,Model model) {
		
		model.addAllAttributes(moviesService.getMovie(no));
		
		return "movieForm";
	}
	

	@RequestMapping(value="/movie/{no}",method=RequestMethod.DELETE)
	public String delete(@PathVariable int no) {
		
		System.out.println("DELETE MovieController /movie/"+no);
		
		moviesService.remove(no);
		
		return "redirect:/movie/page/1";
	}
	
	@RequestMapping(value="/movie",method=RequestMethod.POST)
	public String register(Movie movie,
			HttpSession session, 
			int[] genre) {
		
		Mania loginMania = (Mania)session.getAttribute("loginMania");
		
		movie.setManiaNo(loginMania.getNo());
		
		moviesService.register(movie, genre);
		
		return "redirect:/movie/"+movie.getNo();
	}
	
	
	
	@RequestMapping(value="/movie/register",method=RequestMethod.GET)
	public String registerForm(Model model) {
		
		model.addAttribute("genres",genresService.getGenres());
		
		return "movieForm";
	}

}
