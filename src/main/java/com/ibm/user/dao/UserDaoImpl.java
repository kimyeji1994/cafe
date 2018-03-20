package com.ibm.user.dao;

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
	public List<String> selectApplicantList(Map<String, Object> params) {
		
		return getSqlSession().selectList("UserDao.selectApplicantList", params);
	}
	
	
	

}