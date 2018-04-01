package com.ibm.board.biz;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
		List<String> sceduleLists = new ArrayList<String>();
		Map<String, Object> params = new HashMap<String, Object>();
		String oneDay = null;
		int i =0;
		
		params.put("code1", boardId);
       Map<String, Object> date = boardDao.selectStartEndDate(params);
		
		logger.info("date : {}" , date);

		

		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
		
		
		Date endDateD;
		Date startDateD;
		long diffDays = 0;
		Date period;
		try {
			
			String end = date.get("end_date").toString();
		
			endDateD = dateFormat.parse(end);
			
			String endDateS = dateFormat2.format(endDateD);
			
			logger.info("date : {}" , date);
			String start =  date.get("start_date").toString();
			startDateD =dateFormat.parse(start);
			String startDateS = dateFormat2.format(startDateD);
			period = dateFormat.parse(start);
			
			long diff = endDateD.getTime() - startDateD.getTime();
			diffDays = diff / (24 * 60 * 60 * 1000 );
			logger.info("diffDays : " + diffDays);
			String periodS = dateFormat.format(period);
			for ( int f = 0 ; f <= diffDays; f++) {
				logger.info("period : {} " , periodS);
				sceduleLists.add(periodS);
				period = new Date(period.getTime() + (24 * 60 * 60 * 1000 + 1) );
				periodS = dateFormat.format(period);
			}
			
		} catch (ParseException e) {
		
			e.printStackTrace();
		}
		
		/*while(true) {
			
			params.put("code1", boardId);
			params.put("count", i);
			logger.info("params : {}" , params);
			
			
			oneDay =  boardDao.selectOneDayWithInSceduleBoardId(params);
			
			 if(oneDay == null) {
				 logger.info("sceduleLists : {} " , sceduleLists );
				 logger.info("sceduleList : {} " , sceduleList );
				 break;
			 }
			 sceduleList.add(oneDay);
			 i++;
			 
			
			
		}*/
		
		
		return sceduleLists;
	}

	@Override
	public List<Object> getApplicantInOneDay(Map<String, Object> params) {
	
		return boardDao.getApplicantInOneDay(params);
	}

	@Override
	public List<String> getLogInfowithPhone(Map<String, Object> params) {

		
		return boardDao.getLogInfowithPhone(params);
	}

	@Override
	public List<Object> getRecommandList(Map<String, Object> params) {
		List<Object> sceduleLogList = new ArrayList<Object>();
		ArrayList<String> sceduleOneLog = new ArrayList<String>();
		
		String oneDay = null;
		String logCount = null;
		int i =0;
		
		sceduleOneLog.add( "Date" );
		sceduleOneLog.add("Applicants");
		sceduleOneLog.add("Compulsory");
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
			logCount = boardDao.selectOneDayLogCountINRecommand(params);
			String dayFormat = boardDao.selectDayFormat(params);
			String compulsoryCount = boardDao.selectCompulsoryCount(params);
		
			 if(logCount == null) {
				 logCount = "0";
			 }
			 sceduleOneLog.add( dayFormat);
			 sceduleOneLog.add( logCount);
			 sceduleOneLog.add( compulsoryCount);
			
			 
			 sceduleLogList.add(i + 1 , sceduleOneLog);
		
			 i++;
			 
			
			
		}
		return sceduleLogList;
	}

	@Override
	public Map<String, Object> getProjectCodewithPhone(Map<String, Object> params) {
	
		return boardDao.getProjectCodewithPhone(params);
	}

	@Override
	public int addComment(Map<String, Object> paramMap) {
		return boardDao.addComment(paramMap);
	}

	@Override
	public List<Object> getCommentList(Map<String, Object> paramMap) {
		return boardDao.getCommentList(paramMap);
	}

}
