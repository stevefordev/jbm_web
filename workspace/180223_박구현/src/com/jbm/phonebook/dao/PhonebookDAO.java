package com.jbm.phonebook.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.jbm.phonebook.util.SqlSessionUtil;
import com.jbm.phonebook.vo.Host;
import com.jbm.phonebook.vo.Phone;

public class PhonebookDAO {

	/**
	 * main.jsp 페이지의 전화번호목록을 호출 위해서 사용
	 * @param hostNo 로그인한 호스트 기준
	 * @return
	 */
	public static List<Phone> selectListByHostNo(int hostNo) {
		List<Phone> list = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			list = session.selectList("phonebook.selectListByHostNo", hostNo);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end

		return list;
	}

	/**
	 * update.jsp 에서 수정할 단일 전화번호 호출을 위해 사용
	 * 로그인한 유저의 전화번호 목록중에서만 호출해야하므로 조건은 phonebook.no , phoneboo.host_no
	 * 로그인 유저가 get방식으로 다른 유저의 목록을 호출 수정하는것을 방지
	 * @param param no와, hostNo 정보만 
	 * @return
	 */
	public static Phone selectOne(Phone param) {
		Phone phone = null;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			phone = session.selectOne("phonebook.selectOne", param);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end

		return phone;
	}

	/**
	 * 전화번호정보 저장
	 * @param phone
	 * @return
	 */
	public static int insert(Phone phone) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.insert("phonebook.insert", phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end

		return result;
	}

	/**
	 * 전화번호정보 수정
	 * @param phone
	 * @return
	 */
	public static int update(Phone phone) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.update("phonebook.update", phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end

		return result;
	}

	/**
	 * 전화번호 정보 삭제
	 * 로그인한 유저의 전화번호 목록중에서만 삭제 되야므로 조건은 phonebook.no , phoneboo.host_no
	 * 로그인 유저가 get방식으로 다른 유저의 목록을 삭제하는것을 방지 
	 * @param phone no와, hostNo 정보만 
	 * @return
	 */
	public static int delete(Phone phone) {
		int result = 0;

		SqlSession session = null;
		try {
			session = SqlSessionUtil.getSession();
			result = session.delete("phonebook.delete", phone);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			if (session != null)
				session.close();
		} // try~catch~finally end

		return result;
	}
}
