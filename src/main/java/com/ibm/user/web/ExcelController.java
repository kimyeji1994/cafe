package com.ibm.user.web;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.ibm.user.vo.UserVo;


@Controller
public class ExcelController {
	Logger logger = LoggerFactory.getLogger(this.getClass());

	@RequestMapping(value ="/excel/excelUpload", method=RequestMethod.POST)
	@ResponseBody
	public ResponseEntity<Map<String, Object>> excelUpload(@RequestParam("fileUpload") MultipartFile fileUpload){
		Map<String, Object> resultMap = new HashMap<String, Object>();
		List<UserVo> userList = new ArrayList<UserVo>();
		
		String name = "";
		String phone = "";
		
		int uploadCheck = 0;

		try {
			// TODO: 대용량 File upload
			//File file = fileUpload(fileUpload.getInputStream(), Constants.UPLOAD_TYPE_ETC); File 새로운 경로로 저장
			//multipartFile.transferTo(file); File 저장
			
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
			
			resultMap.put("userList", userList);

		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return new ResponseEntity<Map<String, Object>>(resultMap, HttpStatus.OK);
	}
	
	@RequestMapping(value ="/excel/userExcelDownload", method=RequestMethod.POST)
	@ResponseBody
	public String userExcelDownload(@RequestParam Map<String, Object> paramMap) throws Exception {
		HashMap<String, String> header = new HashMap<>();
		header.put("IMPORTANCE", "중요도");
		header.put("PHONE", "핸드폰번호");
		header.put("NAME", "사용자명");
		header.put("PROJECT", "프로젝트");
		header.put("TITLE", "제목");
		header.put("START_DATE", "시작일");
		header.put("END_DATE", "종료일");
		header.put("DUE_DATE", "기한일");
		
		HashMap<String, String[]> columnMap = new LinkedHashMap<String, String[]>();
		HashMap<String, String[]> keyMap = new HashMap<String, String[]>();
		HashMap<String, Object> valueMap = new HashMap<String, Object>();

		StringBuffer fileName = new StringBuffer();

		// TODO: 동적으로 파일명 지정
		fileName.append("프로젝트 생성 정보_");
		fileName.append(CommonUtil.getNowString("yyyyMMdd"));
		
		ModelAndView mav = new ModelAndView();
		
		mav.addObject("columnMap", columnMap);
		mav.addObject("keyMap", keyMap);
		mav.addObject("valueMap", valueMap);
		mav.addObject("fileName", fileName.toString());
		
		return "excelDownloader";
	}
}
