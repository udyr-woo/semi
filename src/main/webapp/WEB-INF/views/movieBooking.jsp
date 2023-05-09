<!-- 

/**
 * fileName       : movieBooking
 * author         : 김성진
 * date           : 2023/04/07
 * description    : 예매사이트
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        김성진           파일생성
 * 2023/04/09        김성진           내용수정(배경 style 추가)
 * 2023/04/12		 김성진			  내용수정(feedback 적용)
 * 2023/04/13		 김성진			  내용수정(상영관, 상영시간 조회) 
 * 
 */

 -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core"  prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions"  prefix="fn"%>
<!DOCTYPE html>
<html lang="ko">

<head>
<jsp:include page="common/head.jsp" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="https://jqueryui.com//resources/demos/style.css">
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
	.movie-booking-column > h3{margin-bottom:20px}
	.movie-booking-wrapper {height: 400px; overflow-y:auto; overflow-x:hidden;}
	.movie-booking-select-wrap input[type='radio'] {display: none;}  
	.movie-booking-select-wrap li {padding: 4px;}
	.movie-booking-select-wrap .active {background-color: #222; color: white;}
	.movie-booking-select-wrap .active_red {background-color: red; color: white;}
	
	.v-align-bottom {vertical-align: bottom;}
	.movie-grade {margin-right:8px;}
	.opt-50 {opacity: .5}
	
	.st_calender_contant_main_wrapper {padding: 10px 20px;}
	.st_calender_row_cont {padding:30px 0 10px;}
	.st_calender_row_cont:last-child {border-bottom: 0;}
	.st_calen_asc_tecket_time_select {float: none; margin:20px 0 0;}
	
	.st_calen_asc_tecket_time_select li {margin:0 15px 15px 0;}
	.st_calen_asc_heart_cont {float: none; width: inherit; padding: 0;}
	
	.st_calen_asc_tecket_time_select mark {padding: 12px; line-height: 37px; font-size: 12px; color: #ddd; background: transparent;}
	.st_slider_index_sidebar_main_wrapper .container {position: relative;}
	.st_slider_index_sidebar_main_wrapper .submit {position: absolute; right: 34px; bottom: 22px; }
	.st_slider_index_sidebar_main_wrapper .submit i {color: red; }
	.st_slider_index_sidebar_main_wrapper .submit .btn {background: transparent; font-size: 3em; transition:all .3s }
	.st_slider_index_sidebar_main_wrapper .submit .btn:DISABLED {opacity: 0}
	
</style>
</head>

<body>
<jsp:include page="common/header.jsp" />

	<!-- prs title wrapper Start -->
	<div class="prs_title_main_sec_wrapper">
		<div class="prs_title_img_overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="prs_title_heading_wrapper">
						<h2>영화 예매</h2>
						<ul>
							<li><a href="${pageContext.request.contextPath}/">Home</a>
							</li>
							<li>&nbsp;&nbsp; >&nbsp;&nbsp; 영화 예매</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- prs title wrapper End -->
	
	<!-- st slider rating wrapper Start -->
	<div class="st_slider_rating_main_wrapper float_left">
		<div class="container">
			<div class="st_calender_tabs">
				<ul class="nav nav-tabs">
				</ul>
			</div>
		</div>
	</div>
	<!-- st slider rating wrapper End -->

	<!-- 영화, 극장, 시간 선택 시작 -->
	<div class="st_slider_index_sidebar_main_wrapper st_slider_index_sidebar_main_wrapper_booking float_left">
		<div class="container">
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12 movie-booking-column movie-column">
					<h3>영화</h3>
					<div class="st_indx_slider_main_container ">
						<div class="row">
							<div class="col-md-12">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
										<div class="st_calender_contant_main_wrapper ">
											<ul id="movieListUL" class="movie-booking-wrapper movie-booking-select-wrap">
        										
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-2 col-md-2 col-sm-12 col-xs-12 movie-booking-column cinema-column">
					<h3>극장</h3>
					<div class="st_indx_slider_main_container ">
						<div class="row">
							<div class="col-md-12">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
										<div class="st_calender_contant_main_wrapper ">
											<ul id="cinemaListUL" class="movie-booking-wrapper movie-booking-select-wrap">
											</ul>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12 movie-booking-column theater-column">
					<h3>상영시간</h3>
					<div class="st_indx_slider_main_container ">
						<div class="row">
							<div class="col-md-12">
								<div class="tab-content">
									<div id="home" class="tab-pane active">
										<div class="st_calender_contant_main_wrapper ">
											<ul id="theaterListUL" class="st_calender_row_cont clearfix movie-booking-wrapper movie-booking-select-wrap">
												
											</ul>
										
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<form class="submit" name="seatForm" action="seatBooking">
				<input type="hidden" name="movieNum" >
				<input type="hidden" name="date" >
				<input type="hidden" name="cinemaNum" >
				<input type="hidden" name="theaterno" >
				<input type="hidden" name="screenTimeNum" >
				<button class="btn" disabled><span>좌석 선택</span> <i class="fas fa-arrow-circle-right"></i></button>
			</form>
		</div>
	</div>
	<script>
	$(function() {
		// 전역변수
		var date = '${date}';
		
		displayDate();
		listMovieList();
		
		// 초기화
		function init() {
			$("#cinemaListUL").html("");
			$("#theaterListUL").html("");
			$(".submit .btn").prop("disabled", true);
			$(".submit :hidden").val("");
		}		
		
		
		// 오늘 날짜에 대한 7일 간의 날짜 표시
		function displayDate(pDate) {
			var date = pDate ? pDate : '${date}' ;
			
			var str = "";
			for(var i = 0 ; i < 7 ; i++) {
				var tmp = moment().add(i, 'days');
				str += `<li class="\${i == 0 ? 'active' : ''}" data-date="\${tmp.format('yyMMDD')}"> 
							<a data-toggle="tab" href="#home"><span>\${tmp.format('dd')}</span> 
							<br>\${tmp.format('DD')}</a>
						</li>`;
			}
			$(".st_calender_tabs ul").html(str);
		}
		
		
		
		// 영화목록
		function listMovieList() {
			init();
			$.getJSON("${pageContext.request.contextPath}/json/movie/" + date, function(data) {
				var str = ""; 
				for(var i in data) {
					str += 
					`<li data-movienum='\${data[i].movieNum}'>
						<label>
							<span class="movie-grade small age-12"><img src="${pageContext.request.contextPath}/resources/images/\${data[i].movieRating}.svg" alt=""></span>
							<span class="txt v-align-bottom">\${data[i].movieName}</span>
						</label>
					</li>`;
				};
				$("#movieListUL").html(str);
			})
		}
		
		// 영화관목록
		function getCinemaList() {
			if($(".cinema-column ul li").hasClass("active") && !confirm("영화 선택을 변경하시면 지정된 값이 초기화 됩니다. 계속 진행하시겠습니까?")) {
				return;
			}
			init();
			
            $(this).closest(".movie-booking-select-wrap").find("li").removeClass("active");
            var $li = $(this).closest("li");
            if($li.hasClass("empty")) return;
            
            
            $li.addClass("active")
            var movieNum = $(this).data("movienum")
			var url = `${pageContext.request.contextPath}/json/movie/\${date}/\${movieNum}`;
			$.getJSON(url, function(data) {
				var str = "";
				if(data.length) {
					for(var i in data) {
				 		str += 
						`<li data-cinemanum="\${data[i].cinemaNum}">
							<label><span class="txt">\${data[i].cinemaRegion}</span></label>
						</li>`;
					}
				}
				else {
					str = "<li class='empty opt-50'>상영관 없음</li>";
				}
				$("#cinemaListUL").html(str); 
			})
		}
		
		// 상영관목록
		function getTheaterList() {
            $(this).closest(".movie-booking-select-wrap").find("li").removeClass("active");
            var $li = $(this).closest("li");

            if($li.hasClass("empty")) return;
            var movieNum = $(".movie-column ul li").filter(".active").data("movienum");
            console.log(movieNum)
            $li.addClass("active")
            var cinemaNum = $(this).data("cinemanum")
			var url = `${pageContext.request.contextPath}/json/movie/\${date}/\${movieNum}/\${cinemaNum}`;
			$.getJSON(url, function(data) {
				var str = "";
				if(data.length) {
					for(var i in data) {
				 		str += 
						` <li data-cinemanum="\${data[i].cinemaNum}" data-movienum="\${data[i].movieNum}" data-theaterno="\${data[i].theaterno}">
							<div class="st_calen_asc_heart_cont">
								<h3>\${data[i].theaterName} <span>(총 184석)</span> </h3>
							</div>
							<div class="st_calen_asc_tecket_time_select clearfix">
								<ul>
						`;
						for(var j in data[i].screenTimes) {
						str += `
									<li data-screentimenum="\${data[i].screenTimes[j].screenTimeNum}">
										<a title="종료시간 \${moment(data[i].screenTimes[j].screenTimeTime).add(2,"h").format('LT')}">\${moment(data[i].screenTimes[j].screenTimeTime).format('LT')}</a>
										<mark>\${data[i].screenTimes[j].remain}석</mark>
									</li>`
						}
						str += `
								</ul>
							</div>
						</li>`;
					}
				}
				else {
					str = "<li class='empty opt-50'>없음</li>";
				}
				
				$("#theaterListUL").html(str); 
				
			})
        }
		
		// 날짜 선택시 이벤트
		$(".st_calender_tabs").on("click", "li", function() {
			if($(".movie-column ul li").hasClass("active") && !confirm("날짜 선택을 변경하시면 지정된 값이 초기화 됩니다. 계속 진행하시겠습니까?")) {
				return;
			}
			console.log($(this).data("date"));
			date = $(this).data("date");
			listMovieList();
		})
		
		// 영화 선택시 이벤트
		$("#movieListUL").on("click", "li", getCinemaList);
		
		// 상영관 선택시 이벤트
		$("#cinemaListUL").on("click", "li", getTheaterList);
		
		// 시간 선택시 이벤트
		$("#theaterListUL").on("click", ".st_calen_asc_tecket_time_select li a", function() {
			 $li = $(this).closest(".movie-booking-select-wrap").find("a").removeClass("active_red").end().end().addClass("active_red").closest("li");
			 var screenTimeNum = $li.data("screentimenum");
			 console.log(screenTimeNum);
			 $li = $li.parent().closest("li");
			 var cinemaNum = $li.data("cinemanum");
			 var movieNum = $li.data("movienum");
			 var theaterno = $li.data("theaterno");
			 
			 $(document.seatForm.theaterno).val(theaterno);
			 $(document.seatForm.date).val(date);
			 $(document.seatForm.cinemaNum).val(cinemaNum);
			 $(document.seatForm.movieNum).val(movieNum);
			 $(document.seatForm.screenTimeNum).val(screenTimeNum);
			 
			 $(".submit .btn").prop("disabled", false);
			 
		})
		
		
		
		// 툴팁 박스
		$(".st_calen_asc_tecket_time_select a").tooltip({
			track: true,			
			position: {
		        my: "center bottom-20",
		        at: "center top"
			}
		});
	})
	
	</script>
<jsp:include page="common/footer.jsp" />
</body>

</html>