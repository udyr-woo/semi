<%--
 *
 * fileName       : index (파일명)
 * author         : 이재원 (작성자)
 * date           : 2023/04/5 (생성일 또는 최종 수정일)
 * description    : 회원가입 페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/05       이재원           파일 생성 및 CRUD 구현
 * 2023/04/17		이재원			 화면배치 완료(mypage, _modify, _remove, _ticket)
 * 2023/04/21		이재원			 마이페이지 진입화면 수정
 * 2023/04/24		이재원			 화면배치 및 intro 화면 배치 완료
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<style>
.container_header{
	text-align: left;
}
.more_btn {
	float: right;
	font-weight: bold;
}
.table_spase {
	width : 100%;
	border-bottom : 1px black;
	display: inline-block;
	padding-top: 15px;
}
.table_spase a{
	font-weight: bold;
	font-size: 15px;
	bottom: 0;
}

</style>
<head>
 	<jsp:include page="../common/head.jsp"/>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="Movie Pro" />
	<meta name="keywords" content="Movie Pro" />
	<meta name="author" content="" />
	<meta name="MobileOptimized" content="320" />

</head>

<body class="booking_type_back">
<jsp:include page="../common/header.jsp"/>

	<div class="st_bcc_main_main_wrapper float_left">
		<div class="st_bcc_main_wrapper">
			<div class="container">
				<div class="col-md-3">
					<div class="prs_mcc_left_side_wrapper">
						<div class="prs_mcc_bro_title_wrapper">
							<h2>My Service</h2>
						<ul>
							<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/member/mypage_ticket">예매 확인/취소</a> 
							</li>
							<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/member/mypage_modify">개인정보 수정</a>
							</li>
							<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
								<a href="${pageContext.request.contextPath}/member/mypage_remove">회원 탈퇴</a> 
							</li>
						</ul>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-md-8">
						<div class="st_bcc_heading_wrapper float_left container_title">
							<h3>My Service</h3>
						</div>
					</div>
					<div class="col-md-8">
						<div class="st_bcc_ticket_boxes_wrapper float_left">
							<div class="st_bcc_tecket_top_hesder float_left container_header">
							<img src="${pageContext.request.contextPath}/resources/images/mypage/game-01.jpg" alt="img">
								<p>${member.memberName} 님 안녕하세요!</p>
							</div>
							<div class="table_spase"> 
								<h3>나의 예매 정보<a href="${pageContext.request.contextPath}/member/mypage_ticket" 
								class="more_btn">더보기 &nbsp;&nbsp; >&nbsp;&nbsp;</a></h3>
							</div>
							<div class="st_bcc_tecket_bottom_hesder float_left">
								<div class="st_bcc_tecket_bottom_left_wrapper">
									<div class="st_bcc_tecket_bottom_inner_left">
									<div class="st_bcc_teckt_bot_inner_img">
										<img src="${pageContext.request.contextPath}/resources/images/mypage/slamdunkposter.jpg" alt="img">
									</div>
									<div class="st_bcc_teckt_bot_inner_img_cont">
										<h2>예매번호</h2> <span></span>
										<h2>영 화 명</h2> <span></span>
										<h3>상 영 관</h3> <span></span>
										<h3>관람 일시</h3> <span></span>
										<h3>상영 일시</h3> <span></span>
									</div>
									</div>
								</div>
							</div>
						</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>


</script>
</html>