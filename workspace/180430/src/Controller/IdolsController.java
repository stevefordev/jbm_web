package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.GroupsService;
import service.IdolsService;
import vo.Group;
import vo.Idol;

@Controller
public class IdolsController {

	private IdolsService idolsService;

	public void setIdolsService(IdolsService idolsService) {
		this.idolsService = idolsService;
	}

	/**
	 * 
	 * JSP (InternalResourceView) 에 출력할 데이터가 있으면(모델이 필요하면) 모델을 인자로 받음(스프링이 넣어줌)
	 */
	@RequestMapping("/idols.html")
	public String idols(Model model) {

		List<Idol> list = idolsService.getIdols();

		// 모델에 'list' 라는 이름으로 list 레퍼런스를 attribute로 등록
		model.addAttribute("list", list);

		return "idolList";
	}
}
