package org.jbm.ims.service;

import java.util.List;

import org.jbm.ims.dao.IdolsDAO;
import org.jbm.ims.vo.Idol;


public class IdolsServiceImpl
implements IdolsService{
	
	private IdolsDAO idolsDAO;
	
	public void setIdolsDAO(IdolsDAO idolsDAO) {
		this.idolsDAO = idolsDAO;
	}
	
	@Override
	public List<Idol> getIdols() {
		return idolsDAO.selectList();
	}

	@Override
	public boolean remove(int no) {
		return 1== idolsDAO.delete(no);
	}
	
	@Override
	public boolean register(Idol idol) {
		return 1==idolsDAO.insert(idol);
	}
	
	@Override
	public Idol getIdol(int no) {
		return idolsDAO.selectOne(no);
	}
	
	@Override
	public boolean modify(Idol idol) {
		return 1==idolsDAO.update(idol);
	}
}
