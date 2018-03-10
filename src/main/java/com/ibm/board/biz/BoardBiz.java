package com.ibm.board.biz;

import java.util.List;
import java.util.Map;

public interface BoardBiz {

	String checkCode(int code);

	boolean insertProjectCode(Map<String, Object> params);

	//TODO 날짜 insert하는 부분 
	boolean insertBoard(Map<String, Object> params);

	int getBoardId(Map<String, Object> params);

	List<String> getSceduleList(String code);
	
	
	
	
}
