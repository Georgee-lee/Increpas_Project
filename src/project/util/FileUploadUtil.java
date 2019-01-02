package project.util;

import java.io.File;

public class FileUploadUtil {

	public static String checkSamefileName(String fileName, String path) {
		
		//먼저 fileName에서 확장자를 뺀 파일명을 알아내자. 먼저 "."의 위치를 알아내야 한다.
		int period = fileName.lastIndexOf(".");
		
		//파일명과 확장자를 분리한다.
		String f_name = fileName.substring(0, period);
		String suffix = fileName.substring(period);
		
		//전체 경로를 만든다
		String savefileName = path + System.getProperty("file.separator") + fileName;
		
		//위의 경로를 가지고(path + fileName) java.io.File객체를 생성하자. f.exist()를 사용하여 파일 존재여부 확인!
		File f = new File(savefileName);
		
		//같은 이름이 있을 경우, 파일명 뒤에 숫자를 붙여줘야 한다. 그러면 int형 변수가 필요!!
		int idx = 1;
		while(f.exists()) { //같은 파일이 있을 경우 파일명 뒤에 숫자!
			StringBuffer sb = new StringBuffer();
			sb.append(f_name); //파일명
			sb.append(idx++); //숫자 붙여주고 1증가
			sb.append(suffix); //확장자 다시 붙이기
			
			fileName = sb.toString(); //변경한 이름을 파일명으로 바꿈
			
			savefileName = path + System.getProperty("file.separator") + fileName;
			
			f = new File(savefileName);
		}//while문 끝
		
		return fileName; //중복되지 않는 파일명을 반환한다.
	}
}
