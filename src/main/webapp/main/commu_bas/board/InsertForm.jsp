<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>게시글 작성하기</h2>

<form action="InsertReg" method="post" enctype="multipart/form-data">
	<table border="">
		<tr>
			<td rowspan="2">
				<select name="head" id="">
					<option value="none">=== 선택 ===</option>
					<option value="want_human">용병 구인</option>
					<option value="want_team">용병 구팀</option>
				</select>
			</td>
			<td rowspan="2"><input type="text" name="title" placeholder="제목" /></td>
			<td colspan="1"><input type="text" name="user_id" placeholder="ID"/></td>
			<td colspan="1"><input type="text" name="pw" placeholder="PW"/></td>
		</tr>
		<tr>
			<td>게시일자</td>
			<td>조회</td>
		</tr>
		<tr>
			<td colspan="4"><textarea name="content" cols="75" rows="10" placeholder="게시글을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<td>이미지 첨부</td>
			<td colspan="3"><input type="file" name="img" multiple/></td>
		</tr>
		<tr>
			<td>파일 첨부</td>
			<td colspan="3"><input type="file" name="upfile" multiple/></td>
		</tr>
		<tr>
			<td colspan="2"><a href="<c:url value="/commu_bas/board/List"/>">목록으로</a></td>
			<td><input type="reset" value="초기화" /></td>
			<td><input type="submit" value="작성" /></td>
		</tr>
	</table>
</form>
