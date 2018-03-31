package com.ibm.board.dao;


import java.util.HashMap;
import java.util.List;
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
	public String selectOneCode(String code) {
	
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

	@Override
	public HashMap<String, Object> selectBoardInfoWithCode(Map<String, Object> params) {
	
		 return getSqlSession().selectOne("BoardDao.selectBoardInfoWithCode", params);
	}

	@Override
	public HashMap<String, Object> selectSceduleInfo(Map<String, Object> params) {
	
		return  getSqlSession().selectOne("BoardDao.selectSceduleInfo", params);
	}

	@Override
	public boolean insertSceduleInfo(Map<String, Object> params) {
		
		return getSqlSession().insert("BoardDao.insertSceduleInfo" , params) > 0;
	}

	@Override
	public boolean deleteSceduleInfo(Map<String, Object> params) {

		return getSqlSession().delete("BoardDao.deleteSceduleInfo" , params) > 0;
	}

	@Override
	public String selectOneDayLogCount(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("BoardDao.selectOneDayLogCount", params);
	}

	@Override
	public String selectDayFormat(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("BoardDao.selectDayFormat", params);
	}

	@Override
	public List<HashMap<String, Object>> getProjectBoardList(Map<String, Object> params) {
	
		return getSqlSession().selectList("BoardDao.getProjectBoardList", params);
	}

	@Override
	public String selectOneDayWithInSceduleBoardId(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return getSqlSession().selectOne("BoardDao.selectOneDayWithInSceduleBoardId", params);
	}

	@Override
	public List<String> getApplicantInOneDay(Map<String, Object> params) {
		// TODO Auto-generated method stub
		return getSqlSession().selectList("BoardDao.getApplicantInOneDay", params);
	}
	
	
	
}
	

