<%--
 *
 * fileName       : seatBooking
 * author         : 김성진
 * date           : 2023/04/09
 * description    : 좌석페이지
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/09       김성진           파일생성
 * 2023/04/11		우성준			 좌석 페이지와 결제페이지 연결
 * 2023/04/17		김성진			 좌석페이지(좌석 생성, 인원선택에 따른 좌석선택)
 * 2023/04/20		김성진			 moviebooking 데이터 연동
 * 2023/04/21		김성진			 moviebooking 데이터 연동
 * 2023/04/24		김성진			 moviebooking 데이터 연동
 * 2023/04/25		김성진			 payment로 데이터 연동
 * 2023/04/25		우성준			 좌석 선택에 따른 위치값 출력
 * 
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="common/head.jsp" />
<style>
.text_row li:not(.st_seat_heading_row) {width: 50px; margin-right:0; text-align: center;}
li.st_seat_heading_row {width: 12px} 
</style>
</head>

<body>
	<!-- preloader Start -->
	<div id="preloader">
		<div id="status">
			<img src="${pageContext.request.contextPath}/resources/images/header/horoscope.gif" id="preloader_image" alt="loader">
		</div>
	</div>
	<!-- color picker start -->
	
	<!-- st top header Start -->
	<div class="st_bt_top_header_wrapper float_left">
		<div class="container container_seat">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="st_bt_top_back_btn st_bt_top_back_btn_seatl float_left">
					<a href="${pageContext.request.contextPath}/movieBooking"><i class="fas fa-long-arrow-alt-left"></i> &nbsp;Back</a>
					</div>
					<div class="cc_ps_quantily_info cc_ps_quantily_info_tecket">
						<p>예매할 인원 선택</p>
						<div class="select_number">
							<button onclick="changeQty(1); return false;" class="increase"><i class="fa fa-plus"></i>
							</button>
							<input type="text" name="quantity" value="1" size="2" id="input-quantity" class="form-control" />
							<button onclick="changeQty(0); return false;" class="decrease"><i class="fa fa-minus"></i>
							</button>
						</div>
					<input type="hidden" name="product_id" />
				</div>
					</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="st_bt_top_center_heading st_bt_top_center_heading_seat_book_page float_left">
	
						<h3> ${cinema.movieName}</h3>
						<c:set var="num" value="${cinema.screenTimeNum}"></c:set>
						<c:set var="time" value="${cinema.screenTimes[num].screenTimeTime}"></c:set>
						
						<h4 style="letter-spacing: 4.44px;"> 상영정보 : ${cinema.cinemaRegion} / ${cinema.theaterName} / <fmt:formatDate value="${time}" type="time" timeStyle="short" /></h4>
						<h4 style="letter-spacing: 4.44px;">선택좌석 : </h4><h4 id="multiPrint" style="letter-spacing: 4.44px;"></h4>

					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="st_bt_top_close_btn st_bt_top_close_btn2 float_left"><a href="${pageContext.request.contextPath}/"><i class="fa fa-times"></i></a>
					</div>
					<div class="st_seatlay_btn float_left payment">	
						<a href="#" >Proceed to Pay</a>
						<form class="submit" name="ticketForm" action="payment" id="frm" method="post">
							<input type="hidden" name="ctno" >
							<input type="hidden" name="date" value="${date}">
							<div id="ticketFormDiv">
							</div>
						</form>
						<script>
						</script>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- st top header Start -->
	<!-- st seat Layout Start -->
	<div class="st_seatlayout_main_wrapper float_left">
		<div class="container container_seat">
			<div class="st_seat_lay_heading float_left">
				<h3>상영관</h3>
			</div>
			<div class="st_seat_full_container">
				<div class="st_seat_lay_economy_wrapper float_left">
					<div class="screen">
						<img src="${pageContext.request.contextPath}/resources/images/content/screen.png">
					</div>
					<div class="st_seat_lay_economy_heading float_left">
						<h3>원하시는 좌석을 선택하세요</h3>
					</div>
					
					<div class="st_seat_lay_row float_left" >
						<ul class="text_row">
							<li class="st_seat_heading_row" style="margin-right: 45px;"></li>
							<c:forEach begin="1" end="5" var="seaty">
								<li>
									${seaty}
								</li>
							</c:forEach>
						</ul>
						<ul class="st_eco_second_row text_row">
							<c:forEach begin="6" end="18" var="seaty">
								<li>
									${seaty}
								</li>
							</c:forEach>
						</ul>
						<ul class="st_eco_second_row text_row" >
							<c:forEach begin="19" end="23" var="seaty">
								<li>
									${seaty}
								</li>
							</c:forEach>
						</ul>
					</div>
					
					<c:forEach begin="0" end="7" var="seatx" varStatus="seatxnum" >
						
						<div class="st_seat_lay_row float_left" >
							<ul>
								<c:set var="alpha" value="ABCDEFGH" />
								<li class="st_seat_heading_row ">${alpha.charAt(seatx)}</li>
								<c:forEach begin="1" end="5" var="seaty">
									<li>
										<input type="checkbox" id="c${seatxnum.index}-${seaty}" name="cb" data-xindex="${seatxnum.index}" data-x="${seatx}" data-y="${seaty}">
										<label for="c${seatxnum.index}-${seaty}"></label>
									</li>
								</c:forEach>
							</ul>
							<ul class="st_eco_second_row">
								<c:forEach begin="6" end="18" var="seaty">
									<li>
										<input type="checkbox" id="c${seatxnum.index}-${seaty}" name="cb" data-xindex="${seatxnum.index}" data-x="${seatx}" data-y="${seaty}">
										<label for="c${seatxnum.index}-${seaty}"></label>
									</li>
								</c:forEach>
							</ul>
							<ul class="st_eco_second_row">
								<c:forEach begin="19" end="23" var="seaty">
									<li>
										<input type="checkbox" id="c${seatxnum.index}-${seaty}" name="cb"  data-xindex="${seatxnum.index}" data-x="${seatx}" data-y="${seaty}" >
										<label for="c${seatxnum.index}-${seaty}"></label>
									</li>
								</c:forEach>
							</ul>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</div>
	<!-- st seat Layout End -->
