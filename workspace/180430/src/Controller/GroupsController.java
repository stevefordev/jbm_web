package controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import service.GroupsService;
import vo.Group;

@Controller
public class GroupsController {

	private GroupsService groupsService;

	public void setGroupsService(GroupsService groupsService) {
		this.groupsService = groupsService;
	}

	/**
	 * 
	 * JSP (InternalResourceView) 에 출력할 데이터가 있으면(모델이 필요하면) 모델을 인자로 받음(스프링이 넣어줌)
	 */
	@RequestMapping("/groups.html")
	public String groups(Model model) {

		List<Group> list = groupsService.getGroups();
		
		// 모델에 'aaa' 라는 이름으로 list 레퍼런스를 attribute로 등록
		model.addAttribute("list", list);
		
		for (Group group : list) {
			System.out.println(group.getName());
		}
		return "groupList";
	}
}
