package com.ibm.board.dao;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.mybatis.spring.support.SqlSessionDaoSupport;

@Mapper
public class BoardDaoImpl  extends SqlSessionDaoSupport implements BoardDao{

	@Override
	public void getOneDailyPart(String dailyId) {

		getSqlSession().selectList("BoardDao.getDailyPartsByDLID", dailyId);
		
		
		return ;
		
	}

	@Override
	public String selectOneCode(int code) {
	
		return getSqlSession().selectOne("BoardDao.selectOneCode", code);
	}

	@Override
	public boolean insertProjectCode(Map<String, Object> params) {
		
		return getSqlSession().insert("BoardDao.insertProjectCode" , params) > 0;
	}

	@Override
	public boolean insertBoard(Map<String, Object> params) {
	
		return getSqlSession().insert("BoardDao.insertBoard" , params) > 0;
	}

	@Override
	public int selectBoardId(Map<String, Object> params) {
	
		return getSqlSession().selectOne("BoardDao.selectBoardId", params);
	}

	@Override
	public String selectOneDayWithInScedule(Map<String, Object> params) {
	
		return getSqlSession().selectOne("BoardDao.selectOneDayWithInScedule", params);
	}
	
}
