package com.semi.common.filter;

import java.nio.charset.Charset;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletRequestWrapper;

public class EncryptorWrapper extends HttpServletRequestWrapper {

	public EncryptorWrapper(HttpServletRequest request) {

		super(request);
	}
	
	@Override
	public String getParameter(String name) {
		String returnValue="";
		if(name.equals("pw")) {
			//암호화처리 후 반환
			String pw = super.getParameter(name);
			System.out.println(pw);
			String encPw=getSha512(pw);
			System.out.println(encPw);
			returnValue=encPw;
		}else {
			returnValue=super.getParameter(name);
		}
		return returnValue;
	}
	
	private String getSha512(String value) {
		String encPwd=null;//암호화한 값 보관
		//암호화처리객체
		MessageDigest md = null;
		//암호화 알고리즘
		try {
			md = MessageDigest.getInstance("SHA-512");
		}catch(NoSuchAlgorithmException e){
			e.printStackTrace();
		}
		//byte단위로 암호화
		byte[] bytes=value.getBytes(Charset.forName("UTF-8"));
		//byte값을 MessageDigest를 이용해서 암호화함.
		//md.update()메소드를 이용
		md.update(bytes);
		//String 값으로 변환
		encPwd=Base64.getEncoder().encodeToString(md.digest());
		return encPwd;
	}
	
}
