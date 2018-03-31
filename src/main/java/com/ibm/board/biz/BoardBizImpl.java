package com.ibm.board.biz;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibm.board.dao.BoardDao;
import com.ibm.board.web.BoardController;
import com.ibm.user.dao.UserDao;
import com.mysql.fabric.xmlrpc.base.Array;

public class BoardBizImpl  implements BoardBiz{

	public BoardDao boardDao;
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	public void setBoardDao(BoardDao boardDao) {
			this.boardDao = boardDao;
		}

	@Override
	public String checkCode(String code) {
	
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

	@Override
	public HashMap<String, Object> selectBoardInfoWithCode(Map<String, Object> params) {
		
		
		HashMap<String, Object> boardInfo = boardDao.selectBoardInfoWithCode(params);
		logger.info("boardInfo : {} " , boardInfo);
		
		return boardInfo;
	}

	@Override
	public boolean addSceduleInfo(Map<String, Object> params) {
		logger.info("params : {} " , params);
		// 1. 있나 호ㅏㄱ인
		HashMap<String, Object> isAlreadySced = boardDao.selectSceduleInfo(params);
		logger.info("isAlreadySced : " + isAlreadySced);
		if(isAlreadySced == null) {
			boolean isAddSceduleInfo = boardDao.insertSceduleInfo(params);
			logger.info("isAddSceduleInfo : " + isAddSceduleInfo);
			
		}
		else {
			boolean isDeleteSceduleInfo = boardDao.deleteSceduleInfo(params);
			logger.info("isDeleteSceduleInfo : " + isDeleteSceduleInfo);
		}
		
		return false;
	}

	@Override
	public List<ArrayList<String>> getsceduleLogList(Map<String, Object> params) {
		List<ArrayList<String>> sceduleLogList = new ArrayList<ArrayList<String>>();
		ArrayList<String> sceduleOneLog = new ArrayList<String>();
		
		String oneDay = null;
		String logCount = null;
		int i =0;
		
		sceduleOneLog.add( "Date" );
		sceduleOneLog.add("Scedule");
		sceduleLogList.add(0, sceduleOneLog ); 
	
		while(true) {
			
			params.put("count", i);
		
			
			sceduleOneLog = new ArrayList<String>();
			
			
			if(params.get("code1") == null) {
				oneDay = boardDao.selectOneDayWithInScedule(params);
			}
			else {
				oneDay = boardDao.selectOneDayWithInSceduleBoardId(params);
			}
			
			 if(oneDay == null) {
				 logger.info("sceduleList : {} " , sceduleLogList );
				 break;
			 }
			params.put("oneDay", oneDay);
			
			logger.info("params : {}" , params);
			logCount = boardDao.selectOneDayLogCount(params);
			String dayFormat = boardDao.selectDayFormat(params);
			
		
			 if(logCount == null) {
				 logCount = "0";
			 }
			 sceduleOneLog.add( dayFormat);
			 sceduleOneLog.add( logCount);
			
			 
			 sceduleLogList.add(i + 1 , sceduleOneLog);
		
			 i++;
			 
			
			
		}
		return sceduleLogList;
	}

	@Override
	public List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params) {

		return boardDao.getProjectBoardList(params);
	}

	@Override
	public List<String> getSceduleListWithBoardId(String boardId) {
		logger.info("******************* 일정불러오기 ****************");
		List<String> sceduleList = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		String oneDay = null;
		int i =0;
		
		while(true) {
			
			params.put("code1", boardId);
			params.put("count", i);
			logger.info("params : {}" , params);
			
			
			oneDay =  boardDao.selectOneDayWithInSceduleBoardId(params);
			
			 if(oneDay == null) {
				 logger.info("sceduleList : {} " , sceduleList );
				 break;
			 }
			 sceduleList.add(oneDay);
			 i++;
			 
			
			
		}
		
		
		return sceduleList;
	}

	@Override
	public List<Object> getApplicantInOneDay(Map<String, Object> params) {
	
		return boardDao.getApplicantInOneDay(params);
	}

	@Override
	public List<String> getLogInfowithPhone(Map<String, Object> params) {

		
		return boardDao.getLogInfowithPhone(params);
	}


		
	
	
	
	
	
}
