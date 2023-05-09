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
<style>
	.st_slider_index_sidebar_main_wrapper_booking {background-color: white}
	.ui-selected {background:#ddd}
</style>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
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
					<li class="active"> 
						<a data-toggle="tab" href="#home"><span>수</span> 
						<br>19</a>
					</li>
					<li>
						<a data-toggle="tab" href="#menu1"> <span>목</span> 
							<br>20</a>
					</li>
					<li>
						<a data-toggle="tab" href="#menu2"> <span>FRI</span> 
							<br>21</a>
					</li>
					<li>
						<a data-toggle="tab" href="#menu3"> <span>SAT</span> 
							<br>22</a>
					</li>
					<li>
						<a data-toggle="tab" href="#menu4"> <span>SUN</span> 
							<br>23</a>
					</li>
				</ul>
			</div>
		</div>
	</div>
	<!-- st slider rating wrapper End -->

	<!-- 영화, 극장, 시간 선택 시작 -->
	<div class="st_slider_index_sidebar_main_wrapper st_slider_index_sidebar_main_wrapper_booking float_left">
		<div class="container">
			<div class="col-md-4" ">
			<h3>영화</h3>
			<ul style="height: 300px; overflow-y:auto; overflow-x:hidden;" id="movieListUL">
				<%-- <c:forEach items="${movies}" var="movie">
					<li class="movieNumSelectOne" data-movienum='${movie.movieNum}'>
					<label>
						<input type="radio" class="btn st_calender_row_cont3" style="background-color: white" id=movie data-movie="${movie.movieName}" name="movie">								
							<span class="movie-grade small age-12"><img src="${pageContext.request.contextPath}/resources/images/${movie.movieRating.toLowerCase()}.svg" alt=""></span>
							<span class="txt">${movie.movieName}</span>
					</label>
					</li>
				</c:forEach> --%>
			</ul>
			</div>
			<div class="col-md-2">
				<h3>극장</h3>
				<ul id="cinemaListUL">
				<c:forEach items="${cinemas}" var="cinema">
					<li class="cinemaNum" data-cinemanum="${cinema.cinemaNum}">
						<button type="button" class="btn st_calender_row_cont3" style="background-color: white">
							<span class="txt">${cinema.cinemaRegion}</span>
						</button>
					</li>
				</c:forEach>
				</ul>
			</div> 
			<div class="col-md-6">
				<!-- st slider sidebar wrapper Start -->
				<h3>상영시간</h3>
				<div id="theaterArea">
				<c:forEach items="${theaters}" var="theater" >
				<div class="st_calender_row_cont float_left" style="border-bottom: 1px solid; border-color: #dddddd; margin: 7px; ">
					<div class="st_calender_asc">
							<h4>${theater.theaterName}</h4>
					</div>
					<div class="st_calen_asc_tecket_time_select">
						<ul>
							<c:forTokens items="11:30 AM,02:45 PM,06:30 PM,10:00 PM" delims="," var="time">
							<li>
								<span>
								<p class="asc_pera1">310 / 320 좌석</p>
								</span>
								<a href="${pageContext.request.contextPath}/seatBooking">${time}</a>
							</li>
							</c:forTokens>
						</ul>
					</div>
				</div>
				</c:forEach>
				</div>							
				<!-- st slider sidebar wrapper End -->
			</div> 
		</div>
	</div>
	<script>
	$(function() {
		// 오늘 날짜에 대한 7일 간의 날짜 표시
		var str = "";
		var date = '${date}';
		var movieNum = '${movieNum}';
		console.log(date);
		console.log(movieNum);
		for(var i = 0 ; i < 7 ; i++) {
			var tmp = moment().add(i, 'days');
			str += `<li class="\${i == 0 ? 'active' : ''}"> 
						<a data-toggle="tab" href="#home"><span>\${tmp.format('dd')}</span> 
						<br>\${tmp.format('DD')}</a>
					</li>`;
		}
		$(".st_calender_tabs ul").html(str);
		
		$("#movieListUL").selectable({
			stop : function(data) {
				var movienum = $(".ui-selected").data("movienum")
				var url = `/json/movie/\${date}/\${movienum}`;
				$.getJSON(url, function(data) {
					var str = "";
					console.log(data);
					if(data.length) {
						for(var i in data) 
					 	str += `<li class="cinemaNum" data-cinemanum="\${data[i].cinemaNum}">
									<a type="button">
										<span class="txt">\${data[i].cinemaRegion}</span>
									</a>
								</li>`	
					}
					else {
						str = "<li class='empty'>상영관이 없습니다</li>";
					}
					$("#cinemaListUL").html(str);
				}) 
			}
		});
		
		$("#cinemaListUL").selectable({
			stop : function(data) {
				var cinemanum = $(".ui-selected", this).data("cinemanum");
				var movienum = $("#movieListUL .ui-selected").data("movienum");
				
				var url = `/json/movie/\${date}/\${movienum}/\${cinemanum}`;
				console.log(url);
				
				$.getJSON(url, function(data) {
					var str = "";
					console.log(data);
					for(var i in data) {
						str += `<div class="st_calender_row_cont float_left" style="border-bottom: 1px solid; border-color: #dddddd; margin: 7px; ">
									<div class="st_calender_asc">
										<h4>\${data[i].theaterName}</h4>
									</div>
									<div class="st_calen_asc_tecket_time_select">
										<ul>`;
							for(var j in data[i].screenTimes)	 {			
						str +=				`<li>
												<span>
												<p class="asc_pera1">\${data[i].remain} / 200 좌석</p>
												</span>
												<a href="${pageContext.request.contextPath}/seatBooking" data-timenum="\${data[i].screenTimes[j].screenTimeNum}">\${data[i].screenTimes[j].screenTimeTime}</a>
											</li>`
							}
						str +=			`</ul>
									</div>
								</div>`;
					}
					$("#theaterArea").html(str); 
				})  
			}
		});
		
		$.ajax({
			url : "/json/movie/" + date,
			dataType : "json",
			success : function(data) {
				var str = ""; 
				console.log(data);
				for(var i in data) {
					str += `<li class="movieNumSelectOne" data-movienum="\${data[i].movieNum}">
						<span class="movie-grade small "><img src="/resources/images/\${data[i].movieRating}.svg" alt=""></span>
						<span class="txt">\${data[i].movieName}</span>
					</li>`;	
				};
				$("#movieListUL").html(str);
			}
		})
		
		// 영화선택에 대한 값 확인
		$("#movieListUL").on("change", ":radio", function(){
			var movienum = $(this).closest("li").data("movienum");
			console.log(movienum)
		})
		
		// 극장선택에 대한 값 확인
		$(".cinemaNum").on("click", function(){
			var param = $(this).data("cinemanum");
			var obj = JSON.parse(param);
			console.log(param);
		})
		
	
	})
	
	</script>
<jsp:include page="common/footer.jsp" />
</body>

</html>