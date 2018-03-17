package com.ibm.board.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
		params.put("dueDate", dueDateS);

		
		logger.info("params {}" ,params);
	
		UserVo userVo = new UserVo(); //login
		 int code = boardService.writeEasyProject(params);
		// login 처리
		userVo.setCode(String.valueOf(code));
		userVo.setName(params.get("name").toString());
		userVo.setPhone(params.get("phone").toString());
		HttpSession session = request.getSession();
		session.setAttribute("_USER_", userVo);
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
		
		
		//날짜 가져오기
		List<String> sceduleList = boardService.getSceduleList(code);
		view.addObject("sceduleList", sceduleList);
		params.put("code", code);
		//정보 가져오기 
		HashMap<String, Object> boardInfo = boardService.getboardInfo(params);
		view.addObject("boardInfo" , boardInfo);
		
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
		logger.info("***********Log In************");
		logger.info("userVo {}" ,userVo);
		 
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
	public ResponseEntity<HashMap<String, Object>> addSceduleProcess(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response ,ModelMap map ){
		HashMap<String, Object> rtnMap = new HashMap<String, Object>() ;
		rtnMap.put("data" ,  "fail" );	

		return ResponseEntity.ok(rtnMap);		
	}
	
}
