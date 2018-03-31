package com.ibm.user.web;

import java.util.ArrayList;
import java.util.List;

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

import com.ibm.user.vo.UserVo;


@Controller
public class UserController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@RequestMapping(value ="/user/excelUpload", method=RequestMethod.POST)
	@ResponseBody
	public int UserExcelSave(@RequestParam("fileUpload") MultipartFile fileUpload){
		List<UserVo> userList = new ArrayList<UserVo>();

		int uploadCheck = 0;
		
		String name = "";
		String phone = "";
		
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
					UserVo userVo = new UserVo();
					
					userVo.setName((row.getCell(0)).getStringCellValue());
					userVo.setPhone((row.getCell(1)).getStringCellValue());

					// TODO: PHONE 중복체크
					userList.add(userVo);
				}
			}
			// TODO: DB INSERT

		} catch (Exception e) {
			e.printStackTrace();
		}

		return uploadCheck;
	}
}
