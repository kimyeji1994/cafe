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

	public HashMap<String, Object> selectSceduleInfo(Map<String, Object> params);

	public boolean insertSceduleInfo(Map<String, Object> params);

	public boolean deleteSceduleInfo(Map<String, Object> params);

	public String selectOneDayLogCount(Map<String, Object> params);

	public String selectDayFormat(Map<String, Object> params);

	public List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params);

	public String selectOneDayWithInSceduleBoardId(Map<String, Object> params);

	public List<String> getApplicantInOneDay(Map<String, Object> params);
	
	
}
