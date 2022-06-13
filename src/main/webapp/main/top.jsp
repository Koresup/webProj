<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        div#top {
            width: 100%;
            height: 100px;
            background: #ff953e;
        }
    </style>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    <div id="top">
<h1>난 탑이야</h1>

<a href="<c:url value="/booking/List"/>">대관 예약</a>


<a href="<c:url value="/commu_bas/competition"/>">농구 대회 정보</a>
<a href="<c:url value="/commu_bas/board/List"/>">농구 자유게시판</a>
<a href="<c:url value="/commu_bas/guest"/>">농구 게스트</a>


<a href="<c:url value="/commu_soc/competition"/>">축구 대회 정보</a>
<a href="<c:url value="/commu_soc/board"/>">축구 자유게시판</a>
<a href="<c:url value="/commu_soc/guest"/>">축구 게스트</a>

<a href="<c:url value="/market/List"/>">장터</a>

<a href="<c:url value="/lesson_bas/List"/>">농구 레슨</a>
<a href="<c:url value="/lesson_soc/List"/>">축구 레슨</a>

<a href="<c:url value="/forMember/List"/>">고객센터</a>

</div>
<hr/>