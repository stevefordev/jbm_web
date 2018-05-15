package com.jbm.mmp.service;

import java.util.List;

import com.jbm.mmp.vo.Genre;

public interface GenresService {
	
	public boolean register(Genre genre);
	public List<Genre> getGenres();
	public boolean remove(int no);

}
