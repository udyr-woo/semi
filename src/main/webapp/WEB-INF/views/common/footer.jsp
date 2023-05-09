<%--
 *
 * fileName       : footer (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/07 (생성일 또는 최종 수정일)
 * description    : 공통 UI 분리  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/07        우성준           파일생성
 * 2023/04/08        우성준           인덱스 배너 삭제 및 헤더 수정
 * 2023/04/10        우성준           기존 템플릿 클래스를 활용한 푸터 영역 조절
 * 2023/04/11        우성준           스크립트 영역 소스코드 정렬
 * 2023/04/11        이재원           로그인, 회원가입, 로그아웃 경로 수정
 * 2023/04/12		 우성준			  제이쿼리를 헤드로 옮김
 * 2023/04/13        이재원           로그인, 회원가입 css 수정 및 추가
 * 2023/04/17		 우성준			  고은채 대신 코리아
 * 2023/04/18		 이재원			  로그인 유효성 검사 완료
 * 2023/04/21		 이재원			  jquery, 경로 수정
 * 2023/04/21		 이재원			  server module 변경 관련 경로 수정
 * --%>

<style>
.login_warn {
	margin-top: 30px;
    text-align: center;
    color : red;
	}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<footer class="prs_footer_main_section_wrapper text-center">
	<div class="logo-img">
		<img
			src="${pageContext.request.contextPath}/resources/images/footer_logo.png"
			alt="">
	</div>
	<br> 2023 © AWS 풀스택 개발과정 세미프로젝트 (우성준, 김성진, 이재원 In Korea)
</footer>
<!-- END REVOLUTION SLIDER -->
<!-- st login wrapper Start -->
<div class="modal fade st_pop_form_wrapper" id="myModal" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
			  <button type="button" class="close" data-dismiss="modal">&times;</button>
			<form method="post" id="login_form" action="/member/login">
				<div class="st_pop_form_heading_wrapper float_left">
					<h3>Log in</h3>
				</div>
				<div class="st_profile_input float_left">
					<label>ID</label>
					<input type="text" name="memberId" id="memberId">
				</div>
				<div class="st_profile__pass_input st_profile__pass_input_pop float_left">
					<input type="password" placeholder="Password" name="memberPw" id ="memberPw">
				</div>
				<div class="st_form_pop_login_btn float_left">
					<input type="button" class="login_btn" value ="LOGIN">
				</div>
				<div class="st_form_pop_or_btn float_left">
					<h4>OR</h4>
				</div>
				<div class="st_form_pop_signin_btn float_left">
					<h4>회원이 아니십니까? <a href="${pageContext.request.contextPath}/member/signup_contract" target="_blank">회원가입</a></h4>
				</div>
			</form>
			</div>
		</div>
	</div>
<!-- Modal2는 아이디찾기 -->
<div class="modal fade st_pop_form_wrapper" id="myModal2" role="dialog">
	<div class="modal-dialog">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div
				class="st_pop_form_heading_wrapper st_pop_form_heading_wrapper_fpass float_left">
				<h3>Forgot Password</h3>
				<p>We can help! All you need to do is enter your email ID and
					follow the instructions!</p>
			</div>
			<div class="st_profile_input float_left">
				<label>Email Address</label> <input type="text">
			</div>
			<div class="st_form_pop_fpass_btn float_left">
				<a href="#">Verify</a>
			</div>
		</div>
	</div>
</div>
<!-- Modal3은 휴대폰 인증 -->
 <div class="modal fade st_pop_form_wrapper" id="myModal3" role="dialog">
	<div class="modal-dialog">
		<form method="post">
		<div class="modal-content">
			<button type="button" class="close" data-dismiss="modal">&times;</button>
			<div class="st_pop_form_heading_wrapper float_left">
				<h3>휴대폰 인증</h3>
			</div>	
			<div class="st_profile_input float_left">
				<label>휴대폰 번호</label> <input placeholder="'-' 없이 입력해 주세요" 
				type="text" class="user_input" id="mTel" 
				name="memberPhoneNum" >
			</div>
			<div class="st_profile_input float_left">
				<label>휴대폰 번호 인증</label> <input type="text" placeholder="인증번호를 입력해 주세요">
			</div>
			<div class="st_form_pop_login_btn float_left PhoneSubmit">
				<input type="button" class="authbtn" value ="휴대폰 인증번호 전송">
			</div>
			<div class="st_form_pop_login_btn float_left" >
				<a href="member/signup_contract" style="display:none;" class="signup_nextbtn">다음</a>
			</div>
			<div class="st_form_pop_fp float_left">
			</div>
		</div>
		</form>
	</div>
</div>
<script>
//로그인 id, pw 유효성검사, 하나만 틀렸을 때도 modal이나 alert 출력
$(".login_btn").click(function(){
 	console.log(event);
	var memberId = $('#memberId').val();
	var memberPw = $('#memberPw').val();
	console.log(memberId)
	console.log(memberPw)
	if(memberId == "") {
		alert("아이디가 입력되지 않았습니다")
		return false;
	} else if(memberPw == "") {
		alert("비밀번호가 입력되지 않았습니다")
		return false;
	}
	else {
		sessionStorage.setItem('prevPage', window.location.href);
		$("#login_form").submit();
	}
});
// login버튼 submit 이벤트
$("#login_form").submit(function(event) {
	event.preventDefault();
	console.log(event)
	$.ajax({
		type : 'post',
		url : "${pageContext.request.contextPath}/member/login",
		data : {
			 memberId: $('#memberId').val(),
			 memberPw: $('#memberPw').val()
		},
		dataType : 'text',
		success : function(data) {
			if(data == 'false') {
				alert("아이디나 비밀번호가 일치하지 않습니다! 다시한번 확인해 주세요")
				$("#memberId").focus();
			} else {
				var prevPage = sessionStorage.getItem('prevPage');
				if(prevPage) {
					sessionStorage.removeItem('prevPage');
					location.href = prevPage;
				} else {
					location.href = data;
				}
			}
		},
		error : function(req, text) {
			alert(text + ': ' + req.status)
		}		
	})
});

// 휴대폰 인증
$(".PhoneSubmit").click(function() {
	var inputed = $("#mTel").val(); // 입력한 핸드폰값을 inputed에 저장.	
	$.ajax({
		data: {
			mTel : inputed
		},
		type : 'post',
		url : "/member/sendMessage",
		success : function() {
			alert($("#mTel").val() + "에 인증번호를 전송 하였습니다. 확인 후 인증번호를 입력해 주세요")
			$(".signup_nextbtn").css("display", "block");
			$(".authbtn").hide();
		}
	});
})
</script>
<script src="${pageContext.request.contextPath}/resources/js/modernizr.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/bootstrap.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/owl.carousel.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.dlmenu.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.sticky.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.nice-select.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.magnific-popup.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/jquery.bxslider.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/venobox.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/smothscroll_part1.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/smothscroll_part2.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/jquery.themepunch.revolution.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/jquery.themepunch.tools.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.addon.snow.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.actions.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.carousel.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.kenburn.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.layeranimation.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.migration.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.navigation.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.parallax.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.slideanims.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/plugin/rs_slider/revolution.extension.video.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/custom.js"></script>
<!--main js file end-->