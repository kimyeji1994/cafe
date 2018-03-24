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

	List<String> getapplicantList(Map<String, Object> params);

	String writeDiffProject(Map<String, Object> params);

	List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params);

	List<String> getSceduleListWithBoardId(String boardId);

	List<String> getApplicantInOneDay(Map<String, Object> params);

}
