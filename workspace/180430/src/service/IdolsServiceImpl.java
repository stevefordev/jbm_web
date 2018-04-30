package service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import dao.IdolsDAO;
import vo.Idol;

public class IdolsServiceImpl implements IdolsService {

	// IdolsDAO 에 의존적
	private IdolsDAO idolsDao;

	// 의존성주입을 위해서
	public void setIdolsDao(IdolsDAO idolsDao) {
		this.idolsDao = idolsDao;
	}

	@Override
	public List<Idol> getIdols() {
		// TODO Auto-generated method stub
		return idolsDao.selectList();
	}

	@Override
	public int register(Idol idol) {
		// TODO Auto-generated method stub
		return idolsDao.insert(idol);
	}
}
