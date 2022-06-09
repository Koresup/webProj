<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>


<h2>레슨 상세보기</h2>

<form action="RegisterForm" method="post">
<input type="hidden" name = "post_id" value="${dto.post_id }" />
<table border="">

	<tr>
		<td>카테고리</td>
		<td>${dto.category }</td>
	</tr>
	<tr>
		<td>레슨명</td>
		<td>${dto.sname }</td>
	</tr>
	<tr>
		<td>이미지</td>
		<td>
			<c:forTokens items ="${dto.img }"
				delims = "," var = "ee" varStatus="no">
				<img src="<c:url value="/uploadFile/lesson_bas/${ee}"/>" alt="" />
			</c:forTokens>
		</td>
	</tr>
	<tr>
		<td>info</td>
		<td>${dto.contents_info }</td>
	</tr>
	<tr>
		<td>detail</td>
		<td>${dto.contents_detail }</td>
	</tr>
	<tr>
		<td>rule</td>
		<td>${dto.contents_rule }</td>
	</tr>
	<tr>
		<td>refund</td>
		<td>${dto.contents_refund }</td>
	</tr>
	<tr>
		<td>비용</td>
		<td>${dto.price }</td>
	</tr>
	<tr>
		<td>레슨 시간</td>
		<td>${dto.lesson_time }</td>
	</tr>
	<tr>
		<td>모집인원</td>
		<td>${dto.max_student }</td>
	</tr>
	<tr>
		<td>주소</td>
		<td>${dto.location } <br />
			<a href="https://map.kakao.com/link/to/33.919067,-118.118731" style="color:blue" target="_blank">길찾기</a>
			<div id="map" style="width:500px;height:400px;"></div>
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5055bae492acc70f48ba8a992e50a421&libraries=services
			"></script>
			<script>
				var lat = 33.919067;
				var lng = -118.118731;
				
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
				    mapOption = {
				        center: new kakao.maps.LatLng(33.919067, -118.118731), // 지도의 중심좌표
				        level: 3 // 지도의 확대 레벨
				    };  
				
				// 지도를 생성합니다    
				var map = new kakao.maps.Map(mapContainer, mapOption); 
				
				// 주소-좌표 변환 객체를 생성합니다
				var geocoder = new kakao.maps.services.Geocoder();
				
				// 주소로 좌표를 검색합니다
				geocoder.addressSearch('${dto.location}', function(result, status) {
				
				    // 정상적으로 검색이 완료됐으면 
				     if (status === kakao.maps.services.Status.OK) {
						lat = result[0].y;
						lng = result[0].x;
						
				        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
				        // 결과값으로 받은 위치를 마커로 표시합니다
				        var marker = new kakao.maps.Marker({
				            map: map,
				            position: coords
				        });
				
				        // 인포윈도우로 장소에 대한 설명을 표시합니다
				        var infowindow = new kakao.maps.InfoWindow({
				            content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.sname}</div>'
				        });
				        infowindow.open(map, marker);
				
				        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
				        map.setCenter(coords);
				    } 
				});  
				
				function setCenter() {            
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(lat, lng);
				    
				    // 지도 중심을 이동 시킵니다
				    map.setCenter(moveLatLon);
				}
				function panTo() {
				    // 이동할 위도 경도 위치를 생성합니다 
				    var moveLatLon = new kakao.maps.LatLng(lat, lng)
				    
				    // 지도 중심을 부드럽게 이동시킵니다
				    // 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
				    map.panTo(moveLatLon);            
				} 
				</script>
		</td>
	</tr>
	<tr>
		<td>옵션</td>
		<td>샤워장 : ${dto.option1 }, 주차장 : ${dto.option2 }, 냉/난방시설 : ${dto.option3 }, 정수기 : ${dto.option4 }, 마루바닥 : ${dto.option5 }</td>
	</tr>
	<tr>
		<td>매니저</td>
		<td>${dto.manager_id }</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="<c:url value="/lesson_bas/List?page=${nowPage }"/>">목록으로</a>
			<input type="submit"  value="레슨 신청"/>
		</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="<c:url value="/lesson_bas/ModifyForm?post_id=${dto.post_id }&page=${nowPage }"/>">수정</a>
			<a href="<c:url value="/lesson_bas/DeleteForm?post_id=${dto.post_id }&page=${nowPage }"/>">삭제</a>
		</td>
	</tr>
	<tr>
		<td colspan="4" >리뷰</td>
	</tr>
	
</table>
</form>