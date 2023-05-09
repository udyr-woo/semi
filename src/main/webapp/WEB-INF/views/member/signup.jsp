<%--
 *
 * fileName       : index (파일명)
 * author         : 이재원 (작성자)
 * date           : 2023/04/5 (생성일 또는 최종 수정일)
 * description    : 회원가입 페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/05       이재원           파일 생성 및 CRUD 구현
 * 2023/04/09		이재원			 이메일 전송 api 기능 적용
 * 2023/04/10		이재원			 부트스트랩 사용하여 UI 진행중
 * 2023/04/12		이재원			 로그인, 회원가입 jquery 추가
 * 2023/04/13		이재원			 기본적인 유효성 검사 완료
 * 2023/04/25		이재원			 최종 유효성 검사 완료
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">

<head>
 	<jsp:include page="../common/head.jsp"/>
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
.member_input span{
	display:block;
	margin-left:250px;
	display:none;
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
.st_form_pop_login_btn a{
	width: 50%;
	margin-top:10px;
    height: 40px;
    line-height: 40px;
    text-align: center;
    float: left;
    background: rgba(0,0,0,0.12);
    font-size: 14px;
    font-weight: 500;
    color: rgba(0,0,0,0.38);
    letter-spacing: 1px;
    text-transform: uppercase;
    border-radius: 4px;
    border: 1px solid rgba(0,0,0,0.12);
	-webkit-transition: all 0.5s;
    -o-transition: all 0.5s;
    -ms-transition: all 0.5s;
    -moz-transition: all 0.5s;
    transition: all 0.5s;	
    margin-left: 250px;
}
.st_form_pop_login_btn #mailCheckInputBtn{
	margin-top: 30px;
}
.st_form_pop_login_btn .signup_button{
	margin-top: 50px;
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
	border-bottom: 1px solid;
}
.body-step h2{	
	text-align: center;
	vertical-align: bottom;
}
.member_input {	
	height : 735px;
	position: absolute;
	bottom: 0px;
    justify-content:center;
}
</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<div class="body-wrap" >
 	<div class="body-step">
 	   <h2>회원 정보 입력</h2>
 	</div>
 		<div class="member_input">
 			<form id="signup_form" method="post">
				<div class="st_profile_input float_left">
					<input type="text" class="id_input" name="memberId" placeholder="ID를 입력해 주세요">
					<span class="id_input_re_1">사용 가능한 아이디입니다.</span>
					<span class="id_input_re_2">아이디가 이미 존재합니다.</span>
					<span class="id_chk">아이디를 입력해 주세요</span>
					<span class="id_chkJ"></span>
				</div>
				<div class="st_profile_input float_left">
					<input type="password" placeholder="4~12 영문, 숫자 사용 가능" class="pw_input" name="memberPw" value="${member.memberPw}">
					<span class="pw_chk">비밀번호를 입력해주세요</span>
					<span class="pw_chkJ"></span>
				</div>
				<div class="st_profile_input float_left">
					<input type="password" placeholder="비밀번호 확인" class="pwck_input">
				</div>
					<span class="pw_chk2">비밀번호 확인을 입력해 주세요</span>
					<span class="pwck_input_re_1">비밀번호가 일치합니다.</span>
					<span class="pwck_input_re_2">비밀번호가 일치하지 않습니다.</span>
				<div class="st_profile_input float_left">
					<input type="text" class="user_input" name="memberName" value="${member.memberName}" placeholder="이름을 입력해 주세요">
					<span class="name_chk">이름을 입력해 주세요</span>					
				</div>
				<div class="st_profile_input float_left">
					<input type="text" class="mail_input" name="memberEmail" value="${member.memberEmail}" placeholder="사용하실 E-mail을 입력해 주세요">
					<span class="mail_chk">이메일을 입력해 주세요</span>
					<span class="mail_final_input"></span>
				</div>
				<div class="st_profile_input float_left">
					<input type="text" class="mail_Chk_input" placeholder="인증번호를 입력해 주세요">
					<span class="mail_chk2" id="mailCheckInputBox">인증번호 확인란을 입력해 주세요</span>
					<span class="mailck_input_re_1">인증번호가 일치합니다.</span>
					<span class="mailck_input_re_2">인증번호가 일치하지 않습니다.</span>
				</div>
				<div class="st_form_pop_login_btn float_left" >
					<a href="#" id="mailCheckInputBtn" >이메일 인증번호 전송</a>
				</div>
				<div class="st_form_pop_login_btn float_left signup_button">
					<a href="#" type="button" class="signup_button">회원 가입</a>
				</div>
			</form>
		</div>
	</div>		
