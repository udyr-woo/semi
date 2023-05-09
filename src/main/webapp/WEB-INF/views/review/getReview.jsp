<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<jsp:include page="../common/head.jsp"/>
<style>
.modify, .remove, .back {
	float: left;
    width: 170px;
    height: 50px;
    text-align: center;
    line-height: 48px;
    color: #ffffff;
    border: 1px solid transparent;
    border-radius: 10px;
    transition: all 0.5s;
}

.modify {
	background: gold;
	margin-right: 10px;
}

.remove {
	background: #ff4444;
}

.back {
	background: blue;
}
.prs_contact_form_main_wrapper {
	min-height: 1000px;
}
</style>
</head>
<jsp:include page="../common/header.jsp"/>
 
 <body>	
 	<div class="prs_contact_form_main_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 col-md-8 col-sm-12 col-xs-12">
					<div class="prs_contact_left_wrapper">
						<h2>리뷰</h2>
					</div>
					<div class="row">
						<form method="post">
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="prs_contact_input_wrapper">
									<label for="title">title</label> 
									<input type="text" class="form-control" placeholder="Enter title" id="title" name="reviewTitle" value="${review.reviewTitle}">
								</div>
							</div>
							<div class="col-lg-6 col-md-6 col-sm-12 col-xs-12">
								<div class="prs_contact_input_wrapper">
									<label for="title">writer</label> 
									<input type="text" class="form-control" placeholder="Enter title" id="writer" name="memberId" readonly value="${review.memberId}">
								</div>
							</div>
							<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
								<div class="prs_contact_input_wrapper">
									<label for="comment">content</label> 
									<textarea rows="12" class="form-control" placeholder="Enter content" id="comment" name="reviewContent" readonly>${review.reviewContent}</textarea>
								</div>
							</div>
							<div class="col-lg-9 col-md-9 col-sm-12 col-xs-12">
								<div class="hs_kd_six_sec_input_wrapper">
									<ul>
										<li>
											<button class="modify" formaction="modify">수정</button>
										</li>
										<li>
											<button class="remove" formaction="remove">삭제</button>
										</li>
									</ul>
								</div>
							</div>
							<input type="hidden" name="reviewNo" value="${review.reviewNo}">
							<input type="hidden" name="movieNum" value="${review.movieNum}">
							<input type="hidden" name="pageNum" value="${cri.pageNum}">
							<input type="hidden" name="amount" value="${cri.amount}">
							<input type="hidden" name="type" value="${cri.type}">
							<input type="hidden" name="keyword" value="${cri.keyword}">
							<input type="hidden" name="link" value="${link}">
						</form>
						<div class="col-lg-3 col-md-3 col-sm-12 col-xs-12">
							<div class="hs_kd_six_sec_input_wrapper">
								<ul>
									<li>
										<button type="button" class="back" onclick="history.back()">뒤로가기</button>
									</li>
								</ul>
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
					<div class="portfolio-thumb">
						<div class="gc_filter_cont_overlay_wrapper prs_ms_scene_slider_img">
							<div class="prs_ms_scene_img_overlay" style=" cursor: pointer;" onclick="location.href='${pageContext.request.contextPath}/movie/getMovie?movieNum=${movie.movieNum}'">
								<img src="https://bluetea.cloud/cdn/poster/${movie.poster}.jpg" class="zoom image img-responsive">
								<a><i class="flaticon-tool"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

<script>
ClassicEditor.create($('#comment').get(0), {
	ckfinder : {
    	uploadUrl : '/ckImage.json'
    },
    toolbar: [ 'heading', '|', 'bold', 'italic', 'link', 'bulletedList', 'numberedList', 'blockQuote' ]
});
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>