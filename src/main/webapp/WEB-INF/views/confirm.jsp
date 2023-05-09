<%--
 *
 * fileName       : confirm (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/18 (생성일 또는 최종 수정일)
 * description    : 결제완료페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/18        우성준           파일생성
 * 
 * 
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="common/head.jsp" />
<style>
.st_bcc_tecket_bottom_left_wrapper:after {
	height : 0;
}
.st_bcc_tecket_bottom_left_price_wrapper {
    float: left;
    width: calc(121% - 200px);
}
.st_bcc_main_main_wrapper {
	min-height: 1000px;
}
</style>
</head>

<body>
	<!-- preloader Start -->
	<jsp:include page="common/header.jsp" />
	<!-- prs navigation End -->
	<div class="st_bcc_main_main_wrapper float_left">
		<div class="st_bcc_main_wrapper">
			<div class="container">
					<div class="col-md-12">
						<div class="st_bcc_ticket_boxes_wrapper float_left">
							<div class="st_bcc_tecket_top_hesder float_left">
								<p>결제 완료</p>
								<span>${resno}</span>
							</div>
							<div class="st_bcc_tecket_bottom_hesder float_left">
								<div class="st_bcc_tecket_bottom_left_wrapper">
									<div class="st_bcc_tecket_bottom_inner_left">
										<div class="st_bcc_teckt_bot_inner_img_cont">

											<h4>${cinema.movieName}</h4>
											<h5>${cinema.cinemaRegion}, ${cinema.theaterName}</h5>
											<h3><fmt:formatDate value="${cinema.screenTimes.get(0).screenTimeTime}" type="time" timeStyle="short" /></h3>
											<h6>
												Carnival: WKKL
											</h6>

										</div>
										<div class="st_purchase_img">
											<img src="${pageContext.request.contextPath}/resources/images/content/pur2.png" alt="img">
										</div>
									</div>
									<div class="st_bcc_tecket_bottom_inner_right">
										<i class="fas fa-chair"></i>
										<h3>
											${tickets.size()} 장 <br> <span id="chr"> </span>
										</h3>
									</div>
								</div>
								<div class="st_bcc_tecket_bottom_left_price_wrapper">
									<h4>Total Amount</h4>
									<h5 id="price"></h5><h5>₩</h5>
								</div>
							</div>
						</div>
						<div class="st_bcc_ticket_boxes_bottom_wrapper float_left">
							<p>
								해당티켓은 마이페이지에서 확인 하실 수 있습니다.<br>
							</p>
							<ul>
								<li><a href="${pageContext.request.contextPath}/">홈</a></li>
								<li><a href="#">마이페이지</a></li>
							</ul>
						</div>
					</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var price = ${tickets.size()} * 14000;
	document.getElementById("price").innerHTML = price;
	</script>
	<jsp:include page="common/footer.jsp" />
</body>

</html>