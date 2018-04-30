package dao;

import java.util.List;

import vo.Idol;

public interface IdolsDAO {

	List<Idol> selectList();

	int insert(Idol idol);

}
