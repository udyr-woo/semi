<%--
 *
 * fileName       : head (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/07 (생성일 또는 최종 수정일)
 * description    : 공통 UI 분리  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        우성준           파일생성
 * 2023/04/12		 우성준			  푸터에서 제이쿼리를 옮김, moment.js 추가
 * 
 * 
 * --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<meta charset="utf-8" />
	<title>semi</title>
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<!--Template style -->
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/animate.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/font-awesome.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/fonts.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/flaticon.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.carousel.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/owl.theme.default.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/dl-menu.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/nice-select.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/magnific-popup.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/venobox.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/layers.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/navigation.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/settings.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/style.css" />
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/resources/css/responsive.css" />
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"/>
	<!-- favicon links -->
	<link rel="shortcut icon" type="image/png" href="${pageContext.request.contextPath}/resources/images/favicon.ico" />
	<style>
		.logo-img img {
			width: 200px;
		}
		.prs_navigation_main_wrapper {
			background-color: rgb(24, 22, 37);
		}
		.container-fluid {
			margin-top: 45px;
			margin-bottom: 40px;
		}
		.prs_animate_btn1 .button--tamaya {
			margin: 0 10px;
		}
		.prs_footer_main_section_wrapper{
			background-color: rgb(24, 22, 37);
		}
		.rev_slider_wrapper {
			background:none;
		}
		.prs_title_main_sec_wrapper {
			background:none;
		}
		.ck-editor__editable {
			height:300px;
		}
	</style>
	<script src="${pageContext.request.contextPath}/resources/js/jquery_min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/moment.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.4/locale/ko.min.js"></script>
	<script src="https://cdn.ckeditor.com/ckeditor5/37.0.1/classic/ckeditor.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/ckeditor5/37.0.1/translations/ko.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.13.2/jquery-ui.min.js"></script>