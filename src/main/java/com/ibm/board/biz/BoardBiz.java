package com.ibm.board.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardBiz {

	String checkCode(String code);

	boolean insertProjectCode(Map<String, Object> params);

	//TODO 날짜 insert하는 부분 
	boolean insertBoard(Map<String, Object> params);

	int getBoardId(Map<String, Object> params);

	List<String> getSceduleList(String code);

	HashMap<String, Object> selectBoardInfoWithCode(Map<String, Object> params);

	boolean addSceduleInfo(Map<String, Object> params);

	List<ArrayList<String>> getsceduleLogList(Map<String, Object> params);

	
	
	
}
