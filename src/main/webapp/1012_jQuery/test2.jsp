<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/mvc_board3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

 
Class.forName(driver);

 
Connection con = DriverManager.getConnection(url, user, password);

 
String sql = "SELECT * FROM board";
PreparedStatement pstmt = con.prepareStatement(sql);

 
ResultSet rs = pstmt.executeQuery();
 
JSONArray boardList=new JSONArray();
while(rs.next()){ 
	JSONObject board=new JSONObject();
	board.put("board_num", rs.getString("board_num"));
	board.put("board_subject",rs.getString("board_subject"));
	board.put("board_name",rs.getString("board_name"));
	board.put("board_date",rs.getString("board_date"));
	board.put("board_readcount",rs.getString("board_readcount"));
 
	boardList.add(board);
}
%>
<%=boardList %>
