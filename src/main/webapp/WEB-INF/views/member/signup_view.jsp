<%--
 *
 * fileName       : signup_view (파일명)
 * author         : 이재원 (작성자)
 * date           : 2023/04/25 (생성일 또는 최종 수정일)
 * description    : 회원가입 완료 페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/25       이재원           화면배치
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<style>
body {
	background-color: white;
}
.bookingbtn {
	background-color: rgb(51, 121, 145);
	color: white;
	padding: 7px 15px;
	margin: 0px 52px;
 	width: 360px;
	font-size: 1.1em;
 }
.st_profile_input input{
	width:50%;
	height:40px;
	border: 1px solid rgba(0,0,0,0.38);
	border-radius: 4px;	
	padding-left:20px;
	-webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;
    margin-top : 31px;
    margin-left: 250px;
}

.body-wrap {
	margin-left : auto;
	margin-right : auto;
	margin-bottom : 150px;
	margin-top : 270px;
	width : 987px;
 	height : 800px;
	position: relative;
	display: flex;
}
.st_profile_input label {
    color: #ff4444;
    font-size: 12px;
    background: #fff;
    position: relative;
    top: -23px;
    left: 300px;
    font-weight: 600;
    padding: 0px 10px;    
 } 
.body-step {
	margin-left : auto;
	margin-right : auto;
	width : 100%;
	height : 65px;
	position: absolute;
}
.body-step img {
	width: 300px;
	margin-left: 342px;
    margin-bottom: 30px;
}
.body-step h2{	
	text-align: center;
	vertical-align: bottom;
	color : #8065eb;
	margin-bottom: 95px;
}
.member_input {	
	height : 735px;
	position: absolute;
	bottom: 0px;
    justify-content:center;
}
#mypage_modify #register_btn {
	width : 135px;
    height: 40px;
    line-height: 0px;
    background: #503396;
    border: 0px;
    color : white;
    border-radius: 5px;
	margin: auto;
	display: block;
}
</style>
<head>
 	<jsp:include page="../common/head.jsp"/>
	<meta charset="utf-8" />
	<meta content="width=device-width, initial-scale=1.0" name="viewport" />
	<meta name="description" content="Movie Pro" />
	<meta name="keywords" content="Movie Pro" />
	<meta name="author" content="" />
	<meta name="MobileOptimized" content="320" />
</head>

<body class="booking_type_back" id="mypage_modify">
<jsp:include page="../common/header.jsp"/>
<div class="body-wrap" >
 	<div class="body-step">
	<a href="${pageContext.request.contextPath}/"> <img
		src="${pageContext.request.contextPath}/resources/images/header/logo.png"
		alt="logo" />
	</a>
 	   <h2>회원 가입을 환영 합니다!</h2>
		<a href="${pageContext.request.contextPath}/"><button type="button" class="submitForm" id="register_btn">홈</button></a>	
 	</div>
</div>
	<jsp:include page="../common/footer.jsp"/>
</body>

</html>