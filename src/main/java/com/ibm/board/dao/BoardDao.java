package com.ibm.board.dao;

import java.util.Map;

public interface BoardDao {

	

	public void getOneDailyPart(String dailyPatyId);

	public String selectOneCode(int code);

	public boolean insertProjectCode(Map<String, Object> params);

	public boolean insertBoard(Map<String, Object> params);

	public int selectBoardId(Map<String, Object> params);

	public String selectOneDayWithInScedule(Map<String, Object> params);
	
	
}
