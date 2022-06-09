<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>글 수정 폼</h2>

<form action="DeleteReg" method="post">
	<input type="hidden" name="post_id" value="${param.post_id }" />
	<table border="">
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="<c:url value="/commu_bas/board/Detail?post_id=${param.post_id }&page=${nowPage }"/>">뒤로</a>
				<input type="submit" value="삭제" />
				<input type="hidden" name="nowPage" value="${nowPage }"/>				
			</td>
		</tr>
	</table>
</form>