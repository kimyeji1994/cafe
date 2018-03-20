package com.ibm.user.biz;

import java.util.List;
import java.util.Map;

public interface UserBiz {

	String checkUser(Map<String, Object> params);

	boolean updateUser(Map<String, Object> params);

	boolean insertUser(Map<String, Object> params);

	boolean insertManager(Map<String, Object> params);

	List<String> selectApplicantList(Map<String, Object> params);

}
