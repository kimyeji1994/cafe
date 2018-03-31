package com.ibm.user.web;

import org.apache.poi.ss.usermodel.Cell;

public class ExcelUtil {

	public static String getCellValue(Cell cell) {
		String data = "";
		
		switch (cell.getCellType()) {
		case Cell.CELL_TYPE_BOOLEAN:
			data = String.valueOf(cell.getBooleanCellValue());
			break;
		case Cell.CELL_TYPE_NUMERIC:
			data = String.valueOf(cell.getNumericCellValue());
			break;
		case Cell.CELL_TYPE_STRING:
			data = cell.getStringCellValue();
			break;
		default:
			break;
		}
		
		return data.trim();
	}
}
