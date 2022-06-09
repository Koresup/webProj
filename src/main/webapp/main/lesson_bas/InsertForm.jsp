<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>레슨 게시글 작성하기</h2>

<form action="InsertReg" method="post" enctype="multipart/form-data">
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
			<td><input type="text" name="sname" placeholder="레슨명" /></td>
		</tr>
		<tr>
			<th>이미지</th>
			<td><input type="file" name="img" multiple/></td>
		</tr>
		<tr>
			<th>info</th>
			<td><textarea name="contents_info" cols="75" rows="10" placeholder="정보를 입력하세요"></textarea></td>
		</tr>
		<tr>
			<th>detail</th>
			<td><textarea name="contents_detail" cols="75" rows="10" placeholder="상세사항을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<th>rule</th>
			<td><textarea name="contents_rule" cols="75" rows="10" placeholder="규칙을 입력하세요"></textarea></td>
		</tr>
		<tr>
			<th>refund</th>
			<td><textarea name="contents_refund" cols="75" rows="10" placeholder="환불규정을 입력하세요"></textarea></td>		</tr>
		<tr>
			<th>비용</th>
			<td><input type="text" name="price" /></td>
		</tr>
		<tr>
			<th>레슨 시간</th>
			<td><input type="text" name="lesson_time" /></td>
		</tr>
		<tr>
			<th>모집인원</th>
			<td><input type="text" name="max_student" /></td>
		</tr>
		<tr>
			<th>주소</th>
			<td><input type="text" name="location" /></td>
		</tr>
		<tr>
			<th>옵션</th>
			<td>
				<label><input type="checkbox" name = "option1" value="true"/> 샤워장</label>
				<label><input type="checkbox" name = "option2" value="true"/> 주차장</label>
				<label><input type="checkbox" name = "option3" value="true"/> 냉/난방시설</label>
				<label><input type="checkbox" name = "option4" value="true"/> 정수기</label>
				<label><input type="checkbox" name = "option5" value="true"/> 마루바닥</label>
			</td>
		</tr>
		<tr>
			<th>매니저</th>
			<td></td>
		</tr>
		<tr>
			<td colspan="2"><a href="<c:url value="/lesson/List"/>">목록으로</a>
			<input type="reset" value="초기화" />
			<input type="submit" value="작성" /></td>
		</tr>
	</table>
</form>
