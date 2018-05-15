package com.jbm.mmp.service;

import java.util.Map;

import org.springframework.stereotype.Service;

import com.jbm.mmp.vo.Movie;

@Service
public interface MoviesService {
	
	public boolean register(Movie movie, int[] genres);
	
	public boolean modify(Movie movie, int[] genres);
	
	public Map<String, Object> getMovies(int no);
	
	public  Map<String, Object> getMovie(int no);
	
	public boolean remove(int no);

}
