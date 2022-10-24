<%@page import="org.json.simple.JSONArray"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 1012_jQuery/listJson.jsp

// [
// 			{"id":"kim","name":"kimgildong"},
// 			{"id":"lee","name":"leegildong"},
// 			{"id":"hong","name":"honggildong"}
// ]
		
//student 테이블 전체 레코드를 조회하는 작업 수행(4단계 구문 실행까지만)
//JDBC 연결 4단계
//DB 연결에 필요한 정보 문자열(4가지)을 변수에 별도로 저장
String driver = "com.mysql.cj.jdbc.Driver"; // 드라이버 클래스
String url = "jdbc:mysql://localhost:3306/study_jsp3"; // DB 접속 정보
String user = "root"; // 계정명
String password = "1234"; // 패스워드

//1단계. 드라이버 클래스 로드
Class.forName(driver);

//2단계. DB 연결
//=> 연결 성공 시 리턴되는 Connection 타입 객체를 java.sql.Connection 타입으로 저장
Connection con = DriverManager.getConnection(url, user, password);

//3단계. SQL 구문 작성 및 전달
String sql = "SELECT * FROM member";
PreparedStatement pstmt = con.prepareStatement(sql);

//4단계. SQL 구문 실행 및 결과 처리
ResultSet rs = pstmt.executeQuery();

//json-simple-1.1.1.jar 설치
// 5단계 데이터 접근해서 => JSON데이터 변경
// JSON 배열 데이터 저장
JSONArray memberList=new JSONArray();
while(rs.next()){
	//한사람의 정보를 저장
	JSONObject member=new JSONObject();
	member.put("id", rs.getString("id"));
	member.put("name",rs.getString("name"));
	// 배열 한칸에 저장
	memberList.add(member);
}
%>
<%=memberList %>
