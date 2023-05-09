<%--
 *
 * fileName       : gallery (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/17 (생성일 또는 최종 수정일)
 * description    : 영화소개게시판  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/17		 우성준			 파일 생성
 * 
 --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 	<jsp:include page="../common/head.jsp"/>
<style>
	.prs_gallery_main_section_wrapper {
		background-color: rgb(24, 22, 37);
	}
	
	.prs_heading_section_wrapper h2 {
		color: white;
	}
	
</style>
</head>

<body>
	<jsp:include page="../common/header.jsp"/>
	<!-- prs gallery wrapper Start -->
	<div class="prs_gallery_main_section_wrapper">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
					<div class="prs_heading_section_wrapper">
						<h2>상영 정보</h2>
					</div>
				</div>
				<div class="portfolio-area ptb-100">
					<div class="container">
						<div class="row three-column">
							<div class="clearfix">
							<c:forEach items="${movies}" var="movie">
								<div class="col-xs-12 col-sm-6 col-md-3 portfolio-wrapper III_column" data-groups='["all", "website", "logo"]'>
									<div class="portfolio-thumb">
										<div class="gc_filter_cont_overlay_wrapper prs_ms_scene_slider_img">
											<div class="prs_ms_scene_img_overlay" style=" cursor: pointer;" onclick="location.href='getMovie?movieNum=${movie.movieNum}'">
											<img src="https://bluetea.cloud/cdn/poster/${movie.poster}.jpg" class="zoom image img-responsive" alt="service_img" />
											<a><i class="flaticon-tool"></i></a>
											</div>
										</div>
									</div>
									<!-- /.portfolio-thumb -->
								</div>
								</c:forEach>
							</div>
							<!--/#gridWrapper-->
						</div>
						<!-- /.row -->
					</div>
					<!-- /.container -->
				</div>
				<!--/.portfolio-area-->
			</div>
		</div>
	</div>
	<!-- prs gallery wrapper End -->
<jsp:include page="../common/footer.jsp"/>
</body>

</html>