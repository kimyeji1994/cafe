package com.ibm.user.web;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

public class CommonUtil {
	
	public static final String FORMAT_DATA_YYYYMMDD24HmmSSSI = "yyyyMMddHHmmssSSS";
	public static final String FORMAT_DATA_YYYY = "yyyy";
	public static final String FORMAT_DATA_MM = "MM";
	
	/**
	 * String Null 체크
	 * @param obj
	 * @return
	 */
	public static String nvl(String obj) {
		String result = "";
		
		if(obj != null) {
			result = obj;
		}
		
		return result;
	}
	
	/**
	 * Null이 아닌 String Trim
	 * @param obj
	 * @return
	 */
	public static String nvlTrim(String obj) {
		return CommonUtil.nvl(obj).trim();
	}
	
	/** 
	 * file 확장자 변환
	 * @param fileName
	 * @return
	 */
	public static String getExtensionFileName(String fileName) {
		String result = "";
		String strFile = CommonUtil.nvlTrim(fileName);
		int indexOf = strFile.lastIndexOf(".");
		
		if(indexOf > 0) {
			result = strFile.substring(indexOf + 1, strFile.length());
		}
		
		return result;
	}
	
	/**
	 * 자릿수 만큼 random 문자열 반환
	 * @param digit 자릿수
	 * @return
	 */
	public static String getRandomString(int digit) {
		String result = "";
		Random random = new Random();
		
		for(int i = 0; i < digit; i++) {
			result += String.valueOf(random.nextInt(10));
		}
		
		return result;
	}
	
	/**
	 * String to nowDate
	 * @param format
	 * @return
	 */
	public static String getNowString(String format) {
		Date now = new Date();
		SimpleDateFormat simpleData = new SimpleDateFormat(format);
		
		return simpleData.format(now);
	}
}
