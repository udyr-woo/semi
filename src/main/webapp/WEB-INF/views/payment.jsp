<%--
 *
 * fileName       : payment (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/09 (생성일 또는 최종 수정일)
 * description    : 메인페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/09       우성준           파일생성, 카카오페이 결제창 띄움
 * 2023/04/10		우성준			 결제 페이지 UI구현
 * 2023/04/19		김성진			 결제 페이지 UI수정
 * 
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
  <style>
  	.btn {
  		background-color: red;
  		color : white;
  		margin: 12px;
    	width: 365px;
  	}
  	
  	.st_dtts_wrapper {min-height: 500px;}
  </style>
  <jsp:include page="common/head.jsp"/>
    <!-- jQuery -->
    <script
      type="text/javascript"
      src="https://code.jquery.com/jquery-1.12.4.min.js"
    ></script>
    <!-- iamport.payment.js -->
    <script
      type="text/javascript"
      src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"
    ></script>
    <script>
     
    </script>
    <meta charset="UTF-8" />
    <title>영화사이트</title>
  </head>
 <body class="booking_type_back">
	<jsp:include page="common/header.jsp"/>
	<!-- st top header Start -->
	<!-- st dtts section Start -->
	<div class="st_dtts_wrapper float_left">
		<div class="container">
			<div class="row">
				<div class="col-xl-8 col-lg-8 col-md-12 col-sm-12 col-12">
					<div class="st_dtts_left_main_wrapper float_left">
						<div class="row">
							<div class="col-md-12">
								<div class="st_dtts_ineer_box float_left">
									<ul>
										<li><span class="dtts1">영    화</span>  <span class="dtts2">${ticket.cinema.movieName}</span>
										</li>
										<li><span class="dtts1">영화관</span>  <span class="dtts2">${ticket.cinema.cinemaRegion}</span>
										</li>
										<li><span class="dtts1">상영관</span>  <span class="dtts2">${ticket.cinema.theaterName}</span>
										</li>
										<li><span class="dtts1">상영시간</span>  <span class="dtts2"><fmt:formatDate value="${ticket.cinema.screenTimes[0].screenTimeTime}" type="time" timeStyle="short" /></span>
										</li>
										<li><span class="dtts1">좌석</span>
											<span class="dtts2" id="chr">
											${ticket.seats}
											</span>
										</li>

									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-xl-4 col-lg-4 col-md-12 col-sm-12 col-12">
					<div class="row">
						<div class="col-md-12">
							<div class="st_dtts_bs_wrapper float_left">
								<div class="st_dtts_bs_heading float_left">
									<p>결제 정보</p>
								</div>
								<div class="st_dtts_sb_ul float_left">
									<ul>
										<li>좌석 
											<br> <span  id="chr2"></span>
										</li>
										<li>할인적용 <span>0</span>
										</li>
									</ul>
									
								</div>
								<div class="st_dtts_sb_h2 float_left">
									<h5>최종결제금액 <span id="chr3"></span></h5>
								</div>
							</div>
						</div>
					</div>
				</div>
				<form class="submit" name="ticketForm" action="payment_processing" id="frm" method="post">
				
					<input type="hidden" name="memberid" value="${member.memberId}">
					<input type="hidden" name="ctno" value="${ticket.ctno}">
					<input type="hidden" name="date" value="${ticket.date}">
					<c:forEach items="${ticket.seats}" varStatus="stat">
					<input type="hidden" name="seats[${stat.index}].x" value="${ticket.seats[stat.index].x}">
					<input type="hidden" name="seats[${stat.index}].y" value="${ticket.seats[stat.index].y}">
					</c:forEach>
					<button class="btn pull-right request">결제하기</button>
					<div id="ticketFormDiv">
					</div>
				</form>
			</div>
		</div>
	</div>
	<jsp:include page="common/footer.jsp"/>
	<script>
		 var memberId = '${member.memberId}'
		 var total = '${fn:length(ticket.seats)}';
		 var price = total * 14000;
		 var movieName = '${ticket.cinema.movieName}';
		 var uuid = self.crypto.randomUUID();
		 document.getElementById("chr2").innerHTML = total; 
		 document.getElementById("chr3").innerHTML = price; 
		 var IMP = window.IMP;
	      IMP.init("imp88538820");
	      $(".request").on("click", function() {
	  		event.preventDefault();
	        IMP.request_pay(
	          {
	            pg: "kakaopay",
	            pay_method: "card",
	            merchant_uid: uuid,
	            buyer_name: memberId,
	            name: movieName,
	            amount: price
	          },
	          function (rsp) {
	            // callback
	            if (rsp.success) {
	            	console.log(rsp)
	            	console.log(rsp.success)
	            	// db 에 ticket테이블에 저장
					var str = ""; 
					str += `<input type="hidden" name="resno" value="\${uuid}">`;
					$("#ticketFormDiv").html(str);
					console.log($(ticketForm).serializeArray())
					$(ticketForm).submit();
	            } else {
	            	alert("결제를 실패했습니다 홈으로 돌아갑니다")
	            	location.replace('${pageContext.request.contextPath}/')
	            }
	          }
	        );
	     })
/* 	var chr = String.fromCharCode(65 + ${ticket.seatx}) + ${ticket.seaty};
		console.log(chr);
		document.getElementById("chr").innerHTML = chr;
		document.getElementById("chr2").innerHTML = chr; */
		 
		
	</script>
  </body>
</html>
