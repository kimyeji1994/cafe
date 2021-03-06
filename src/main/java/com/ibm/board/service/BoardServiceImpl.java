package com.ibm.board.service;

import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibm.board.biz.BoardBiz;
import com.ibm.board.dao.BoardDao;
import com.ibm.board.web.BoardController;
import com.ibm.user.biz.UserBiz;

public class BoardServiceImpl implements BoardService {
	
	BoardBiz boardBiz;
	UserBiz userBiz;
	BoardDao boardDao;
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	public void setBoardBiz(BoardBiz boardBiz) {
		this.boardBiz = boardBiz;
	}
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}
	
	public void setBoardDao(BoardDao boardDao) {
		this.boardDao = boardDao;
	}

	@Override
	public String writeEasyProject(Map<String, Object> params) {
		int code =0 ;
		//code 생성
		
		logger.info("************* 간편일정  만들기 ************** " );
		while(true) {
			code = (int)( Math.random() * 10000);
			logger.info("code : " + code);
			 String checkCode = boardBiz.checkCode(String.valueOf(code));
			logger.info("checkCode : " + checkCode);
			
			if(checkCode == null) {
				params.put("code", code);
				boolean isInsertProjectCode = boardBiz.insertProjectCode(params);
				logger.info("isCheckProjectCode : " + isInsertProjectCode);
				break;
			}
		}
		
	
		
		//user가 있는지 확인 
		String checkUser = userBiz.checkUser(params);
		logger.info("checkUser :" + checkUser);
		
		if (checkUser != null) {
			boolean isUpdateUser = userBiz.updateUser(params);
			logger.info("isUpdateUser : " + isUpdateUser);
			
			
		} 
		else {
			boolean isInsertUser =  userBiz.insertUser(params);
			logger.info("isInsertUser : " + isInsertUser);
		}
		
		//board 
		
		params.put("grade" , "easy");
		logger.info("EASY PROJECT");
		
		
		boolean isInsertBoard = boardBiz.insertBoard(params);
		logger.info("isInsertBoard : " + isInsertBoard);
		
		
		int boardId = boardBiz.getBoardId(params);
		
		params.put("boardId", boardId);
		logger.info("boardId : " + boardId);
		
		//manager
		
		boolean isInsertManager = userBiz.insertManager(params);
		logger.info("isInsertManager : " + isInsertManager);
		
		
		//codePeople 
		boolean isInsertCodePeople = userBiz.insertCodePeople(params);
		logger.info("isInsertCodePeople : " + isInsertCodePeople);

		
		return String.valueOf(code);
	}

	@Override
	public List<String> getSceduleList(String code) {
		

		
		List<String> sceduleList = boardBiz.getSceduleList(code);
		
		
		
		return sceduleList;
	}

	@Override
	public String joinProjectAction(Map<String, Object> params) {
		logger.info("************* project 조인하기 ************** " );
		
		String code = null;
		 String paramsCode = params.get("code").toString();
		 String checkCode = boardBiz.checkCode(paramsCode);
		
		 logger.info("checkCode : " +checkCode);
		 if(checkCode != null) {
			 code = checkCode;
		 }
		 else {
			 return null;
		 }
		 
		//user가 있는지 확인 
			String checkUser = userBiz.checkUser(params);
			logger.info("checkUser :" + checkUser);
			
			if (checkUser != null) {
				boolean isUpdateUser = userBiz.updateUser(params);
				logger.info("isUpdateUser : " + isUpdateUser);
				
				
			} 
			else {
				boolean isInsertUser =  userBiz.insertUser(params);
				logger.info("isInsertUser : " + isInsertUser);
			}
			
			
			 userBiz.insertCodePeople(params);
			
		 
		 
		
		return code;
	}

	@Override
	public HashMap<String, Object> getboardInfo(Map<String, Object> params) {
		logger.info("************* project 정보 가져오기  params : {} ************** " ,params);
		
		HashMap<String, Object> boardInfo =  boardBiz.selectBoardInfoWithCode(params);

		return boardInfo;
	}

	@Override
	public void addSceduleInfo(Map<String, Object> params) {
		
		 boolean isAddScedule = boardBiz.addSceduleInfo(params);
		
	}

	@Override
	public List<ArrayList<String>> getsceduleLogList(Map<String, Object> params) {
		List<ArrayList<String>> sceduleLogList = boardBiz.getsceduleLogList(params);
		return sceduleLogList;
	}

	@Override
	public List<Object> getapplicantList(Map<String, Object> params) {
		List<Object> applicantList = userBiz.selectApplicantList(params);
		return applicantList;
	}

	@Override
	public String writeDiffProject(Map<String, Object> params) {
		String code =null ;
		//code 생성
		
		logger.info("************* 프로젝트 일정  만들기 ************** " );
		while(true) {
			Calendar cal = Calendar.getInstance();
			
			StringBuffer getDay = new StringBuffer();
			getDay.append(String.format("%02d", cal.get(cal.MONTH) + 1));
			getDay.append(String.format("%02d", cal.get(cal.DATE)));
		
			
			String day = getDay.toString();
			logger.info("day : " + day);
			String token = UUID.randomUUID().toString().substring(0, 3);
			
			
			
			
			
			code = day + token;
			logger.info("code : " + code);
			 String checkCode = boardBiz.checkCode(code);
			logger.info("checkCode : " + checkCode);
			
			if(checkCode == null) {
				params.put("code", code);
				boolean isInsertProjectCode = boardBiz.insertProjectCode(params);
				logger.info("isCheckProjectCode : " + isInsertProjectCode);
				break;
			}
		}
		
	
		
		//user가 있는지 확인 
		String checkUser = userBiz.checkUser(params);
		logger.info("checkUser :" + checkUser);
		
		if (checkUser != null) {
			boolean isUpdateUser = userBiz.updateUser(params);
			logger.info("isUpdateUser : " + isUpdateUser);
			
			
		} 
		else {
			boolean isInsertUser =  userBiz.insertUser(params);
			logger.info("isInsertUser : " + isInsertUser);
		}
		
		//board 
		if(params.get("project") == null) {
			params.put("grade" , "easy");
			logger.info("EASY PROJECT");
		}
		else {
			params.put("grade" , "diff");
			logger.info("DIFF PROJECT");
			
		}
		
		boolean isInsertBoard = boardBiz.insertBoard(params);
		logger.info("isInsertBoard : " + isInsertBoard);
		
		
		int boardId = boardBiz.getBoardId(params);
		
		params.put("boardId", boardId);
		logger.info("boardId : " + boardId);
		
		//manager
		
		boolean isInsertManager = userBiz.insertManager(params);
		logger.info("isInsertManager : " + isInsertManager);
		
		//codePeople 
		boolean isInsertCodePeople = userBiz.insertCodePeople(params);
		logger.info("isInsertCodePeople : " + isInsertCodePeople);
		
		return String.valueOf(code);
	}

	@Override
	public List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params) {
		
		return boardBiz.getProjectBoardList(params);
	}

	@Override
	public List<String> getSceduleListWithBoardId(String boardId) {
	
		return boardBiz.getSceduleListWithBoardId(boardId);
	}

	@Override
	public List<Object> getApplicantInOneDay(Map<String, Object> params) {
	
		return boardBiz.getApplicantInOneDay(params);
	}

	@Override
	public List<String> getLogInfowithPhone(Map<String, Object> params) {
		
		return boardBiz.getLogInfowithPhone(params);
	}

	@Override
	public Map<String, Object> getManagerInfo(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return userBiz.getManagerInfo(params);
	}

	@Override
	public boolean addCompulsoryPeople(Map<String, Object> params) {
		
		return userBiz.addCompulsoryPeople(params);
	}

	@Override
	public Map<String, Object> getCompulsoryPeople(Map<String, Object> params) {
		
		return userBiz.getCompulsoryPeople(params);
	}

	@Override
	public List<Object> getCompulsoryPeoples(Map<String, Object> params) {
		
		return userBiz.getCompulsoryPeoples(params);
	}

	@Override
	public boolean deleteCompulsory(Map<String, Object> params) {
		
		return userBiz.deleteCompulsory(params);
	}

	@Override
	public List<HashMap<String, Object>> getProjectUserList(Map<String, Object> params) {
	
		return userBiz.getProjectUserList(params);
	}

	@Override
	public List<Object> getRecommandList(Map<String, Object> params) {
	
		return boardBiz.getRecommandList(params);
	}

	@Override
	public Map<String, Object> getProjectCodewithPhone(Map<String, Object> params) {
	
		return boardBiz.getProjectCodewithPhone(params);
	}

	@Override
	public Boolean addBoardInProject(Map<String, Object> params) {
		
		logger.info("****board 추가****");
		Boolean isAddBoard = boardBiz.insertBoard(params); 
		
		
		int boardId = boardBiz.getBoardId(params);
		
		params.put("boardId", boardId);
		logger.info("boardId : " + boardId);
		
		//manager
		
		boolean isInsertManager = userBiz.insertManager(params);
		logger.info("isInsertManager : " + isInsertManager );
		
		return isInsertManager;
	}

	@Override
	public String getVoterInBoardId(Map<String, Object> params) {
		
		return userBiz.getVoterInBoardId(params);
	}

	@Override
	public int addComment(Map<String, Object> paramMap) {
		return boardDao.addComment(paramMap);
	}

	@Override
	public List<Object> getCommentList(Map<String, Object> paramMap) {
		return boardBiz.getCommentList(paramMap);
	}

}
