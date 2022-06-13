<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<style>
h2#main_title {
	margin: 20px;
}

div#main_wrap {
	width: 1243px;
	height: auto;
	margin-left: auto;
	margin-right: auto;
}

div#searching {
	margin: 5px;
	text-align: center;
}

/* th */
th.num {
	width: 150px;
	text-align: center;
}

th.title {
	width: 600px;
	text-align: center;
}

th.user_id {
	width: 150px;
}

th.reg_date {
	width: 200px;
	text-align: center;
}

th.cnt {
	width: auto;
	text-align: center;
}

/* td */
td.num {
	text-align: center
}

td.title {
	padding-left: 30px !important;
}

td.reg_date {
	text-align: center;
}

td.cnt {
	text-align: center;
}

td.paging {
	text-align: center;
	padding-top: 25px;
}

td.writing {
	text-align: right;
}

td.BTNnewWrite {
	text-align: right;
}
</style>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<div id="main_wrap">
	<div>
		<h2 id="main_title">농구 자유게시판 리스트</h2>
	</div>
	<hr>
	<div id="commu_bas_board">
		<table class="table table-hover">
			<thead>
				<tr>
					<th class="num" scope="col">번호</th>
					<th class="title" scope="col">제목</th>
					<th class="user_id" scope="col">작성자</th>
					<th class="reg_date" scope="col">작성일</th>
					<th class="cnt" scope="col">조회</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="dto" items="${mainData }" varStatus="no">
					<tr>
						<td class="num" scope="row">${start + no.index }</td>
						<td class="title"><a href="<c:url value="/commu_bas/board/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">${dto.title }</a></td>
						<td class="user_id">${dto.user_id }</td>
						<td class="reg_date"><fmt:formatDate value="${dto.reg_date }" pattern="yyyy-MM-dd" /></td>
						<td class="cnt" scope="col">${dto.cnt }</td>
						
					</tr>
				</c:forEach>

			</tbody>
			<tfoot>
				<tr>
					<td class="BTNnewWrite" colspan="5"><a
						href="<c:url value="/commu_bas/board/InsertForm?page=${nowPage }"/>"><button>새글쓰기</button></a></td>
				</tr>
				
				<!-- 페이징 -->
				<tr>
					<td class="paging" colspan="5">
						<nav aria-label="Page navigation example">
				            <ul class="pagination justify-content-center">
							<c:if test="${pageStart > 1 }">
								<li class="page-item disabled"><a class="page-link" href="<c:url value="/commu_bas/board/SearchList?page=${pageStart - 1 }&field=${param.field }&search=${param.search }"/>">[이전]</a></li>
							</c:if>	
							<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
								<c:choose>
									<c:when test="${nowPage ==i }">
				                        <li class="page-item"><a class="page-link" href="#">${i }</a></li>
									</c:when>
									<c:otherwise>
										<li class="page-item"><a class="page-link" href="<c:url value="/commu_bas/board/SearchList?page=${i }&field=${param.field }&search=${param.search }"/>">${i }</a></li>
									</c:otherwise>
								</c:choose>
							</c:forEach>
							<c:if test="${pageEnd<pageTotal }">
								<li class="page-item"><a class="page-link" href="<c:url value="/commu_bas/board/SearchList?page=${pageEnd + 1 }&field=${param.field }&search=${param.search }"/>">[다음]</a></li>
							</c:if>	
				            </ul>
			            </nav>
					</td>
				</tr>

			</tfoot>

		</table>
	</div>
	<div id="searching">
		<form action="SearchList" method="post">
	<select name="field" id="">
        <option value="list">전체</option>
        <option value="title">제목</option>
        <option value="user_id">작성자</option>        
      </select>

		<input type="text" name = "search" />

	<input type="submit"  value="검색"/>
</form>
	</div>
</div>
