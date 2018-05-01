package org.jbm.ims.service;

import java.util.List;

import org.jbm.ims.vo.Idol;

public interface IdolsService {

	List<Idol> getIdols();

	int register(Idol idol);
	
	boolean remove(int no);
}
