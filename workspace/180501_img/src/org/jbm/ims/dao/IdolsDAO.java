package org.jbm.ims.dao;

import java.util.List;

import org.jbm.ims.vo.Idol;

public interface IdolsDAO {

	List<Idol> selectList();

	int insert(Idol idol);

	int delete(int no);
}
