package com.ibm.user.web;

import java.math.BigDecimal;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.lang.StringUtils;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.sun.jmx.snmp.Timestamp;

public class ExcelDownloader {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public void buildExcelFile(Map<String, Object> model, HSSFWorkbook workbook, HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("buildExcelFile");
		String fileName = (String) model.get("fileName");
		
		response.setContentType("application/octet-stream");
		response.setHeader("Content-Transfer-Encoding", "binary");
		response.setHeader("Content-Disposition", "attachment;fileName=\"" + URLEncoder.encode(fileName + ".xlsx", "UTF-8") + "\"");
		response.setHeader("Pragma", "no-cache");
		response.setHeader("Expires", "-1");
		
		@SuppressWarnings("unchecked")
		HashMap<String, String> header = (HashMap<String, String>) model.get("header");
		@SuppressWarnings("unchecked")
		List<Map<String, String>> data = (List<Map<String, String>>) model.get("data");
		@SuppressWarnings("unchecked")
		List<String> excludeColumnNames = (List<String>) model.get("excludeColNames");
		
		if(excludeColumnNames == null) {
			excludeColumnNames = new ArrayList<String>();
		}
		
		// 워크시트 생성
		HSSFSheet worksheet =  workbook.createSheet(fileName + " WorkSheet");
		
		if (data == null) {
			return;
		}
		
		// 헤더 생성
		if (data.size() > 0) {
			HSSFRow row = worksheet.createRow(0);
			Map<String, String> rowMap = data.get(0);
			Iterator<String> iterator = rowMap.keySet().iterator();
			
			int columnIndex = 0;
			
			while (iterator.hasNext()) {
				String key = iterator.next();
				
				if(excludeColumnNames.contains(key)) {
					continue;
				}
				
				String value = StringUtils.defaultString(header.get(key), key);
				row.createCell(columnIndex).setCellValue(value);
				++ columnIndex;
			}
		}
		
		// 행 데이터 생성
		for (int i = 0; i < data.size(); i++) {
			HSSFRow row = worksheet.createRow(i + 1);
			Map<String, String> rowMap = data.get(i);
			Iterator<String> iterator = rowMap.keySet().iterator();
			
			int columnIndex = 0;
			
			while(iterator.hasNext()) {
				String key = iterator.next();
				
				if(excludeColumnNames.contains(key)) {
					continue;
				}
				
				String value = this.getValue(rowMap.get(key));
				row.createCell(columnIndex).setCellValue(value);
				
				++ columnIndex;
			}
		}
	}
	
	private String getValue(Object object) {
		if(object instanceof String) {
			return (String) object;
		} else if (object instanceof BigDecimal) {
			BigDecimal bd = (java.math.BigDecimal) object;
			return bd.toString();
		} else if (object instanceof Timestamp) {
			Timestamp ts = (Timestamp) object;
			return ts.toString();
		}
		
		return (String) object;
	}
}
