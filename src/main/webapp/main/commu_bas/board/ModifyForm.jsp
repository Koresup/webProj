<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>글 수정 폼</h2>


<form action="ModifyReg" method="post" enctype="multipart/form-data">
<input type="hidden" name="post_id" value="${dto.post_id }"/>
<input type="hidden" name="nowPage" value="${nowPage }" />
	<table border="">
		<tr>
			<td rowspan="2">게시판명</td>
			<td rowspan="2"><input type="text" name="title" value="${dto.title }"/></td>
			<td colspan="2"><input type="text" name="user_id" value="${dto.user_id }"/>작성자 : ${dto.user_id }</td>
		</tr>
		<tr>
			<td>${dto.reg_date }</td>
			<td>${dto.cnt }</td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="content" cols="30" rows="10">${dto.content }</textarea></td>
		</tr>
		<tr>
			<td>비밀번호</td>
			<td><input type="text" name="pw" /></td>
		</tr>
		<tr>
			<td colspan="4"><input type="file" name="upfile" value="${dto.upfile }" multiple/></td>
			
		</tr>
		<tr>
			<td colspan="2" align="center">
				<a href="<c:url value="/commu_bas/board/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">뒤로</a>
				<input type="reset" value="초기화" />
				<input type="submit" value="수정" />
				<input type="hidden" value="${nowPage }" name="nowPage"/>
			</td>
		</tr>
	</table>
</form>