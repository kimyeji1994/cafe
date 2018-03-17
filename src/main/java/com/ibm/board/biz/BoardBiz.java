package com.ibm.board.biz;

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
	
	
	
	
}
