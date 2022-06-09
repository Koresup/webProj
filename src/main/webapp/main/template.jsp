<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
</head>
<body>
<h1>게시판</h1>


<jsp:include page="top.jsp"/>
<div>
	<jsp:include page="${mainUrl}.jsp"/>
</div>


<jsp:include page="bottom.jsp"/>


</body>
</html>