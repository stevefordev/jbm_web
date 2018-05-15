package com.jbm.mmp.service;

import org.springframework.stereotype.Service;

import com.jbm.mmp.dao.ManiasDAO;
import com.jbm.mmp.vo.Mania;

@Service
public class ManiasServiceImpl implements ManiasService{
	
	private ManiasDAO maniasDAO;
	
	public void setManiasDAO(ManiasDAO maniasDAO) {
		this.maniasDAO = maniasDAO;
	}
	
	@Override
	public boolean join(Mania mania) {
		return 1==maniasDAO.insert(mania);
	}

	@Override
	public Mania login(Mania mania) {
		return maniasDAO.selectLogin(mania);
	}
	
	@Override
	public Mania checkId(String id) {
		return maniasDAO.selectById(id);
	}
}
