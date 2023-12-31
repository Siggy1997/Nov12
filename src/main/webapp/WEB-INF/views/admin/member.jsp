<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admin || 회원 승인 및 등급</title>
<link rel="stylesheet"
	href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">
<link rel="stylesheet" href="../css/admin.css">
<link rel="stylesheet" href="../css/member.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/sweet-modal/dist/min/jquery.sweet-modal.min.css" />
<script
	src="https://cdn.jsdelivr.net/npm/sweet-modal/dist/min/jquery.sweet-modal.min.js"></script>
<script type="text/javascript">
	function gradeCh(mno, name, value, count) {
		$.sweetModal({
			content : name+'님의 등급을 변경하시겠습니까?',
			icon : $.sweetModal.ICON_WARNING,
			buttons : {
				someOtherAction : {
					label : '예',
					classes : 'blueB',
					action : function() {
						location.href="./gradeChange?mno="+mno+"&grade="+value+"&mboardcount="+count;
					}
				},
				someAction : {
					label : '아니오',
					classes : 'redB',
					action : function() {
						location.href="./member";
					}
				},
			},
			width : '70%',
		});
	}
</script>
<style type="text/css">
.sweet-modal-content {
	font-size: 35px !important;
	font-weight: 600 !important;
}

.sweet-modal-buttons {
	display: flex !important;
	justify-content: center !important;
	border-radius: 15px !important;
}

.redB, .blueB {
	font-size: 36px !important;
	width: 45% !important;
}

.btn {
	border: 0;
	background-color: #00C9FF;
	border-radius: 15px;
	color: white;
	margin-bottom: 30px;
}
</style>
</head>
<body>
	<div class="container">
		<div class="main">
			<div class="article">
				<h1>회원 관리</h1>
				<div class="div-table">
					<div class="div-row table-head">
						<div class="div-cell table-head">번호</div>
						<div class="div-cell table-head">아이디</div>
						<div class="div-cell table-head">이름</div>
						<div class="div-cell table-head">등급</div>
					</div>
					<c:forEach items="${memberList }" var="row">
						<div
							class="div-row <c:if test="${row.mgrade gt 6 }">manager</c:if><c:if test="${row.mgrade gt 4 && row.mgrade lt 7}">doctor</c:if><c:if test="${row.mgrade lt 1 }">cancel</c:if>">
							<div class="div-cell">${row.mno }</div>
							<div class="div-cell">${row.mid }</div>
							<div class="div-cell">${row.mname }</div>
							<div class="div-cell">
								<select class="grade"
									onchange="gradeCh(${row.mno }, '${row.mname }', this.value,  ${row.mboardcount })">
									<optgroup label="이용불가">
										<option value="0"
											<c:if test="${row.mgrade eq 0}">selected="selected"</c:if>>탈퇴회원</option>
										<option value="1"
											<c:if test="${row.mgrade eq 1}">selected="selected"</c:if>>휴먼계정</option>
									</optgroup>
									<optgroup label="이용가능">
										<option value="2"
											<c:if test="${row.mgrade eq 2}">selected="selected"</c:if>>일반회원</option>
										<option value="3"
											<c:if test="${row.mgrade eq 3}">selected="selected"</c:if>>우수회원</option>
										<option value="4"
											<c:if test="${row.mgrade eq 4}">selected="selected"</c:if>>VIP회원</option>
										<option value="5"
											<c:if test="${row.mgrade eq 5}">selected="selected"</c:if>>일반의사</option>
										<option value="6"
											<c:if test="${row.mgrade eq 6}">selected="selected"</c:if>>전문의사</option>
									</optgroup>
									<optgroup label="관리자">
										<option value="7"
											<c:if test="${row.mgrade eq 7}">selected="selected"</c:if>>일반관리자</option>
										<option value="8"
											<c:if test="${row.mgrade eq 8}">selected="selected"</c:if>>최고관리자</option>
									</optgroup>
								</select>
							</div>
						</div>
					</c:forEach>
					<button class="btn" onclick="location.href='./main'">돌아가기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
