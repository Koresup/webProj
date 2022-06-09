<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h2>레슨 게시글 수정하기</h2>


<form action="ModifyReg" method="post" enctype="multipart/form-data">
<input type="hidden" name="post_id" value="${dto.post_id }"/>
<input type="hidden" name="nowPage" value="${nowPage }" />
	<table border="">
		<tr>
			<th>카테고리</th>
			<td>
				<select name="category" id="">
					<option value="none">===선택===</option>
					<option value="슛팅">슛팅</option>
					<option value="드리블">드리블</option>
					<option value="기타">기타</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>레슨명</th>
			<td><input type="text" name="sname" value="${dto.sname }" /></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="img" value="${dto.img }" multiple/></td>
		</tr>
		<tr>
			<th>info</th>
			<td><textarea name="contents_info" cols="75" rows="10" >${dto.contents_info }</textarea></td>
		</tr>
		<tr>
			<th>detail</th>
			<td><textarea name="contents_detail" cols="75" rows="10" >${dto.contents_detail }</textarea></td>
		</tr>
		<tr>
			<th>rule</th>
			<td><textarea name="contents_rule" cols="75" rows="10">${dto.contents_rule }</textarea></td>
		</tr>
		<tr>
			<th>refund</th>
			<td><textarea name="contents_refund" cols="75" rows="10">${dto.contents_refund }</textarea></td>		</tr>
		<tr>
			<th>비용</th>
			<td><input type="text" name="price" value="${dto.price }"/></td>
		</tr>
		<tr>
			<th>레슨 시간</th>
			<td><input type="text" name="lesson_time" value="${dto.lesson_time }"/></td>
		</tr>
		<tr>
			<th>모집인원</th>
			<td><input type="text" name="max_student" value="${dto.max_student }" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="location" value="${dto.location }"/></td>
		</tr>
		<tr>
			<th>옵션</th>
			<td>
				<label><input type="checkbox" name = "option1" value="true" <c:if test="${dto.option1}">checked</c:if>/> 샤워장</label>
				<label><input type="checkbox" name = "option2" value="true" <c:if test="${dto.option2}">checked</c:if>/> 주차장</label>
				<label><input type="checkbox" name = "option3" value="true" <c:if test="${dto.option3}">checked</c:if>/> 냉/난방시설</label>
				<label><input type="checkbox" name = "option4" value="true" <c:if test="${dto.option4}">checked</c:if>/> 정수기</label>
				<label><input type="checkbox" name = "option5" value="true" <c:if test="${dto.option5}">checked</c:if>/> 마루바닥</label>
			</td>
		</tr>
		<tr>
			<th>매니저</th>
			<td><input type="text" name="manager_id" value="${dto.manager_id }"/></td>
		</tr>
		<tr>
			<td colspan="2"><a href="<c:url value="/lesson/List"/>">목록으로</a>
			<input type="reset" value="초기화" />
			<input type="submit" value="수정" />
			<input type="hidden" value="${nowPage }" name="nowPage"/></td>
		</tr>
	</table>
</form>