package com.ibm.board.service;

import java.util.List;
import java.util.Map;

public interface BoardService {

	int writeEasyProject(Map<String, Object> params);

	List<String> getSceduleList(String code);

}
