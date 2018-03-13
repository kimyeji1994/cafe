package com.ibm.board.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.swing.text.DateFormatter;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.board.dao.BoardDao;
import com.ibm.board.service.BoardService;

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
		
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (UnsupportedEncodingException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
		SimpleDateFormat dateFormat2 = new SimpleDateFormat("yyyyMMdd");
		
		String end = (String)params.get("endDate");
		System.out.println("end : " + end);
		Date endDateD =dateFormat.parse(end);
		String endDateS = dateFormat2.format(endDateD);
		System.out.println("endDate : " + endDateS);
		params.put("endDate", endDateS);
		
		String start = (String) params.get("startDate");
		System.out.println("start : " + start);
		Date startDateD =dateFormat.parse(start);
		String startDateS = dateFormat2.format(startDateD);
		System.out.println("startDate : " + startDateS);		
		params.put("startDate", startDateS);
		logger.info("startDate : " + startDateS + " endDate : " + endDateS);
		
		logger.info("params {}" ,params);
				
		 int code = boardService.writeEasyProject(params);
				 
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
		view.setViewName("board/listScedule");
		
		return view;
		
		
	}
   
   
	
	

}
