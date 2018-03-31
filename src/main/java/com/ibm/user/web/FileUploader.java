package com.ibm.user.web;

import java.io.File;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

@Component("fileUploader")
public class FileUploader {

	@Autowired
	protected Properties config;
	
	public File fileUpload(MultipartFile file, String type) throws Exception {
		if(this.isExceededMaxSize(file, type)) {
			throw new Exception("파일 용량 초과");
		}
		
		String savePath = this.getFileUploadRoot() + this.getSaveDirectoryPath(type);
		String orgFileName = file.getOriginalFilename();
		orgFileName = this.cleanFileName(orgFileName);
		String newFileNm = this.getSaveFileName(orgFileName);
		this.makeDirectories(savePath);
		File destFile = new File(savePath + newFileNm);

		return destFile;
	};
	
	/**
	 * 용량 체크
	 * @param file
	 * @param type
	 * @return
	 */
	public boolean isExceededMaxSize(MultipartFile file, String type) {
		final long limit = 20 * 1024 * 1024; // 20 MB;
		if(file.getSize() > limit) {
			return true;
		} 
		
		return false;
	}

	/**
	 * 시스템 이미지 업로드 경로
	 * @param request
	 * @return
	 */
	public String getFileUploadRoot() {
		return config.getProperty("FILE_UPLOAD_PATH");
	}
	
	public String getSaveDirectoryPath(String type) {
		String seperator = "/";
		
		return seperator + CommonUtil.getNowString(CommonUtil.FORMAT_DATA_YYYY) + seperator + CommonUtil.getNowString(CommonUtil.FORMAT_DATA_MM) + seperator + type + seperator;
	}
	
	/**
	 * 실제 저장 파일명
	 * @param fileName
	 * @return
	 * @throws Exception
	 */
	public String getSaveFileName(String fileName) throws Exception {
		String result = "";
		String ext = CommonUtil.getExtensionFileName(fileName);
		
		if(!isAllowExtension(ext)) {
			throw new Exception("NOT_SUPPORTED_UPLOAD_FILE");
		}
		
		String random = CommonUtil.getRandomString(10);
		result = "N" + CommonUtil.getNowString(CommonUtil.FORMAT_DATA_YYYYMMDD24HmmSSSI) + "_" + random + "." + ext;
		
		return result;
	}
	
	/**
	 * 허용 파일 확장자
	 * @param etx
	 * @return
	 */
	public boolean isAllowExtension(String ext) {
		boolean result = false;
		String allowExt = config.getProperty("ALLOW_EXT");
		int indexOf = allowExt.toUpperCase().indexOf(ext.toUpperCase());
		
		result = indexOf >= 0;
		
		return result;
	}
	
	/**
	 * 파일명 특수문자 제거 
	 * @param fileName
	 * @return
	 */
	public String cleanFileName(String fileName) {
		fileName = fileName.replaceAll("/", "");
		fileName = fileName.replaceAll("\\\\", "");
		fileName = fileName.replaceAll("^\\.", "");
		fileName = fileName.replaceAll("&", "");

		return fileName;
	}
	
	/**
	 * 디렉토리 생성 
	 * @param savePath
	 */
	public void makeDirectories(String savePath) {
		File directory = new File(savePath);
		
		if(!directory.isDirectory()) {
			//디렉토리 권한 설정
			directory.setExecutable(false, true);
			directory.setReadable(true);
			directory.setWritable(false, true);
			directory.mkdirs();
		}
	}
}
