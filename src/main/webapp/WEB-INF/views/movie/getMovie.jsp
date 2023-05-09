<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
<style>
 	.prs_ec_ue_left_img_wrapper img{
		height: 470px;
		width: 65%;
	
	}
	.prs_ec_ue_left_img_wrapper {
		margin-right: -200px;
	}
	.prs_ec_ue_right_img_wrapper {
		width: 67%;
	}
	.hs_kd_six_sec_btn li a {
		margin-bottom: 20px;
	}
	body{
	    background: #f6f6f6;	 
	}
	.prs_ec_ue_right_img_cont .prs_up_pera_sec {
    	line-height: 2.0em;
    }
    .prs_feature_img_cont h2 a {
    	font-size:1.1em;
    }
    .submitForm {
    	margin-bottom: 20px;
    }
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
	<div class="prs_ec_ue_main_section_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="prs_ec_ue_left_img_wrapper">
						<img src="https://bluetea.cloud/cdn/poster/${movie.poster}.jpg" alt="event_img">
					</div>
					<div class="prs_ec_ue_right_img_wrapper">
						<div class="prs_feature_img_cont prs_ec_ue_right_img_cont">
							<h2><a href="#">${movie.movieName}</a></h2>
							<div class="prs_ft_small_cont_left">
								<p>${movie.poster}</p>
							</div>
							<div class="prs_ft_small_cont_right">	
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star"></i>
								<i class="fa fa-star-o"></i>
								<i class="fa fa-star-o"></i>
							</div>
							<ul>
								<li>${movie.genre}</li>
								<li>개봉일자 : <fmt:formatDate value="${movie.movieOpenDate}" pattern="y/MM/dd" type="date"/></li>
							</ul>
							<p class="prs_up_pera_sec">${movie.info}</p>
						</div>			
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="container">
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="prs_bs_comment_heading_wrapper">
					<h2>관람평</h2>
				</div>
			</div>
			<div class="review">
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="hs_kd_six_sec_btn">
					<button class="btn btn-danger btn-more">더보기</button>
				</div>
			</div>
			<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
				<div class="prs_bs_comment_heading_wrapper prs_bs_leave_comment_heading_wrapper">
					<h2>관람평 남기기</h2>
				</div>
			</div>
			<div id="frm">
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					<div class="hs_kd_six_sec_input_wrapper">
						<label for="title">title</label> 
						<input type="text" class="form-control" placeholder="Enter title" id="title" name="reviewTitle">
					</div>
				</div>
				<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					<div class="hs_kd_six_sec_input_wrapper">
						<label for="title">writer</label> 
						<input type="text" class="form-control" placeholder="Enter title" id="writer" name="memberId" readonly value="${member.memberId}">
					</div>
				</div>
<!-- 			<div class="col-lg-6 col-md-12 col-sm-12 col-xs-12">
					<div class="pull-right">
						<input type="radio" id="up" name="up" value="on" hidden="hidden">
						<i class="fa fa-thumbs-up fa-3x" aria-hidden="true"></i>
      					<label for="up"></label>
      				</div>
					<div class="pull-right">
						<input type="radio" id="dowm" name="down" value="off" hidden="hidden">
						<i class="fa fa-thumbs-down fa-3x" aria-hidden="true"></i>
      					<label for="down"></label>
      				</div>
				</div> -->
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="hs_kd_six_sec_input_wrapper">
						<label for="comment">content</label> 
						<textarea rows="6" class="form-control" placeholder="Enter content" id="comment" name="reviewContent"></textarea>
					</div>
				</div>
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="response"></div>
					<div class="prs_contact_input_wrapper prs_contact_input_wrapper2">
						<ul>
							<li>
								<button type="button" class="submitForm sac">등록</button>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
	var cp = '${pageContext.request.contextPath}';
</script>
<script>
let editor;
ClassicEditor.create($('#comment').get(0), {
	ckfinder : {
    	uploadUrl : '/ckImage.json'
    },
	toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ]
})
.then(function(a) {
	editor = a;
});
</script>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/review.js"></script>
<script type="text/javascript">
$(function(){
	var movieNum = '${movie.movieNum}';
	moment.locale('ko');
	reviewService.getList({movieNum:movieNum}, function(result){
		var str = "";
		for(var i in result) {
			str += getReviewLiStr(result[i]);
		}
		$(".review").html(str);
	});
	function getReviewLiStr(obj){
		return `<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" data-reviewno="\${obj.reviewNo}">
				<div class="hs_rs_comment_main_wrapper" style=" cursor: pointer;" onclick="location.href='\${cp}/review/getReview?reviewNo=\${obj.reviewNo}'">
				<div class="hs_rs_comment_img_cont_wrapper hs_rs_blog_single_comment_img_cont_wrapper">
				<h2>\${obj.memberId}<br> <span>\${moment(obj.reviewUpdatedate).fromNow()}</span></h2>
				<p>\${obj.reviewTitle}</p>
				</div>
				</div>
				</div>`;
	}
	// 글작성이벤트
	$(".sac").click(function() {
		var obj = {movieNum:movieNum, reviewTitle:$("#title").val(), reviewContent:editor.getData(), memberId:$("#writer").val()}
		reviewService.add(obj, function(result) {
 			$("#frm").find("#title").val("");
 			editor.setData("");
			reviewService.get(result, function(data) {
				$(".review").prepend(getReviewLiStr(data)); 
			})
		});
	});
	$(".btn-more").click(function() {
		var reviewNo = $(".review > .col-lg-12:last").data("reviewno");
		console.log(reviewNo);
		reviewService.getList({movieNum:movieNum, reviewNo:reviewNo}, function(result){
			console.log(result);
			if(!result.length) {
				$(".btn-more").prop("disabled", true);
				return;
			}
			var str = "";
			for(var i in result) {
				str += getReviewLiStr(result[i]);
			}
			$(".review").append(str);
		});
	})
})
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>