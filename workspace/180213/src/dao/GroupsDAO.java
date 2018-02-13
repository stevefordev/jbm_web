package dao;

import java.util.List;
import org.apache.ibatis.session.SqlSession;
import util.SqlSessionUtil;
import vo.Group;

public class GroupsDAO {

	public static int insert(Group group) {
		// 리턴 자료형과 같은 지역변수를 선언하고 초기화
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("groups.insert", group);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return result;
	}

	public static List<Group> selectList() {
		// 리턴 자료형과 같은 지역변수로 선언하고 초기화
		List<Group> groupList = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			groupList = session.selectList("groups.selectList");
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return groupList;
	}

	public static int delete(int no) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("groups.delete", no);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}

		return result;
	}
}
