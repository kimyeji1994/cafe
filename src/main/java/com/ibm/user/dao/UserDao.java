package com.ibm.user.dao;

import java.util.Map;

public interface UserDao {

	String selectCheckUser(Map<String, Object> params);

	int updateUser(Map<String, Object> params);

	int inserUser(Map<String, Object> params);

	int insertManager(Map<String, Object> params);

}
