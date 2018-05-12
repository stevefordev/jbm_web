package org.jbm.ims.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.jbm.ims.dao.IdolsDAO;
import org.jbm.ims.util.PaginateUtil;
import org.jbm.ims.vo.Idol;

import oracle.net.aso.p;


public class IdolsServiceImpl
implements IdolsService{
	
	private IdolsDAO idolsDAO;
	
	public void setIdolsDAO(IdolsDAO idolsDAO) {
		this.idolsDAO = idolsDAO;
	}
	
	@Override
	public Map<String, Object> getIdols(int page) {
		
		//한 페이지에 보여질 게시물 수
		int numPage = 8;
		
		//한 페이지에 보여질 
		//페이징 블록 갯수
		int numBlock = 3;
		
		
		//페이징 처리용 Map
		Map<String, Object> pageRange
		= new HashMap<String,Object>();
		
		int end = page*numPage;
		int start = end-(numPage-1);
		
		pageRange.put("start", start);
		pageRange.put("end", end);
		
		//아이돌 목록(list)
		List<Idol> list = 
			idolsDAO.selectList(pageRange);
		
		for(Idol idol : list) {
			System.out.println(idol.getName());
		}//for end
		
		
		//모델(View에출력할)용 맵
		Map<String, Object> model =
				new HashMap<>();
		
		model.put("idols", list);
		
		//페이지네이션 처리
		
		int total = idolsDAO.selectTotal();
		
		String url = "/idol/page/";
		
		String paginate = 
		PaginateUtil.getPaginate(page, total, numPage, numBlock, url);
		
		model.put("paginate", paginate);
		
		return model;
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
