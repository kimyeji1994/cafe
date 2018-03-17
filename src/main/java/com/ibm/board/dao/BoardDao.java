package com.ibm.board.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardDao {

	

	public void getOneDailyPart(String dailyPatyId);

	public String selectOneCode(String code);

	public boolean insertProjectCode(Map<String, Object> params);

	public boolean insertBoard(Map<String, Object> params);

	public int selectBoardId(Map<String, Object> params);

	public String selectOneDayWithInScedule(Map<String, Object> params);

	public HashMap<String, Object> selectBoardInfoWithCode(Map<String, Object> params);
	
	
}
