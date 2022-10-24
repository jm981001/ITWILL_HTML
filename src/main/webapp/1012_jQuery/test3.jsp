<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%


String id=request.getParameter("id");



String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/mvc_board3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

Class.forName(driver);

Connection con = DriverManager.getConnection(url, user, password);

String sql = "SELECT * FROM member WHERE id=?";
PreparedStatement pstmt = con.prepareStatement(sql);
pstmt.setString(1, id);

ResultSet rs = pstmt.executeQuery();

String result="";
if(rs.next()){
	result="아이디 중복";
}else{
	result="아이디 사용가능";
}
%>
<%=result%>