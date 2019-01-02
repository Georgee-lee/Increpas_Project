<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@page import="java.io.File"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//첨부되어 오는 파일을(이미지, 파일로 온다) 받기 위한 객체
	//MultipartRequest를 만들기 위해 파일이 저장될 폴더의 경로가 필요하다!!
	String path = application.getRealPath("/upload"); //application은 현재 프로젝트의 WebContent까지의 경로!!! 
	//WebContent/upload 로 경로를 만들어 놓음.
	
	
	//이렇게 하면 넘어오는 파일이 미리 지정한 저장경로에 저장이 된다!
	MultipartRequest mr = new MultipartRequest(request, path, 1024*1024*10, "utf-8", new DefaultFileRenamePolicy());
	
	String f_name = null; //경로 이름 들어갈 변수
	File f = mr.getFile("upload"); //upload라는 이름으로 던졌으므로
	
	if(f != null)
		f_name = f.getName(); //여기서 받은 이름은 진짜 이름이 아닐 수도 있다. 중복되서 뒤에 숫자가 붙을 수도!!
							  //mr.getRealname인가 이거 하면 받을 수 있음.
%>

{
	"url":"<%=request.getContextPath() %>/upload/<%=f_name %>"
}


