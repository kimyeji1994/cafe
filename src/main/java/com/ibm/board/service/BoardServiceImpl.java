package com.ibm.board.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.ibm.board.biz.BoardBiz;
import com.ibm.board.web.BoardController;
import com.ibm.user.biz.UserBiz;

public class BoardServiceImpl implements BoardService {
	
	BoardBiz boardBiz;
	UserBiz userBiz;
	
	private Logger logger = LoggerFactory.getLogger(BoardController.class);

	public void setBoardBiz(BoardBiz boardBiz) {
		this.boardBiz = boardBiz;
	}
	
	public void setUserBiz(UserBiz userBiz) {
		this.userBiz = userBiz;
	}

	@Override
	public int writeEasyProject(Map<String, Object> params) {
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
		
		
		boolean isInsertBoard = boardBiz.insertBoard(params);
		logger.info("isInsertBoard : " + isInsertBoard);
		
		
		int boardId = boardBiz.getBoardId(params);
		
		params.put("boardId", boardId);
		logger.info("boardId : " + boardId);
		
		//manager
		
		boolean isInsertManager = userBiz.insertManager(params);
		logger.info("isInsertManager : " + isInsertManager);
		

		
		return code;
	}

	@Override
	public List<String> getSceduleList(String code) {
		
		logger.info("************* 간편일정 날짜 불러오기 ************** " );
		
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
			 return "";
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
			
		 
		 
		
		return code;
	}

	@Override
	public HashMap<String, Object> getboardInfo(Map<String, Object> params) {
		logger.info("************* project 정보 가져오기  ************** " );
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
	public List<String> getapplicantList(Map<String, Object> params) {
		List<String> applicantList = userBiz.selectApplicantList(params);
		return applicantList;
	}
	
	
	
	
	
	
	
	

}
