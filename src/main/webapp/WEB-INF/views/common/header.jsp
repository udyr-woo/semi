<%--
 *
 * fileName       : header (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/07 (생성일 또는 최종 수정일)
 * description    : 공통 UI 분리  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07       우성준           파일생성
 * 2023/04/11		이재원			 login, logout 기능 완료, jquery 추가.
 * 2023/04/12		이재원			 UI 배치 및 작업
 * 2023/04/12		우성준		 	 예매 버튼 경로 수정
 * 2023/04/13       이재원           로그인, 회원가입 css 수정 및 추가
 * 2023/04/14		우성준 		 	 제이쿼리 위치 헤드로 옮김 및 경로 수정
 * 2023/04/17		우성준 		 	 영화소개게시판 경로 추가
 * 2023/04/21		 이재원			 jquery, 경로 수정
 * --%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="preloader">
	<div id="status">
		<img src="${pageContext.request.contextPath}/resources/images/header/horoscope.gif"	id="preloader_image" alt="loader">
	</div>
</div>
<!-- 고정될 header 부분 로그인 전과 후를 c:if를 통해서 사용자에게 출력 -->
<div class="prs_navigation_main_wrapper">
	<div class="container-fluid">
		<div class="menu-left col-md-4">
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/movie/movieList" class="button button--tamaya" data-text="movie"><span>영화</span></a>
			</div>
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/review/reviewList" class="button button--tamaya" data-text="Review Board"><span>리뷰게시판</span></a>
			</div>
		</div>
		<div class="logo-img col-md-4 text-center">
			<a href="${pageContext.request.contextPath}/"> <img
				src="${pageContext.request.contextPath}/resources/images/header/logo.png"
				alt="logo" />
			</a>
		</div>
		<div class="menu-right col-md-4" id="header">
			<c:if test="${empty member}">
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/movieBooking" class="button button--tamaya" data-text="booking"><span>예매</span></a>
			</div>
			<div class="prs_animate_btn1">
				<a href="#" class="button button--tamaya" data-text="login" data-toggle="modal" data-target="#myModal"><span>로그인</span></a>
			</div>
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/member/signup_contract" class="button button--tamaya " data-text="signup"><span>회원가입</span></a>				
			</div>
			</c:if>
			<c:if test="${not empty member}">
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/movieBooking" class="button button--tamaya" data-text="booking"><span>예매</span></a>
			</div>
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/member/mypage" class="button button--tamaya " data-text="MYPAGE"><span>마이페이지</span></a>
			</div>
			<div class="prs_animate_btn1">
				<a href="${pageContext.request.contextPath}/member/logout" class="button button--tamaya " data-text="LOGOUT">로그아웃</a>
			</div>
			</c:if>
		</div>
	</div>
</div>
