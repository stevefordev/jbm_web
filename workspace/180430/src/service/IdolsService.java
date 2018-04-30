package service;

import java.util.List;

import vo.Idol;

public interface IdolsService {

	List<Idol> getIdols();

	int register(Idol idol);
}
