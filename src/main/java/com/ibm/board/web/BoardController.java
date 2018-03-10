package com.ibm.board.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String writePojectAction(@RequestParam Map<String , Object> params, HttpServletRequest request, HttpServletResponse response) {
		
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
