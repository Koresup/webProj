<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/gsap/3.4.2/gsap.min.js "></script>
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
       div#commu_bas_board_detail {
           border: 1px solid #d7dce2;
           padding: 20px;
           margin: 20px;
           border-radius: 25px;
       }

       div#comment_table {
           border: 1px solid #d7dce2;
           padding: 20px;
           margin: 20px;
           border-radius: 25px;
       }

       td.title {
           text-align: center;
           font-size: 40px;
       }

       td.reg_date {
           text-align: right;
       }

       td.cnt {
           text-align: right;
       }

       td.img {
           text-align: center;
       }

       td.content {
           padding: 50px;
       }

       td.upfile {
           text-align: left;
       }

       td.comment_add {
           text-align: center;
       }

       td.modiNdel {
           text-align: right;
       }

       td#comment_regdate {
           text-align: left;
       }

       button.comment_addBTN {
           margin-left: 700px;
       }

       /* 댓글 내용 창 */
       table tr td textarea {
           border: 1px solid #d7dce2;
           border-radius: 25px;
           padding: 20px;
       }

       #comment_add_txtarea {
           border: 1px solid #d7dce2;
           border-radius: 25px;
           padding: 20px;
       }

       /* 이미지 */

       ul,li{
       margin:0px; padding:0px; list-style:none; 
       }
       #container{
       width:1000px; margin:100px auto;
       }
       #navi{
       width:300px; height:500px; position:relative; left:0px; top:0px; 
       float:left; overflow:hidden; margin-right:50px;
       }
       ul#img_list{
       height:420px;
       }
       ul#img_list li{   
       width:140px; height:95px; float:left; border:solid 3px white; opacity:0.5;
       margin:2px; -webkit-transition:0.3s ease; 
       }  
       ul#img_list li.selected{
       opacity:1; border:solid 3px yellow;
       }
       div#page{
       width:300px; float:left;
       }
       #main{
       width:650px; float:left;
       }
       #main img{
       position:absolute; border:3px solid white;
       }    
    </style>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
    

    <div id="main_wrap">
        <div>
            <h2 id="main_title">농구 자유게시판 상세보기</h2>
        </div>
        <hr>
        <div id="commu_bas_board_detail">
            <table class="table">
                <tr>
                    <td class="title" colspan="4">${dto.title }</td>
                </tr>
                <tr>
                    <td class="user_id" colspan="2">${dto.user_id }</td>
                    <td class="reg_date">작성일 : <fmt:formatDate value="${dto.reg_date }" pattern="YYYY-MM-dd HH:mm"/></td>
                    <td class="cnt">조회 : ${dto.cnt }</td>
                </tr>
                <tr>
                    <td class="img" colspan="4">
                
                        <div id="container">
                            <div id="navi">
                                <div id="page">
                                    <ul id="img_list">
                                        <li><a href="#"><img src="images/photo1_thum.jpg" alt="" /></a></li>
                                        <li><a href="#"><img src="images/photo2_thum.jpg" alt="" /></a></li>
                                        <li><a href="#"><img src="images/photo3_thum.jpg" alt="" /></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div id="main">
                                <img src="images/photo1.jpg" alt="" />
                            </div>
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="content" colspan="4"> ${dto.contentBr }</td>
                </tr>
                <tr>
                    <c:if test="${dto.img != null }">
                    <td>첨부파일</td>
                    <td class="upfile" colspan="3">
                        
                        <c:choose>
                                <c:when test="${dto.upfile }">
                                    파일 링크
                                </c:when>
                                <c:otherwise>
                                    <a href="">첨부파일.hwp</a>
                                </c:otherwise>
                            </c:choose>
                    </td>
                    </c:if>
                    </td>
                </tr>
                <tr>
                    <td class="toList" colspan="2">
                        
                        <a href="<c:url value="/commu_bas/board/List?page=${nowPage }"/>"><button>목록으로</button></a>
                    </td>
                    <td class="modiNdel" colspan="2">
                    	<a href="<c:url value="/commu_bas/board/InsertForm?page=${nowPage }"/>"><button>글쓰기</button></a>
                    	<a href="<c:url value="/commu_bas/board/ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button>수정</button></a>
                    	<a href="<c:url value="/commu_bas/board/DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>"><button>삭제</button></a>
                    </td>
                </tr>

                <!-- 댓글 추가  -->
                <tr>
                    <td class="comment_add" colspan="4">
                        <textarea name="comment_input" id="comment_add_txtarea" cols="90" rows="5"
                            style="resize:none;"></textarea><br>
                        <button class="comment_addBTN" type="button" onclick="commentInsert()">댓글입력</button>
                        <input type="hidden" name="post_id" value="${dto.post_id }" />
                    </td>
                </tr>
            </table>
        </div>

        <!-- 댓글 리스트 -->
        <div id="comment_table">
            <table class="comment_table" align="center">
                <c:forEach var="comment_dto" items="${comment_dto }" varStatus="no">
                    <tr>
                        <!-- 댓글 내용 -->
                        <td class="comment_list" colspan="4">
                            <textarea name="commentList" id="input_${comment_dto.comment_id}" cols="80" rows="3"
                                style="resize:none;" disabled>${comment_dto.content}</textarea>
                        </td>
                    </tr>
                    <tr>
                        <!-- 댓글 작성자 -->
                        <td>
                            ${comment_dto.comment_writer } <input type="hidden" id="writer_${comment_dto.comment_id }"
                                value="${comment_dto.comment_writer }" />
                        </td>
                        <!-- 댓글 작성일 -->
                        <td id="comment_regdate">
                            <fmt:formatDate value="${comment_dto.reg_date }" pattern="yyyy-MM-dd HH:mm" />
                            <input type="hidden" id="reg_date_${comment_dto.comment_id }"
                                value="${comment_dto.reg_date }" />
                        </td>
                        <!-- 댓글 수정 버튼 -->
                        <td>
                            <button type="button" name="commentEdit" idx_data="${comment_dto.comment_id}"
                                onclick="commentModify(this)">수정</button>
                        </td>
                        <!-- 댓글 삭제 버튼 -->
                        <td>
                            <button type="button" idx_data="${comment_dto.comment_id}"
                                onclick="commentDelete(this)">삭제</button>
                        </td>
                    </tr>
                </c:forEach>
            </table>
        </div>
        <div id="post_bottom">

        </div>
    </div>


    <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
    <script>
        function commentInsert() {
            console.log("dklfjsldkf");
            var comment = document.getElementsByName("comment_input")[0].value;
            location.href = '/proj_04_minsoo/comment/Insert?post_id=${dto.post_id }&page=${nowPage }&user_id=${dto.user_id}&comment=' + comment;
        }

        function commentModify(me) {
            var com_area = $('#input_' + $(me).attr('idx_data'))

            if ($(me).html() == '수정') {
                com_area.attr('disabled', false)
                $(me).html('완료');
            } else {
                com_area.attr('disabled', true)
                $(me).html('수정');

                var commentData = new Object();
                commentData.comment_input = com_area.val();
                commentData.post_id = "${dto.post_id}";
                commentData.comment_id = $(me).attr('idx_data');
                commentData.writer = $('#writer_' + $(me).attr('idx_data')).val();
                commentData.reg_date = $('#reg_date_' + $(me).attr('idx_data')).val();

                $.ajax({
                    url: '/proj_04_minsoo/comment/Modify',
                    data: commentData,
                    type: 'POST',
                    success: function (result) {
                        alert("수정되었습니다.")
                        console.log(commentData);
                    },
                    error: function (e) {
                        console.log(e);
                    }
                })
            }
        }

        function commentDelete(me) {

            var commentData = new Object();
            commentData.comment_id = $(me).attr('idx_data');

            $.ajax({
                url: '/proj_04_minsoo/comment/Delete',
                data: commentData,
                type: 'POST',
                success: function (result) {
                    location.reload();
                    alert("삭제되었습니다.")
                },
                error: function (e) {
                    console.log(e);
                }
            })
        }
    </script>
    