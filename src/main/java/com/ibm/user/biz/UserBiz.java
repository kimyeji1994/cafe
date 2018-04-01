package com.ibm.user.biz;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface UserBiz {

	String checkUser(Map<String, Object> params);

	boolean updateUser(Map<String, Object> params);

	boolean insertUser(Map<String, Object> params);

	boolean insertManager(Map<String, Object> params);

	List<Object> selectApplicantList(Map<String, Object> params);

	Map<String, Object> getManagerInfo(Map<String, Object> params);

	boolean addCompulsoryPeople(Map<String, Object> params);

	Map<String, Object> getCompulsoryPeople(Map<String, Object> params);

	List<Object> getCompulsoryPeoples(Map<String, Object> params);

	boolean deleteCompulsory(Map<String, Object> params);

	List<HashMap<String, Object>> getProjectUserList(Map<String, Object> params);

	boolean insertCodePeople(Map<String, Object> params);

	String getVoterInBoardId(Map<String, Object> params);

}
