<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>


  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet">
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

    div#bottom {
      width: 100%;
      height: 100px;
      background: #ff953e;
    }


    div.gym_list {
      margin-bottom: 20px;
      margin-left: 0px;
      border: 1px solid black;
    }

    div#contents_wrap div.gym_list:last-child {
      margin-bottom: 0px;
    }

    div.gym_item_img {
      padding: 0px;
    }

    div.gym_item_img>img {
      padding: 0px;
      margin: 0px;
    }

    div.gym_item_info {
      margin-left: 0px;
      padding: 0px;
    }

    div.gym_info_date {
      font-size: 20px;
      padding: 0px;
      padding-left: 20px;
      margin-top: 5px;
    }

    div.gym_info_address {
      text-align: right;
      line-height: 50px;
      padding-right: 20px;
    }

    div.gym_info_bottom {
      margin: 0 auto;      
    }

    div.gym_info_bottom_row {
      width: 95%;
      margin: 0px auto;
    }

    div.res_time_div {
      text-align: center;
    }

    div.res_time_text {
      float: left;
      background: #eee;
    }

    div.option_div {
      width: 500px;
      margin: 0px auto;
      background: #eee;
      margin-bottom: 10px;
      margin-top: 20px;
    }
    .text-center {
      margin: 10px 0px 10px 0px;
    }
    .enrollment {
      width: 100%;
      margin: 15px auto auto auto ;
    }
    .enrollment>button{
      width: 30%;
      margin: auto;
      display: block;
    }
    
  </style>

  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>


<div id="main_wrap">
	<div>
		<h2 id="main_title">?????? ?????? ?????????</h2>
	</div>
	<hr>
	<div id="lesson_bas_list">
	
		<c:forEach var="dto" items="${mainData }" varStatus="no">
		<main class="flex-shrink-0">
			<div id="contents_wrap">
				<div class="row gym_list">
					<div class="col-sm-5 gym_item_img">
						<!-- ????????? ?????? ?????? 520x290 -->
						<img src="<c:url value="/uploadFile/lesson_bas/${fn:split(dto.img, ',')[0]}"/>" class="figure-img img-fluid rounded;"
							alt="" style="width: 520px; height: 350px; " id="listImg">
					</div>

					<div class="col-sm-7 right-note gym_item_info">
						<div class="row">
							<div class="col-sm-4 gym_info_date">${dto.lesson_time }</div>
							<div class="col gym_info_address">${dto.location }</div>
						</div>
						<div class="row">
							<div class="col">
								<p class="text-center fs-3 fw-bold">
									<a href="<c:url value="/lesson_bas/Detail?post_id=${dto.post_id }&page=${nowPage }"/>">${dto.sname }</a>
								</p>
							</div>
						</div>
						<div class="row">
							<div class="col gym_info_bottom">
								<div class="row gym_info_bottom_row">
									<div class="lesson_category" style="float: left; width: 33%;" align="center"> ${dto.category }</div>
									
									<div class="lesson_expense" style="float: left; width: 34%;" align="center">?????? : ${dto.price } ???</div>
									<div class="max_student" style="float: left; width: 33%;" align="left">???????????? : 1??? / ${dto.max_student }???</div>
									
									
									<div class="row" style="margin-top: 30px; margin-left: 10px;">
                            	 
                            	 
						              <div class="col" style="margin: 0px; padding:0px">
						                 <c:choose>
						                    <c:when test="${dto.option1 }">
						                       <img src="<c:url value="/uploadFile/resource/option1.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:when>
						                    <c:otherwise>
						                       <img src="<c:url value="/uploadFile/resource/option1_f.png"/>" alt="" style="width: 110px; ">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:otherwise>
						                 </c:choose>
						              </div>
						              
						              <div class="col" style="margin: 0px; padding:0px">
						                 <c:choose>
						                    <c:when test="${dto.option2 }">
						                       <img src="<c:url value="/uploadFile/resource/option2.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:when>
						                    <c:otherwise>
						                       <img src="<c:url value="/uploadFile/resource/option2_f.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:otherwise>
						                 </c:choose>
						              </div>
						              
						              <div class="col" style="margin: 0px; padding:0px">
						                 <c:choose>
						                    <c:when test="${dto.option3 }">
						                       <img src="<c:url value="/uploadFile/resource/option3.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">???/???????????? <br>??????</div>
						                    </c:when>
						                    <c:otherwise>
						                       <img src="<c:url value="/uploadFile/resource/option3_f.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">???/???????????? <br>??????</div>
						                    </c:otherwise>
						                 </c:choose>
						              </div>
						              
						              <div class="col" style="margin: 0px; padding:0px">
						                 <c:choose>
						                    <c:when test="${dto.option4 }">
						                       <img src="<c:url value="/uploadFile/resource/option4.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:when>
						                    <c:otherwise>
						                       <img src="<c:url value="/uploadFile/resource/option4_f.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">????????? <br>??????</div>
						                    </c:otherwise>
						                 </c:choose>
						              </div>
						              
						              <div class="col" style="margin: 0px; padding:0px">
						                 <c:choose>
						                    <c:when test="${dto.option5 }">
						                       <img src="<c:url value="/uploadFile/resource/option5.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">???????????? <br>??????</div>
						                    </c:when>
						                    <c:otherwise>
						                       <img src="<c:url value="/uploadFile/resource/option5_f.png"/>" alt="" style="width: 110px;">
						                      <div class="text-center fs-5 fw-bold" style="margin-top: 10px;">???????????? <br>??????</div>
						                    </c:otherwise>
						                 </c:choose>
						              </div>
						            </div>
									
									
									
									
									
								</div>
							</div>
						</div>
						<div class="enrollment" style="margin-bottom: 10px;">
							<button>
								<a href="???????????? ??????"></a>????????????
							</button>
						</div>
					</div>
				</div>
				
				
			</div>
			</main>
			</c:forEach>
			<br />
			<div id="newPost" align="right">
				<a href="<c:url value="/lesson_bas/InsertForm?page=${nowPage }"/>"><button>????????????</button></a>
			</div>
			<hr />
			<nav aria-label="Page navigation example">
		<ul class="pagination justify-content-center">
			<c:if test="${pageStart > 1 }">
				<li class="page-item">
					<a class="page-link" href="<c:url value="/lesson_bas/List?page=${pageStart - 1 }&field=${param.field }&search=${param.search }"/>">??????</a>
				</li>
			</c:if>
			<c:forEach var="i" begin="${pageStart }" end="${pageEnd }" step="1">
				<c:choose>
					<c:when test="${nowPage == i }">
						<li class="page-item disabled">
							<a class="page-link" href="<c:url value="/lesson_bas/List?page=${i }&field=${param.field }&search=${param.search }"/>">${i }</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="page-item"><a class="page-link" href="<c:url value="/lesson_bas/List?page=${i }&field=${param.field }&search=${param.search }"/>">${i }</a>
						</li>
					</c:otherwise>
				</c:choose>
	
			</c:forEach>
			<c:if test="${pageEnd<pageTotal }">
				<li class="page-item"><a class="page-link"
					href="<c:url value="/lesson_bas/List?page=${pageEnd + 1 }&field=${param.field }&search=${param.search }"/>">??????</a>
				</li>
			</c:if>
		</ul>
		<hr />
	</nav>
	
<div id="searching">
    <form action="SearchList" method="post">
      <select name="field" id="">
        <option value="list">??????</option>
        <option value="sname">??????</option>
        <option value="category">????????????</option>
      </select>
      <input type="text" name="search" />
      <input type="submit" value="??????" />
    </form>
  </div>
	</div>
</div>
<br>

  