<jsp:include page="common/footer.jsp" />

<script>
//* Isotope js
function protfolioIsotope(){
    if ( $('.st_fb_filter_left_box_wrapper').length ){ 
        // Activate isotope in container
        $(".protfoli_inner, .portfoli_inner").imagesLoaded( function() {
            $(".protfoli_inner, .portfoli_inner").isotope({
                layoutMode: 'masonry',  
            }); 
        });  
        
        // Add isotope click function 
        $(".protfoli_filter li").on('click',function(){
            $(".protfoli_filter li").removeClass("active");
            $(this).addClass("active"); 
            var selector = $(this).attr("data-filter");
            $(".protfoli_inner, .portfoli_inner").isotope({
                filter: selector,
                animationOptions: {
                    duration: 450,
                    easing: "linear",
                    queue: false,
                }
            });
            return false;
        });  
    };
}; 
protfolioIsotope (); 
	 
var qty = parseInt($('.select_number').find("input").val());
function changeQty(increase) {
	if (!isNaN(qty)) {
	    qty = increase ? qty + 1 : (qty > 1 ? qty - 1 : 1);
	    $('.select_number').find("input").val(qty);
	} else {
	    $('.select_number').find("input").val(1);
	}
}
	  
// 인원 수 선택에 따른 좌석 선택 기능
$(document).ready(function() {
    // 체크박스들이 변경됬을때
    $(":checkbox").change(function() {
        var cnt = $("#input-quantity").val();
        
        // 셀렉트박스의 값과 체크박스중 체크된 갯수가 같을때, 다른 체크박스들을 disable 처리
        if( cnt==$(":checkbox:checked").length ) {
            $(":checkbox:not(:checked)").attr("disabled", "disabled");
        }
        // 체크된 갯수가 다르면 활성화 시킴
        else {
            $(":checkbox").removeAttr("disabled");
        }
    });
     
    // 셀렉트박스에서 다른 인원수를 선택하면 초기화 시킴
    $("#input-quantity").change(function(){
        $(":checkbox").removeAttr("checked");
        $(":checkbox").removeAttr("disabled");
    });
    
});

// 좌석 선택에 따른 좌표값 넣을 배열
var chk_arr = [];

// 좌석 선택 후 해제에 따른 배열 안에 값 제거 함수
Array.prototype.remove = function(item) {
	var idx = -1;
	for(var i in this) {
		if(this[i].x == item.x && this[i].y == item.y) {
			idx = i;
		}
	}
	if(idx < 0) return null;
	return this.splice(idx, 1);
}

// 좌석 선택에 따른 값 배열에 넣기
$(":checkbox").click(function(){
//		chk_arr.push($('input[name="cb"]').data('x'), $('input[name="cb"]').data('y'));
	var x = $(this).data('x');
	var y = $(this).data('y');
	var xindex = $(this).data('xindex');
	if($(this).prop("checked")) {
		chk_arr.push({x:x, y:y});
	}
	else {
		chk_arr.remove({x:x, y:y});
		//console.log("빼기")
	}
	
	console.log(chk_arr);
	
	// 사용자가 티켓 선정에 대한 페이지에서 표시해주는 코드
	var str = "";
	for(var i =0; i<chk_arr.length; i++){
		str += "" + chk_arr[i].x + "" + chk_arr[i].y + "번 "
		
		// 선택한 좌석에 대한 x,y좌표(db에 넣어야함)
		var datax = JSON.stringify(xindex);
		var datay = JSON.stringify(chk_arr[i].y);
	}
	$("#multiPrint").html(str);

	console.log(chk_arr.length);

	// 티켓 수에 대한 티켓값 함수
	function Money() {
		var money = chk_arr.length * 14000;
		return money;
	}
	console.log(Money());
	
	console.log(datax);
	console.log(datay);
	
	$(".payment a").on("click", function() {
		event.preventDefault();		
		var ctno = '${cinema.ctno}';
		//var seats = JSON.stringify(chk_arr);
		console.log(ctno)
		console.log(chk_arr)
		
		$(ticketForm.ctno).val(ctno);
		
		//$(ticketForm.seats).val(seats);
		var str = ""; 
		for(let i = 0 ; i < chk_arr.length ; i++) {
			str += `<input type="hidden" name="seats[\${i}].x" value="\${chk_arr[i].x}">`;
			str += `<input type="hidden" name="seats[\${i}].y" value="\${chk_arr[i].y}">`;
		}
		$("#ticketFormDiv").html(str);
		console.log($(ticketForm).serializeArray())
		$(ticketForm).submit();
	})
	
	
})	
/* 		checkx = ${ticket.seatx};
		checky = ${ticket.seaty};
		
		console.log(checkx);
		console.log(ckecky); */
	// 기존에 예약된 좌석 선택불가
/* 	$(document).ready(function checkseat() {
		

			checkx = ${ticket.seatx};
			checky = ${ticket.seaty};
			x = 1
			y = 3
			if(checkx == x && checky == y) {			
				$("#c1-3").attr("disabled", true);
				<input type="checkbox" id="c1-3" name="cb" data-xindex="1" data-x="1" data-y="3" disabled>
			}		

	}); */
	
/* 	$(document).ready({
		$("input").attr("disabled", true);
	});
	function check() {
		if($("#c1-3").val() == "Y") {
			
		}
	} */

</script>
</body>

</html>