<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.*,com.oreilly.servlet.*,com.oreilly.servlet.multipart.*, java.io.File, database.MoMConnection"%>
<%@ page import="java.util.Enumeration" %>
<%@ page import="java.sql.*" %>
<% request.setCharacterEncoding("UTF-8"); %> 
<%! 
   Connection conn = null;
   PreparedStatement pstmt = null;
   ResultSet rs = null;
%>

<%

Enumeration<String> headerString = request.getHeaderNames();
while(headerString.hasMoreElements()){
	String header = headerString.nextElement();
	System.out.println(header+":"+request.getHeader(header));
}
//BufferedReader reader = request.getReader();
String aggg = "dfdsf";
%>


<% 
	System.out.println(request.getRequestURL());
	//이미지를 저장할 경로 입력.
	String imgDirectory = "C:/Users/Shining/Dropbox/Server/MoM/WebContent/img";
	String name = new String();
	
	
	String fileName = new String();
	int sizeLimit = 5 * 1024 * 1024; // 5메가까지 제한 넘어서면 예외발생
	try {
		
	    MultipartRequest multi = new MultipartRequest(request, imgDirectory, sizeLimit,
	            new DefaultFileRenamePolicy());
	    Enumeration files = multi.getFileNames();
			
	    //파일 정보가 있다면
	    if (files.hasMoreElements()) {
	    	//name을 기본키로 파일이름과 같이 디비에 저장
	        name = (String) files.nextElement();
	        fileName = multi.getFilesystemName(name);
	        
	    }
	    System.out.println("이름 : " + name);
	    System.out.println("이미지를 저장하였습니다. : " + fileName);
	} catch (IOException e) {      
	    out.println("안드로이드 부터 이미지를 받아옵니다.");
	}/* 
	try{
		Class.forName(jdbc_driver);
		conn = DriverManager.getConnection(jdbc_url,"root","0000");
		String sql = "SELECT id FROM  WHERE id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, request.getParameter("id"));
		rs = pstmt.executeQuery();
	} */
%>

