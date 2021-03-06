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

	public List<Object> getApplicantInOneDay(Map<String, Object> params);

	public List<String> getLogInfowithPhone(Map<String, Object> params);

	public String selectOneDayLogCountINRecommand(Map<String, Object> params);

	public String selectCompulsoryCount(Map<String, Object> params);

	public Map<String, Object> getProjectCodewithPhone(Map<String, Object> params);

	int addComment(Map<String, Object> paramMap);

	public List<Object> getCommentList(Map<String, Object> paramMap);

	public Map<String, Object> selectStartEndDate(Map<String, Object> params);
	
}
