<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>게시판 디테이루</h2>

<form action="">
<table border="">
	<tr>
		<td rowspan="2">${dto.head }</td>
		<td rowspan="2">${dto.title }</td>
		<td colspan="2">${dto.user_id }</td>
	</tr>
	<tr>
		<td><fmt:formatDate value="${dto.reg_date }" pattern="yy-MM-dd HH:mm"/></td>
		<td>${dto.cnt }</td>
	</tr>
	<tr>
		<td colspan="4">
			<c:forTokens items="${dto.img }" 
				delims="," var="ee" varStatus="no">
				<img src="<c:url value="/uploadFile/commu_bas/board/${ee}"/>" alt="" />
			</c:forTokens></td>
	</tr>
	<tr>
		<td colspan="4">
		${dto.contentBr }</td>
	</tr>
	<tr>
		<c:if test="${dto.img != null }">
		<td>파일</td>
		<td colspan="3">
			<c:choose>
				<c:when test="${dto.img }">
					<img src="<c:url value="/uploadFile/commu_bas/board/${dto.img }"/>" alt="" />
				</c:when>
				<c:otherwise>
					<a href="<c:url value="/FileDown?fname=${dto.img }"/>"> ${dto.img }</a>
				</c:otherwise>
			</c:choose>
		</td>
		</c:if>
	</tr>
	<tr>
		<td colspan="2" align="right">
			<a href="<c:url value="/commu_bas/board/List?page=${nowPage }"/>">목록으로</a>
		</td>
		<td>
			<a href="<c:url value="/commu_bas/board/ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>">수정</a>
		</td>
		<td>
			<a href="<c:url value="/commu_bas/board/DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>">삭제</a>
		</td>
	</tr>
 	<tr>
      <td colspan="4" align="center">
         <textarea name="comment_input" id="" cols="90" rows="5" style="resize:none;"></textarea>
         <button type="button" onclick="commentInsert()">댓글입력</button>
         <input type="hidden" name="post_id" value="${dto.post_id }" />
      </td>
   </tr>
</table>

<table border="">
   <c:forEach var="comment_dto" items="${comment_dto }" varStatus = "no">
   <tr>
      <td  rowspan="2">
      <textarea name="commentList" id="input_${comment_dto.comment_id}" cols="80" rows="3" style="resize:none;" disabled>${comment_dto.content}</textarea>
      </td>
      <td>${comment_dto.comment_writer } <input type="hidden" id="writer_${comment_dto.comment_id }" value="${comment_dto.comment_writer }" /></td>
      <td><button type="button" name="commentEdit" idx_data="${comment_dto.comment_id}" onclick="commentModify(this)">수정</button></td>
   </tr>
   <tr>
      <td>
         <fmt:formatDate value = "${comment_dto.reg_date }" pattern="yy-MM-dd HH:mm"/>
         <input type="hidden" id="reg_date_${comment_dto.comment_id }" value="${comment_dto.reg_date }" />
      </td>
      <td>
         <button type="button" idx_data="${comment_dto.comment_id}" onclick="commentDelete(this)">삭제</button>
      </td>
   </tr>
   </c:forEach>
</table>


<script type="text/javascript"
   src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script>
function commentInsert(){
	console.log("dklfjsldkf");
   var comment = document.getElementsByName("comment_input")[0].value;
   location.href='/proj_04_minsoo/comment/Insert?post_id=${dto.post_id }&page=${nowPage }&user_id=${dto.user_id}&comment='+comment;
}

function commentModify(me){
   var com_area = $('#input_'+$(me).attr('idx_data'))   
   
   if($(me).html()=='수정'){
      com_area.attr('disabled', false)
      $(me).html('완료');
   } else {
      com_area.attr('disabled', true)
      $(me).html('수정');

      var commentData =  new Object();
      commentData.comment_input = com_area.val();
      commentData.post_id = "${dto.post_id}";
      commentData.comment_id = $(me).attr('idx_data');
      commentData.writer = $('#writer_'+$(me).attr('idx_data')).val();
      commentData.reg_date = $('#reg_date_'+$(me).attr('idx_data')).val();
                
      $.ajax({
         url:'/proj_04_minsoo/comment/Modify',
         data:commentData,
         type:'POST',
         success: function(result){
            alert("수정되었습니다.")
            console.log(commentData);
         },
         error:function(e){
            console.log(e);
         }
     })
   }
}

function commentDelete(me){
   
   var commentData =  new Object();
      commentData.comment_id = $(me).attr('idx_data');
                
      $.ajax({
         url:'/proj_04_minsoo/comment/Delete',
         data:commentData,
         type:'POST',
         success: function(result){
            location.reload();
            alert("삭제되었습니다.")
         },
         error:function(e){
            console.log(e);
         }
     })
}
</script>
</form>