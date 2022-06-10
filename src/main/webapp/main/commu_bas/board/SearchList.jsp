<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>농구 자유 게시판 리스트</h2>

<form action="SearchList" method="post">
	<select name="field" id="">
		<option value="list">전체</option>
		<option value="title">제목</option>
		<option value="user_id">작성자</option>
	</select> <input type="text" name="search" /> <input type="submit" value="검색" />
</form>

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
			<td><a
				href="<c:url value="/commu_bas/board/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">${dto.title }</a></td>
			<td>${dto.user_id }</td>
			<td><fmt:formatDate value="${dto.reg_date }"
					pattern="yyyy-MM-dd" /></td>
			<td>${dto.cnt }</td>
		</tr>
	</c:forEach>


	<tr>
		<td colspan="6" align="center"><c:if test="${pageStart > 1 }">
				<a
					href="<c:url value="/commu_bas/board/SearchList?page=${pageStart - 1 }&field=${param.field }&search=${param.search }"/>">[이전]</a>
			</c:if> <c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage ==i }">
						[${i }]
					</c:when>
					<c:otherwise>
						<a
							href="<c:url value="/commu_bas/board/SearchList?page=${i }&field=${param.field }&search=${param.search }"/>">${i }</a>
					</c:otherwise>
				</c:choose>
			</c:forEach> <c:if test="${pageEnd<pageTotal }">
				<a
					href="<c:url value="/commu_bas/board/SearchList?page=${pageEnd + 1 }&field=${param.field }&search=${param.search }"/>">[다음]</a>
			</c:if></td>
	</tr>


	<tr>
		<td colspan="6" align="right"><a
			href="<c:url value="/commu_bas/board/InsertForm?page=${nowPage }"/>">글
				작성</a>
	</tr>
</table>
