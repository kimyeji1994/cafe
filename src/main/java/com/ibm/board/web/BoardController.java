package com.ibm.board.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.board.dao.BoardDao;
import com.ibm.board.service.BoardService;
import com.ibm.user.vo.UserVo;

@Controller
public class BoardController {
	
	BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}


	private Logger logger = LoggerFactory.getLogger(BoardController.class);




	@RequestMapping(value ="/", method=RequestMethod.GET)
	public String mainView(){

		return "board/main";

	}
	
	@RequestMapping(value ="/sample", method=RequestMethod.GET)
	public String sampleView(){

		return "board/sample";

	}
	@RequestMapping(value ="/project/write", method=RequestMethod.GET)
	public String writePojectView() {
		
		return "board/addProject";
	}
	
	@RequestMapping(value ="/project/write", method=RequestMethod.POST)
	public String writePojectAction(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response) throws ParseException {
		logger.info("params {}" ,params);
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
		
		String end = (String)params.get("endDate");
		Date endDateD =dateFormat.parse(end);
		String endDateS = dateFormat2.format(endDateD);

		params.put("endDate", endDateS);
		
		String start = (String) params.get("startDate");
		Date startDateD =dateFormat.parse(start);
		String startDateS = dateFormat2.format(startDateD);
	
		params.put("startDate", startDateS);

		String due = (String) params.get("dueDate");
		Date dueDateD =dateFormat.parse(due);
		String dueDateS = dateFormat2.format(dueDateD);
		System.out.println("dueDate : " + dueDateS);		
		params.put("dueDate", dueDateS);

		
		logger.info("params {}" ,params);
	
		UserVo userVo = new UserVo(); //login
		
		String code = null;
		if(params.get("project")  == null) {
		  code = boardService.writeEasyProject(params);
		}
		else {
		  code = boardService.writeDiffProject(params);
		}
		 
		 
		 // login 처리
		userVo.setCode(code);
		userVo.setName(params.get("name").toString());
		userVo.setPhone(params.get("phone").toString());
		HttpSession session = request.getSession();
		session.setAttribute("_USER_", userVo);
		session.setAttribute("_DATE_", null);
		logger.info("***********Log In************");
		logger.info("userVo {}" ,userVo);
		 PrintWriter write;
			try {
				write = response.getWriter();
				write.append(""+code);
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
			
		
	 
	
		return "board/addProject";
	}
	
	@RequestMapping(value ="/scedule/list/{code}", method=RequestMethod.GET)
	public ModelAndView SceduleListView(@RequestParam Map<String , Object> params  ,HttpServletRequest request, HttpServletResponse response, @PathVariable String code) {
		ModelAndView view = new ModelAndView();
		
		String boardId = request.getParameter("board");
		logger.info("boardId : " + boardId); // 차이
		logger.info("code : " + code); // 차이
		List<Object> sceduleLists = new ArrayList<Object>();
		List<String> sceduleList = null;
		params.put("code1", boardId);	
		params.put("code", code);
		
		
		//날짜 가져오기
		if(boardId != null) {
			// diff
			logger.info("sceduleList : " + "diff"); // 차이
			sceduleList = boardService.getSceduleListWithBoardId(boardId);
		
		}
		else {
		
			sceduleList = boardService.getSceduleList(code);

		}	
		
	
		for(int i=0; i < sceduleList.size(); i++) {
			List<String> oneScedule = new ArrayList<String>();
			oneScedule.add( sceduleList.get(i));
			logger.info( "sceduleList.get(i) : {} ", sceduleList.get(i)); // 차이
			oneScedule.add(sceduleList.get(i).replace("/", "") );
			sceduleLists.add(oneScedule);
		}
		logger.info( "sceduleLists : {}", sceduleLists); // 차이
		
		view.addObject("sceduleList", sceduleLists);
	
		
	
		
		//정보 가져오기 
		HashMap<String, Object> boardInfo = boardService.getboardInfo(params);
		view.addObject("boardInfo" , boardInfo);
		
		params.put("boardInfo", boardInfo);
		//도표 정보 가져오기 
		logger.info("**********도표 정보 **********");
		List<ArrayList<String>> sceduleLogList = boardService.getsceduleLogList(params);
		view.addObject("sceduleLogList", sceduleLogList);
		
		//참석자 정보 가져오기 
		logger.info("**********참석자 정보 **********");
		logger.info("params : {}" , params);
		List<Object> applicantList = boardService.getapplicantList(params);
		logger.info("applicantList : {} " , applicantList);
		view.addObject("applicantList", applicantList);
		
		
		//그당일 
		HttpSession session = request.getSession();
		HashMap<String, Object> onedayParams  = (HashMap<String, Object>) session.getAttribute("_DATE_");
		logger.info("onedayParams : {} " , onedayParams);
		List<Object> applicantInOneDay = null;
		if(onedayParams != null) {
			view.addObject("oneday", onedayParams.get("date"));
			applicantInOneDay = boardService.getApplicantInOneDay(onedayParams); 
			logger.info("applicantInOneDay : {} " , applicantInOneDay);
		}
		
		view.addObject("applicantInOneDay", applicantInOneDay);
		
		
		
		//유저 클릭 정보 가져오기 
		UserVo userVo = (UserVo) session.getAttribute("_USER_");
		String phone = userVo.getPhone();
		params.put("phone", phone);
		List<String> userLog = boardService.getLogInfowithPhone(params);
		logger.info("userLog : {} " , userLog);
		view.addObject("userLog", userLog);
		
		
		// 방장정보 가져오기 
		Map<String, Object> managerInfo = boardService.getManagerInfo(params);
		logger.info("managerInfo : {} " , managerInfo);
		view.addObject("managerInfo", managerInfo);
		
		
		// 중요 인물 정보 가져오기 
		List<Object> compulsoryPeoples = boardService.getCompulsoryPeoples(params);
		logger.info("compulsoryPeoples : {} " , compulsoryPeoples);
		view.addObject("compulsoryPeoples", compulsoryPeoples);
		
		
		//
		
		logger.info("********** voter ********* " );
		String voter = boardService.getVoterInBoardId(params);
		
		
		
		view.setViewName("board/listScedule");
		
		return view;
		
		
	}
	
	
	@RequestMapping(value ="/project/join", method=RequestMethod.GET)
	public String joinPojectView() {
		
		return "board/joinProject";
	}
	
	@RequestMapping(value ="/project/join", method=RequestMethod.POST)
	public String joinPojectAction(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map ) {
		
		logger.info("params {}" ,params);
		
	
		
		 String code = boardService.joinProjectAction(params);
		 
		 // login 처리
		 UserVo userVo = new UserVo();
		 userVo.setCode(String.valueOf(code));
		 userVo.setName(params.get("name").toString());
		 userVo.setPhone(params.get("phone").toString());
		HttpSession session = request.getSession();
		session.setAttribute("_USER_", userVo);
		session.setAttribute("_DATE_", null);
		logger.info("***********Log In*************");
		logger.info("userVo {}" ,userVo.toString());
		 
		 PrintWriter write;
		 if(code != null) {
		 
			try {
				write = response.getWriter();
				write.append(""+code);
				write.flush();
				write.close();
			} catch (IOException e) {
				throw new RuntimeException(e.getMessage(), e);
			}
		 }
		 else {
			
				try {
					write = response.getWriter();
					write.append("fail");
					write.flush();
					write.close();
				} catch (IOException e) {
					throw new RuntimeException(e.getMessage(), e);
				}
			 
		 }
	 
	
		return "";
	}
	
		
		
	@RequestMapping(value ="/project/addScedule", method=RequestMethod.POST)
	public ResponseEntity<HashMap<String, Object>> addSceduleProcess(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ){
		HashMap<String, Object> rtnMap = new HashMap<String, Object>() ;
		
		UserVo userVo =  (UserVo) session.getAttribute("_USER_");
		params.put("phone", userVo.getPhone());

		logger.info("params : {}" , params);
		boardService.addSceduleInfo(params);
		
		// 그날 참석자 가져오기 
		
		
		rtnMap.put("data" ,  "true" );	
	    rtnMap.put("date" , params.get("date"));
	    rtnMap.put("boardId" , params.get("boardId"));
	   
		session.setAttribute("_DATE_", rtnMap);
		
	
		return ResponseEntity.ok(rtnMap);		
	}
	
	@RequestMapping(value ="/project/list/{code}", method=RequestMethod.GET)
	public String projectListView(@RequestParam Map<String , Object> params, ModelMap map, @PathVariable String code) {
		
		
		
		params.put("code", code);
		logger.info("params : {}" , params);

		
		//user 정보 
		List<HashMap<String, Object>> userList = boardService.getProjectUserList(params);
		map.addAttribute("userList", userList );
		
		//프로젝트 정보
		List<HashMap<String, Object>> boardList = boardService.getProjectBoardList(params);
		map.addAttribute("boardInfo", boardList );
		
		
		
		
		return "board/listProject";
	}
	
	@RequestMapping(value ="/project/addCompulsory", method=RequestMethod.POST)
	public void addCompulsoryPeople(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ) {
		
			logger.info("params : {}" , params);
		
		Map<String , Object> isAlreadyCom = boardService.getCompulsoryPeople(params);
		
		
	    if(isAlreadyCom == null) {
	    	boolean isSuccessCom =	boardService.addCompulsoryPeople(params);
	    	logger.info("isSuccessCom : " + isSuccessCom);
	    }
	       
		
		
		
		
	}
	
	@RequestMapping(value ="/project/deleteCompulsory", method=RequestMethod.POST)
	public void deleteCompulsory(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ) {
		
		logger.info("params : {}" , params);
	
	Map<String , Object> isAlreadyCom = boardService.getCompulsoryPeople(params);
	
	
    if(isAlreadyCom != null) {
    	boolean isSuccessDeleCom =	boardService.deleteCompulsory(params);
    	logger.info("isSuccessDeleCom : " + isSuccessDeleCom);
    }
       
		
		
		
		
	}
	
	@RequestMapping(value ="/project/viewScedule", method=RequestMethod.POST)
	public void viewScedule(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ){
		HashMap<String, Object> rtnMap = new HashMap<String, Object>() ;
		rtnMap.put("date" , params.get("date"));
		rtnMap.put("boardId" , params.get("boardId"));
		
		session.setAttribute("_DATE_", rtnMap);
		
	}
	
	
	@RequestMapping(value ="/project/addComment", method=RequestMethod.GET)
	public String addComment(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ){
		logger.info("********comment********");
		UserVo user =  (UserVo) session.getAttribute("_USER_");
		logger.info("params {}" , params);
		//Boolean isSuccessComment = boardService.addComment(params);
		
		return "";
		
	}
	
	
	
	@RequestMapping(value ="/project/viewRecommand", method=RequestMethod.GET)
	public String viewRecommand(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ){
		logger.info("********Recommand********");
		UserVo user =  (UserVo) session.getAttribute("_USER_");
		logger.info("params {}" , params);
		params.put("code1", String.valueOf( params.get("boardId") ));
		
		List<Object> recommandList = boardService.getRecommandList(params);
		map.addAttribute("recommandList", recommandList );
		
		
		
		
		return "board/recommend";
		
	}
	
	@RequestMapping(value ="/project/getCode", method=RequestMethod.GET)
	public ResponseEntity<Map<String, Object>> getProjectCodewithPhone(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ){
		
		Map<String, Object> rtnMap = null;
		
		
		rtnMap = boardService.getProjectCodewithPhone(params);
		
		return ResponseEntity.ok(rtnMap);
		
	}
	

	@RequestMapping(value ="/project/addBoard", method=RequestMethod.POST)
	public void addBoardInProject(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map, HttpSession session ) throws ParseException {
		
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
		
		String end = (String)params.get("endDate");
		Date endDateD =dateFormat.parse(end);
		String endDateS = dateFormat2.format(endDateD);

		params.put("endDate", endDateS);
		
		String start = (String) params.get("startDate");
		Date startDateD =dateFormat.parse(start);
		String startDateS = dateFormat2.format(startDateD);
	
		params.put("startDate", startDateS);

		String due = (String) params.get("dueDate");
		Date dueDateD =dateFormat.parse(due);
		String dueDateS = dateFormat2.format(dueDateD);
		System.out.println("dueDate : " + dueDateS);		
		params.put("dueDate", dueDateS);

		
		logger.info("params {}" ,params);
		UserVo userVo= (UserVo) session.getAttribute("_USER_");
	    params.put("phone", userVo.getPhone() );
	    params.put("grade", "diff" );
		logger.info("params : {}" , params);
		
		Boolean isAddBoardInProject = boardService.addBoardInProject(params);
	
		
		
		
		
	}
	
	
	
	
	
	
	
	
	
}
