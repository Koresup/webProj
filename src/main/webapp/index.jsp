<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%
// 이거시 정석이다
String pid = URLEncoder.encode("엄마상어", "UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>index</title>
</head>
<body>
	
	<h2><a href="commu_bas/board/List">농구 자유 게시판</a></h2>
	<h2><a href="commu_bas/compet/List">농구 대회 정보</a></h2>
	<h2><a href="commu_bas/guest/List">농구 용병 구인/구팀</a></h2>
	
	<h2><a href="lesson_bas/List">농구 레슨</a></h2>
	<h2><a href="lesson_soc/List">축구 레슨</a></h2>
	
</body>
</html>