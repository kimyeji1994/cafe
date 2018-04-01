package com.ibm.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.ibm.board.service.BoardService;
import com.ibm.user.vo.UserVo;


@Controller
public class UserController {
	
	
	BoardService boardService;
	
	public void setBoardService(BoardService boardService) {
		this.boardService = boardService;
	}
	
	private Logger logger = LoggerFactory.getLogger(UserController.class);
	
	@RequestMapping(value ="/user/excelUpload", method=RequestMethod.POST)
	@ResponseBody
	public int UserExcelSave(@RequestParam("fileUpload") MultipartFile fileUpload ,HttpSession session){
		List<UserVo> userList = new ArrayList<UserVo>();

		int uploadCheck = 0;

		Map<String, Object> userMap = new HashMap<String, Object>();
		
		String name = "";
		String phone = "";
		
		UserVo userVo = (UserVo) session.getAttribute("_USER_");
		logger.info(userVo.getCode());
		userMap.put("code", userVo.getCode());
		try {
			Workbook workBook = WorkbookFactory.create(fileUpload.getInputStream());
			Sheet sheet = (Sheet) workBook.getSheetAt(0);
			
			int lastRowNum = sheet.getLastRowNum();
			
			for(int i = 1; i <= lastRowNum ; i++) {
				Row row = sheet.getRow(i);
				
				Cell cell0 = row.getCell(0);
				Cell cell1 = row.getCell(1);
				
				name = ExcelUtil.getCellValue(cell0);
				phone = ExcelUtil.getCellValue(cell1);
				
				if("".equals(name) || name == null || "".equals(phone) || phone == null) {
					uploadCheck ++;
				}
				
				if(uploadCheck == 0) {

					
					
					
					
					logger.info((row.getCell(0)).getStringCellValue());
					logger.info((row.getCell(1)).getStringCellValue());
					userMap.put("name", (row.getCell(0)).getStringCellValue());
					userMap.put("phone", (row.getCell(1)).getStringCellValue());
					
					logger.info("userMap : {} " , userMap);
					boardService.joinProjectAction(userMap);
					// TODO: PHONE 중복체크
				
				}
			}
			// TODO: DB INSERT

		} catch (Exception e) {
			e.printStackTrace();
		}

		return uploadCheck;
	}
}
