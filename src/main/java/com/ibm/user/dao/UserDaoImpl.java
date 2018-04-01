package com.ibm.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.mybatis.spring.support.SqlSessionDaoSupport;



public class UserDaoImpl  extends SqlSessionDaoSupport implements UserDao{

	@Override
	public String selectCheckUser(Map<String, Object> params) {
		
		return getSqlSession().selectOne("UserDao.selectCheckUser", params);
	}

	@Override
	public int updateUser(Map<String, Object> params) {
	
		
		
		
		return getSqlSession().update("UserDao.updateUser", params);
	}

	@Override
	public int inserUser(Map<String, Object> params) {
		
		return getSqlSession().insert("UserDao.insertUser", params);
	
	}

	@Override
	public int insertManager(Map<String, Object> params) {
		
		return getSqlSession().insert("UserDao.insertManager", params);
	}

	@Override
	public List<Object> selectApplicantList(Map<String, Object> params) {
		
		return getSqlSession().selectList("UserDao.selectApplicantList", params);
	}

	@Override
	public Map<String, Object> selectManagerInfo(Map<String, Object> params) {
	
		return getSqlSession().selectOne("UserDao.selectManagerInfo", params);
	}

	@Override
	public boolean addCompulsoryPeople(Map<String, Object> params) {
	
		return getSqlSession().insert("UserDao.addCompulsoryPeople", params) > 0;
	}

	@Override
	public Map<String, Object> selectCompulsoryPeople(Map<String, Object> params) {
		
		return getSqlSession().selectOne("UserDao.selectCompulsoryPeople", params);
	}

	@Override
	public List<Object> selectCompulsoryPeoples(Map<String, Object> params) {
	
		return getSqlSession().selectList("UserDao.selectCompulsoryPeoples", params);
	}

	@Override
	public boolean deleteCompulsory(Map<String, Object> params) {
	
		return getSqlSession().delete("UserDao.deleteCompulsory" , params) > 0;
	}

	@Override
	public List<HashMap<String, Object>> getProjectUserList(Map<String, Object> params) {

		return getSqlSession().selectList("UserDao.getProjectUserList" , params);
	}

	@Override
	public boolean insertCodePeople(Map<String, Object> params) {
	
		return  getSqlSession().insert("UserDao.insertCodePeople" , params) > 0;
	}

	@Override
	public String getVoterInBoardId(Map<String, Object> params) {
	
		return getSqlSession().selectOne("UserDao.getVoterInBoardId" , params );
	}
	
	
	

}
