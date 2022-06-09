<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<h2>농구 레슨 리스트</h2>

<table border="">
	<tr>
		<td>번호</td>
		<td>카테고리</td>
		<td>이미지</td>
		<td>레슨명</td>
		<td>레슨시간</td>
		<td>담당자</td>
		<td>수강료</td>
		<td>지점</td>
	</tr>
	
	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
	<tr>
		<td>${start + no.index }</td>
		<td>${dto.category }</td>
		<td><img src="<c:url value="/uploadFile/lesson_bas/${fn:split(dto.img, ',')[0]}"/>" alt="" /> </td>
		<td><a href="<c:url value="/lesson_bas/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">${dto.sname }</a></td>
		<td>${dto.lesson_time }</td>
		<td>${dto.manager_id }</td>
		<td>${dto.price }</td>
		<td>${dto.location }</td>		
	</tr>
	</c:forEach>
	
	
	<tr>
		<td colspan="8" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="/lesson_bas/List?page=${pageStart - 1 }"/>">[이전]</a>
			</c:if>		
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage ==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/lesson_bas/List?page=${i }"/>">${i }</a>		
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageEnd<pageTotal }">
				<a href="<c:url value="/lesson_bas/List?page=${pageEnd + 1 }"/>">[다음]</a>
			</c:if>		
		</td>
	</tr>
	
	<tr>
		<td colspan="8" align="right">
		<a href="<c:url value="/lesson_bas/InsertForm?page=${nowPage }"/>">글 작성</a>
	</tr>
</table>