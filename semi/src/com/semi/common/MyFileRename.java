package com.semi.common;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.text.SimpleDateFormat;

import com.oreilly.servlet.multipart.FileRenamePolicy;

public class MyFileRename implements FileRenamePolicy{

	@Override
	public File rename(File oldFile) {
		//rename을 실행하는 매소드
		File newFile=null;
		do {
			long currentTime=System.currentTimeMillis();//현재시간
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum=(int)(Math.random()*1000);
			//현재파일의 명칭을 변경하기 위해
			// 확장자명 만 가져오기 
			String oriName=oldFile.getName();//확장자포함 파일명 가져오기
			String ext="";
			int dot=oriName.lastIndexOf(".");//adfds.txt, asdfasf.hwp
			if(dot>-1) {
				ext=oriName.substring(dot);
			}
			//새파일이름을 변경하기
			String newName=sdf.format(new Date(currentTime))+"_"+rndNum+ext;
			newFile=new File(oldFile.getParent(),newName);			
		}while(!createNewFile(newFile));
		
		return newFile;
	}
	
	private boolean createNewFile(File f) {
		try {
			return f.createNewFile();
		}catch(IOException e) {
			return false;
		}
	}

		
	
}












