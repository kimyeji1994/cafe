package com.ibm.board.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibm.board.dao.BoardDao;
import com.ibm.board.web.BoardController;

public class BoardBizImpl  implements BoardBiz{

	public BoardDao boardDao;
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	public void setBoardDao(BoardDao boardDao) {
			this.boardDao = boardDao;
		}

	@Override
	public String checkCode(int code) {
	
		return boardDao.selectOneCode(code);
	}

	@Override
	public boolean insertProjectCode(Map<String, Object> params) {
		
		return boardDao.insertProjectCode(params);
	}

	@Override
	public boolean insertBoard(Map<String, Object> params) {
		
		return boardDao.insertBoard(params);
	}

	@Override
	public int getBoardId(Map<String, Object> params) {
		
		return boardDao.selectBoardId(params);
	}

	@Override
	public List<String> getSceduleList(String code) {
		logger.info("******************* 일정불러오기 ****************");
		List<String> sceduleList = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		String oneDay = null;
		int i =0;
		
		while(true) {
			
			params.put("code", code);
			params.put("count", i);
			logger.info("params : {}" , params);
			
			
			oneDay = boardDao.selectOneDayWithInScedule(params);
			
			 if(oneDay == null) {
				 logger.info("sceduleList : {} " , sceduleList );
				 break;
			 }
			 sceduleList.add(oneDay);
			 i++;
			 
			
			
		}
		
		
		return sceduleList;
	}
		
	
	
	
	
	
}