<script>
var code = ""; // 이메일 인증번호 저장을 위한 변수를 빈 문자열로 초기화
 /* 유효성 검사 변수 초기화 */
 var idCheck = false;   	// 아이디
 var idckCheck = false;     // 아이디 중복 검사
 var pwCheck = false;       // 비번
 var pwckCheck = false;     // 비번 확인
 var pwckcorCheck = false;  // 비번 확인 일치 확인
 var nameCheck = false;     // 이름
 var mailCheck = false;     // 이메일
 var mailnumCheck = false;  // 이메일 인증번호 확인
 
$(document).ready(function() {
	//회원가입 버튼(회원가입 기능 작동)
	$(".signup_button").click(function(){
	       // 입력값 변수
	       var id = $('.id_input').val(); // ID
	       var pw = $('.pw_input').val(); // PW
	       var pwck = $('.pwck_input').val(); // PWChk
	       var name = $('.user_input').val(); // Name 
	       var mail = $('.mail_input').val(); // Email
	       
	
		// 아이디 유효성 검사
		if(id == "") {
			$('id_chk').css('display', 'block');
			idCheck = false;
		} else {
			$('.id_chk').css('display', 'none');
			idCheck = true;
		}
		console.log("idCheck : " + idCheck)
		// 비밀번호 유효성 검사
		if(pw == "") {
			$('pw_chk').css('display', 'block');
			pwCheck = false;
		} else {
			$('.pw_chk').css('display', 'none');
			pwCheck = true; 
		}
		console.log("pwCheck : " + pwCheck)
		// 비밀번호 확인 유효성 검사
		if(pwck == "") {
			$('.pw_chk2').css('display', 'block');
			pwckCheck = false;
		} else {
			$('.pw_chk2').css('display', 'none');
			pwckCheck = true;
		}
		console.log("pwckCheck : " + pwckCheck)
		// 이름 유효성 검사
		if(name == "") {
			$('.name_chk').css('display', 'block');
			nameCheck = false;
		} else {
			$('.name_chk').css('display', 'none');
			nameCheck = true;
		}
		console.log("nameCheck : " + nameCheck)
		// 이메일 유효성 검사
		if(mail == "") {
			$('.mail_chk').css('display', 'block');
			mailCheck = false;
		} else {
			$('.mail_chk').css('display', 'none');
			mailCheck = true;
		}
		console.log("mailCheck : " + mailCheck)
		if(idCheck&&idckCheck&&pwCheck&&pwckCheck&&pwckcorCheck&&nameCheck&&mailCheck&&mailnumCheck) {
			console.log("idCheck : " + idCheck)
			console.log("idckCheck : " + idckCheck)
			console.log("pwckCheck : " + pwckCheck)
			console.log("pwckcorCheck : " + pwckcorCheck)
			console.log("nameCheck : " + nameCheck)
			console.log("mailCheck : " + mailCheck)
			console.log("mailnumCheck : " + mailnumCheck)
			$("#signup_form").attr("action", "${pageContext.request.contextPath}/member/signup_view");
			$("#signup_form").submit();
		}
		return false;
	})
// email 인증번호 전송 
$("#mailCheckInputBtn").click(function() {	
	var email = $(".mail_input").val(); // mail_input에 입력한 값을 email변수에 넣는다. 입력한 이메일
	var checkBox = $(".mail_Chk_input"); // 인증번호 입력란
	var mailChkMsg = $(".mail_final_input"); // 이메일 형식 유효성검사 경고 글 
	alert("성공적으로 인증번호를 전송 하였습니다. 확인 후 인증번호를 입력해 주세요")
	
	if(mailcheck(email)) {
		mailChkMsg.html("올바른 이메일 형식 입니다.")
		mailChkMsg.css("color", "green");
		mailChkMsg.css("display", "block");		
	} else {
		mailChkMsg.html("올바른 이메일 형식이 아닙니다.");
		mailChkMsg.css("color", "red");
		mailChkMsg.css("display", "block");
	}
	
	$.ajax({
	// url을 통한 POST방식, url명은 mailCheck
	type:"POST",
	url:"mailCheck?email=" + email,
	success:function(data) {
		console.log("data : " + data);
		checkBox.attr("disabled", false);
		code = data;
		}
	})
});

// 입력 이메일 형식 유효성 검사
function mailcheck(email) {
	// 정규 표현식을 form에 저장, 부합할경우 True, 부합하지 않으면 false
	var form = /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i;
	return form.test(email);
}
	
	
// 이메일 확인 유효성 검사
$('.mail_Chk_input').on("propertychange change keyup paste input", function() {
	var inputCode = $(".mail_Chk_input").val();
	var checkResult = $("#mailNumCheck");
		if(inputCode == code) {
			$('.mailck_input_re_1').css("display", "inline-block");
			$('.mailck_input_re_1').css("color", "green");
			$('.mailck_input_re_2').css("display", "none");
			mailnumCheck = true;
		} else{
			$('.mailck_input_re_2').css("display", "inline-block");
			$('.mailck_input_re_2').css("color", "red");	
			$('.mailck_input_re_1').css("display", "none");
			mailnumCheck = false;
			}
		})
//Password 확인 일치 유효성 검사 
$('.pw_input, .pwck_input').on("propertychange change keyup paste input", function() {
	var memberPw = $('.pw_input').val();
	var memberPwChk = $('.pwck_input').val();
	var pwJ = /^[a-z0-9]{4,12}$/; // 4~12자리, 소문자 영문, 숫자만 사용 가능.
	$('.pw_ck2').css('display', 'none');
		 if(!pwJ.test($(".pw_input").val())) {
			$('.pw_chkJ').css("display", "inline-block")
			$('.pw_chkJ').css("color", "red")
			$('.pwck_input_re_2').css("display", "none");
			$('.pw_chkJ').html("비밀번호 유형이 올바르지 않습니다.")
			pwckcorCheck = false;
		} else if(pwJ.test($(".pw_input").val())) {
			$('.pw_chkJ').html("올바른 비밀번호 유형 입니다")
			$('.pw_chkJ').css("color", "green")
			$('.pwck_input_re_2').css("display", "none");
		}
		 if(memberPw == memberPwChk) {
			$('.pwck_input_re_1').css("display", "inline-block");
			$('.pwck_input_re_1').css("color", "green");
			$('.pwck_input_re_2').css("display", "none");
			pwckcorCheck = true;
		} else {
			$('.pwck_input_re_1').css("display", "none")
			$('.pwck_input_re_2').css("display", "inline-block");
			$('.pwck_input_re_2').css("color", "red");
			pwckcorCheck = false;
			}
		})

// ID 중복 검사 && ID 형식 유효성 검사
$('.id_input').on("propertychange change keyup paste input", function() {
	var memberId = $('.id_input').val();
	var data = {memberId : memberId}
	var idJ = /^[a-zA-Z0-9]{8,20}$/; // 영문과 숫자 조합 8~20, 최대 20
	$.ajax({
		type : "post",
		url : "${pageContext.request.contextPath}/member/memberIdChk",
		data : data,			
		success : function(result) {
			if(result != 'fail' && idJ.test($(".id_input").val())){
			console.log($('.id_input').val())
				$('.id_input_re_1').css("display", "inline-block");
				$('.id_input_re_1').css("color", "green");
				$('.id_input_re_2').css("display", "none");
				$('.id_chkJ').css("display", "none");
				idckCheck = true;
				// ID 정규식 표현에 맞지않거나 빈 문자열이라면
			} else if (!idJ.test($(".id_input").val())){
				$('.id_chkJ').css("display", "inline-block")
				$('.id_chkJ').css("color", "red")
				$('.id_input_re_1').css("display", "none");
				$('.id_chkJ').html("아이디는 8~20 영문, 숫자를 사용할 수 있습니다")
				idckCheck = false;
				} else {
				console.log("실패여부" + result)
				$('.id_input_re_1').css("display", "none");
				$('.id_input_re_2').css("display", "inline-block");
				$('.id_input_re_2').css("color", "red");
				idckCheck = false;
				}
			}
		})
	})
});

</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>

