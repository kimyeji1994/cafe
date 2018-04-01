package com.ibm.board.web;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.security.*;
import java.io.*;
import java.net.*;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class SmsController {
	@RequestMapping(value ="/board/smsSend", method=RequestMethod.POST)
	@ResponseBody
	public String SmsSend(@RequestParam Map<String, Object> paramMap) throws Exception{
		String charsetType = "UTF-8";
		String alert = "";
		String action = nullcheck((String)paramMap.get("action"), "");

		if(action.equals("go")) {
			String sms_url = "";
			sms_url = "https://sslsms.cafe24.com/sms_sender.php"; // SMS 전송요청 URL
			String user_id = "dokyung30"; // SMS아이디
			String secure = "af02cdf2222972b9edc82a8d9de0ac3c";//인증키
			String msg = nullcheck((String)paramMap.get("msg"), "");
			String sphone1 = nullcheck((String)paramMap.get("sphone1"), "");
			String sphone2 = nullcheck((String)paramMap.get("sphone2"), "");
			String sphone3 = nullcheck((String)paramMap.get("sphone3"), "");
			String rdate = nullcheck((String)paramMap.get("rdate"), "");
			String rtime = nullcheck((String)paramMap.get("rtime"), "");
			String mode = "1";
			String subject = "";
			if(nullcheck((String)paramMap.get("smsType"), "").equals("L")) {
				subject = nullcheck((String)paramMap.get("subject"), "");
			}
			String testflag = nullcheck((String)paramMap.get("testflag"), "");
			String destination = nullcheck((String)paramMap.get("destination"), "");
			String repeatFlag = nullcheck((String)paramMap.get("repeatFlag"), "");
			String repeatNum = nullcheck((String)paramMap.get("repeatNum"), "");
			String repeatTime = nullcheck((String)paramMap.get("repeatTime"), "");
			String returnurl = nullcheck((String)paramMap.get("returnurl"), "");
			String nointeractive = nullcheck((String)paramMap.get("nointeractive"), "");
			String smsType = nullcheck((String)paramMap.get("smsType"), "");

			// TODO: 해당 프로젝트에서 문자를 받을 사람들의 PHONE DB에서 select
			List<String> rphoneTmpList = new ArrayList<String>();
			
			List<String> rphoneList = new ArrayList<String>();
			
			for (String phone : rphoneTmpList) {
				if(phone.indexOf("-") <= 0) {
					phone = phone.substring(0, 3) + '-' + phone.substring(3, 7) + '-' + phone.substring(7, 11);
				}
				rphoneList.add(phone);
			}

			for (String rphone : rphoneList) {
				String[] host_info = sms_url.split("/");
				String host = host_info[2];
				String path = "/" + host_info[3];
				int port = 80;

				// 데이터 맵핑 변수 정의
				String arrKey[]
						= new String[] {"user_id","secure","msg", "rphone","sphone1","sphone2","sphone3","rdate","rtime"
								,"mode","testflag","destination","repeatFlag","repeatNum", "repeatTime", "smsType", "subject"};
				String valKey[]= new String[arrKey.length] ;
				valKey[0] = user_id;
				valKey[1] = secure;
				valKey[2] = msg;
				valKey[3] = rphone;
				valKey[4] = sphone1;
				valKey[5] = sphone2;
				valKey[6] = sphone3;
				valKey[7] = rdate;
				valKey[8] = rtime;
				valKey[9] = mode;
				valKey[10] = testflag;
				valKey[11] = destination;
				valKey[12] = repeatFlag;
				valKey[13] = repeatNum;
				valKey[14] = repeatTime;
				valKey[15] = smsType;
				valKey[16] = subject;

				String boundary = "";
				Random rnd = new Random();
				String rndKey = Integer.toString(rnd.nextInt(32000));
				MessageDigest md = MessageDigest.getInstance("MD5");
				byte[] bytData = rndKey.getBytes();
				md.update(bytData);
				byte[] digest = md.digest();
				for(int i =0;i<digest.length;i++)
				{
					boundary = boundary + Integer.toHexString(digest[i] & 0xFF);
				}
				boundary = "---------------------"+boundary.substring(0,11);

				// 본문 생성
				String data = "";
				String index = "";
				String value = "";
				for (int i=0;i<arrKey.length; i++)
				{
					index =  arrKey[i];
					value = valKey[i];
					data +="--"+boundary+"\r\n";
					data += "Content-Disposition: form-data; name=\""+index+"\"\r\n";
					data += "\r\n"+value+"\r\n";
					data +="--"+boundary+"\r\n";
				}

				//out.println(data);

				InetAddress addr = InetAddress.getByName(host);
				Socket socket = new Socket(host, port);
				// 헤더 전송
				BufferedWriter wr = new BufferedWriter(new OutputStreamWriter(socket.getOutputStream(), charsetType));
				wr.write("POST "+path+" HTTP/1.0\r\n");
				wr.write("Content-Length: "+data.length()+"\r\n");
				wr.write("Content-type: multipart/form-data, boundary="+boundary+"\r\n");
				wr.write("\r\n");

				// 데이터 전송
				wr.write(data);
				wr.flush();

				// 결과값 얻기
				BufferedReader rd = new BufferedReader(new InputStreamReader(socket.getInputStream(),charsetType));
				String line;
				ArrayList tmpArr = new ArrayList();
				while ((line = rd.readLine()) != null) {
					tmpArr.add(line);
				}
				wr.close();
				rd.close();

				String tmpMsg = (String)tmpArr.get(tmpArr.size()-1);
				String[] rMsg = tmpMsg.split(",");
				String Result= rMsg[0]; //발송결과
				String Count= ""; //잔여건수
				if(rMsg.length>1) {Count= rMsg[1]; }

				//발송결과 알림
				if(Result.equals("success")) {
					alert = "Successfully sended.(Remaining SMS: " + Count + ")";
				}
				else if(Result.equals("reserved")) {
					alert = "성공적으로 예약되었습니다";
					alert += " 잔여건수는 "+ Count+"건 입니다.";
				}
				else if(Result.equals("3205")) {
					alert = "잘못된 번호형식입니다.";
				}
				else {
					alert = "[Error]"+Result;
				}

				//out.println(nointeractive);

				if(nointeractive.equals("1") && !(Result.equals("Test Success!")) && !(Result.equals("success")) && !(Result.equals("reserved")) ) {
					//out.println(alert);
				}
				else if(!(nointeractive.equals("1"))) {
					//out.println(alert);
				} 
			}
		}
			
		return alert;
	}

	public static String nullcheck(String str,  String Defaultvalue) throws Exception{
		String ReturnDefault = "" ;
		if (str == null) {
			ReturnDefault =  Defaultvalue ;
		} else if (str == "" ) {
			ReturnDefault =  Defaultvalue ;
		} else {
			ReturnDefault = str ;
		}

		return ReturnDefault ;
	}

	/**
	 * BASE64 Encoder
	 * @param str
	 * @return
	 */
	public static String base64Encode(String str)  throws java.io.IOException {
		sun.misc.BASE64Encoder encoder = new sun.misc.BASE64Encoder();
		byte[] strByte = str.getBytes();
		String result = encoder.encode(strByte);

		return result ;
	}

	/**
	 * BASE64 Decoder
	 * @param str
	 * @return
	 */
	public static String base64Decode(String str)  throws java.io.IOException {
		sun.misc.BASE64Decoder decoder = new sun.misc.BASE64Decoder();
		byte[] strByte = decoder.decodeBuffer(str);
		String result = new String(strByte);
		return result ;
	}
}
