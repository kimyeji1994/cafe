package com.ibm.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public interface BoardService {

	String writeEasyProject(Map<String, Object> params);

	List<String> getSceduleList(String code);

	String joinProjectAction(Map<String, Object> params);

	HashMap<String, Object> getboardInfo(Map<String, Object> params);

	void addSceduleInfo(Map<String, Object> params);

	List<ArrayList<String>> getsceduleLogList(Map<String, Object> params);

	List<Object> getapplicantList(Map<String, Object> params);

	String writeDiffProject(Map<String, Object> params);

	List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params);

	List<String> getSceduleListWithBoardId(String boardId);

	List<Object> getApplicantInOneDay(Map<String, Object> params);

	List<String> getLogInfowithPhone(Map<String, Object> params);

	Map<String, Object> getManagerInfo(Map<String, Object> params);

	boolean addCompulsoryPeople(Map<String, Object> params);

	Map<String, Object> getCompulsoryPeople(Map<String, Object> params);

	List<Object> getCompulsoryPeoples(Map<String, Object> params);

	boolean deleteCompulsory(Map<String, Object> params);

	List<HashMap<String, Object>> getProjectUserList(Map<String, Object> params);

	List<Object> getRecommandList(Map<String, Object> params);

	Map<String, Object> getProjectCodewithPhone(Map<String, Object> params);

	Boolean addBoardInProject(Map<String, Object> params);

	String getVoterInBoardId(Map<String, Object> params);

}
