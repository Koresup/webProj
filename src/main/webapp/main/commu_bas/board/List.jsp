<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>농구 자유 게시판 리스트</h2>

<table border="">
	<tr>
		<td>글번호</td>
		<td>말머리</td>
		<td>제목</td>
		<td>작성자</td>
		<td>작성일</td>
		<td>조회</td>
	</tr>
	
	
	<c:forEach var="dto" items="${mainData }" varStatus="no">
	<tr>
		<td>${start + no.index }</td>
		<td>${dto.head }</td>
		<td><a href="<c:url value="/commu_bas/board/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">${dto.title }</a></td>
		<td>${dto.user_id }</td>
		<td><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd"/></td>
		<td>${dto.cnt }</td>		
	</tr>
	</c:forEach>
	
	
	<tr>
		<td colspan="6" align="center">
			<c:if test="${pageStart > 1 }">
				<a href="<c:url value="/commu_bas/board/List?page=${pageStart - 1 }"/>">[이전]</a>
			</c:if>		
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage ==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a href="<c:url value="/commu_bas/board/List?page=${i }"/>">${i }</a>		
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<c:if test="${pageEnd<pageTotal }">
				<a href="<c:url value="/commu_bas/board/List?page=${pageEnd + 1 }"/>">[다음]</a>
			</c:if>		
		</td>
	</tr>
	
	
	<tr>
		<td colspan="6" align="right">
		<a href="<c:url value="/commu_bas/board/InsertForm?page=${nowPage }"/>">글 작성</a>
	</tr>
</table>

<div>
	<form>
		<fieldset>
			<legend>글 검색 필드</legend>
			<label>검색분류</label>
				<select name="f">
					<option value="title">제목</option>
					<option value="user_id">작성자</option>
					<option value="content">내용</option>
				</select>
			<label>검색어</label>
				<input type="text" name= "q" value=""/>
				<input type="submit" value="검색"/>
		</fieldset>
	</form>
</div>





























