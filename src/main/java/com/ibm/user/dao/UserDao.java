package com.ibm.user.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserDao {

	String selectCheckUser(Map<String, Object> params);

	int updateUser(Map<String, Object> params);

	int inserUser(Map<String, Object> params);

	int insertManager(Map<String, Object> params);

	List<Object> selectApplicantList(Map<String, Object> params);

	Map<String, Object> selectManagerInfo(Map<String, Object> params);

	boolean addCompulsoryPeople(Map<String, Object> params);

	Map<String, Object> selectCompulsoryPeople(Map<String, Object> params);

	List<Object> selectCompulsoryPeoples(Map<String, Object> params);

	boolean deleteCompulsory(Map<String, Object> params);

	List<HashMap<String, Object>> getProjectUserList(Map<String, Object> params);

	

}
