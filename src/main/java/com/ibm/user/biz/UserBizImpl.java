package com.ibm.user.biz;

import java.util.List;
import java.util.Map;

import com.ibm.user.dao.UserDao;

public class UserBizImpl implements UserBiz{

	UserDao userDao;
	
	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}

	@Override
	public String checkUser(Map<String, Object> params) {
		
		
		String checkUser = userDao.selectCheckUser(params);
		
		return checkUser;
	}

	@Override
	public boolean updateUser(Map<String, Object> params) {
		
		return userDao.updateUser(params) > 0;
	}

	@Override
	public boolean insertUser(Map<String, Object> params) {
	
		return userDao.inserUser(params) > 0;
	}

	@Override
	public boolean insertManager(Map<String, Object> params) {
		
		return  userDao.insertManager(params) > 0;
	}

	@Override
	public List<String> selectApplicantList(Map<String, Object> params) {
		
		return userDao.selectApplicantList(params);
	}
	
}
