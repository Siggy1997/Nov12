<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/docMain.css">
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.css" />
<script src="https://cdn.jsdelivr.net/npm/swiper@11/swiper-bundle.min.js"></script>
<script src="./js/jquery-3.7.0.min.js"></script> 
<script type="text/javascript">
</script>

</head>
<body>
	<header>icon icon</header>
	
	<div class="advertisment">
		<div class="swiper">
			<!-- Additional required wrapper -->
			<div class="swiper-wrapper">
				<!-- Slides -->
				<c:forEach var="img" items="${hospital.himg.split(',') }">
					<img class="swiper-slide" alt="" src="${img }">
				</c:forEach>
			</div>
		</div>
	</div>
	
	<!-- 본문내용 -->
	<main>
	<h1>DocMain</h1>
	<h3>${docMainDetail.hname}</h3>
	<h3>닥터 ${sessionScope.mname} 님 반갑습니다.</h3>
	<button type="button" onclick="location.href='/login'">로그인</button>
	<button type="button" onclick="location.href='/logout'">로그아웃</button>
	<button type="button" onclick="location.href='/hospitalDetail/${sessionScope.mno}/${sessionScope.dno}'">병원정보</button>
	<button type="button" onclick="location.href='/doctorDetail/${sessionScope.mno}/${sessionScope.dno}'">닥터정보</button>
	<button type="button" onclick="location.href='/docReception/${sessionScope.mno}/${sessionScope.dno}'">접수내역</button>
	<button type="button" onclick="location.href='/qna/${sessionScope.mno}/${sessionScope.dno}'">Q&A답변</button>
	<h3>실시간 접수내역 확인하기 ></h3>
        <table class="table">
      <thead>
        <tr>
          <th style="width:100px; min-width: 100px; max-width: 100px;">환자명</th>
          <th style="width:100px; min-width: 100px; max-width: 100px;">신청과</th>
          <th style="width:150px; min-width: 150px; max-width: 150px;">증상</th>
          <th style="width:100px; min-width: 100px; max-width: 100px;">대기상태</th>
        </tr>
      </thead>
      <tbody>
        <c:forEach items="${telehealthHistory}" var="row">
          <tr>
            <td style="width:100px; min-width: 100px; max-width: 100px;">${row.mname}</td>
            <td style="width:100px; min-width: 100px; max-width: 100px;">${row.dpkind}</td>
            <td style="width:150px; min-width: 150px; max-width: 150px;">${row.tsymptomdetail}</td>
					<c:choose>
					<c:when test="${row.tstatus eq 0}">
					<td style="width: 100px; min-width: 100px; max-width: 100px;"
						class="tstatus">진료대기</td>
					</c:when>
					<c:when test="${row.tstatus eq 1}">
						<td style="width: 100px; min-width: 100px; max-width: 100px; color: blue"
						class="tstatus">진료완료</td>
					</c:when>
					<c:otherwise>
						<td style="width: 100px; min-width: 100px; max-width: 100px; color: red"
						class="tstatus">진료취소</td>
					</c:otherwise>
					</c:choose>
          </tr>
        </c:forEach>
      </tbody>
    </table>
    </main>
    
    <script type="text/javascript">
		//스와이퍼 시작
		const swiper = new Swiper('.swiper', {
			// Optional parameters
			direction : 'horizontal',
			loop : true,
			autoplay : {
				delay : 2000, // 3초마다 변경
			},

		});
	</script>
    
</body>
</html>