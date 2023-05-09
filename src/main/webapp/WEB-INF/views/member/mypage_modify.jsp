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
 * 2023/04/24		이재원			 각 회원정보 유효성 검사 완료
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<style>
.container_header{
	text-align: left;
}
.more_btn {
	float: right;
	font-weight: bold;
}
.table_spase {
	width : 100%;
	border-bottom : 1px black;
	display: inline-block;
	padding-top: 15px;
}
.table_spase a{
	font-weight: bold;
	font-size: 15px;
	bottom: 0;
}
#cansel_btn {
	float: right;
	margin-top: 10px;
}
.mypage_ticket_table {
	display: flex;
	display: -webkit-box;
	display: -ms-flexbox;
	overflow-x : auto;
	overflow-x : hidden;
	border-bottom: 1px solid #ddd;
}
.mypage_tbody {
	display: flex;
	vertical-align: middle;
}
#mypage_modify .mypage_tbody td:NTH-CHILD(1){
	vertical-align: middle;
	padding-top : 16px;
}
#mypage_modify .mypage_tbody td:NTH-CHILD(2){
	vertical-align: middle;
	padding-top : 16px;
}
#mypage_modify .mypage_tbody td:NTH-CHILD(3){
	vertical-align: middle;
	padding-top : 13px;
}
#mypage_modify .mypage_tbody td{
	vertical-align: middle;
}
#mypage_modify .mypage_tbody p{
	display: inline-block;
}
.mypage_ticket_table th {
    background-color: #f5f5f5;
    color : black;
    vertical-align: middle;
    padding-top: 15px;
}
.mypage_ticket_table td {
	text-align : left;
    vertical-align: middle;
    padding-top: 15px;
    width : 480px;
}
.mypage_ticket_table th, td {
	display: block;
	height: 60px;
	width : 165px;
	padding-left: 20px;
	vertical-align: middle;
	text-align: left;	
	
}
.vertical_table th{
	text-align: left;
	vertical-align: middle;
	padding-left: 18px;
}

.name_input {
	width : 55%;
}

#mypage_modify #vertical_table1 th {
	padding-top : 19px;
	border-bottom: 1px solid #ddd;	
}

#mypage_modify .prs_contact_input_wrapper2 {
	margin-top : 0px;
	float: right;
}
#mypage_modify #mypage_modify_btn_wrap {
	margin-left: 0 auto;
	margin-right : 0 auto;
	width: 74%;
}
#mypage_modify #cancel_btn {
	width : 130px;
    height: 35px;
    line-height: 0px;
    background: #adadad;
    border: 0px;
    color : white; 
}
#mypage_modify #register_btn {
	width : 130px;
    height: 35px;
    line-height: 0px;
    background: #503396;
    border: 0px;
    color : white;
    margin-left: 35px;
}
#mypage_modify .phone_input {
	display : none;
} 
#mypage_modify #phone1_modify, #phone1_modify_cancel{
	display: none;
}
.st_profile_input #pwck_span {
	display : none;
	font-size : small;
}
#memberPhoneChk {
	display: none;
	margin-top: 15px;
}
#PhoneBox_wrap {
	display: contents;	
	width: 100%;
}
#PhoneBox_wrap span{
	display: none;	
	font-size : small;
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
<div class="st_bcc_main_main_wrapper float_left">
<div class="st_bcc_main_wrapper">
	<div class="container">
		<div class="col-md-3">
			<div class="prs_mcc_left_side_wrapper">
				<div class="prs_mcc_bro_title_wrapper">
					<h2>My Service</h2>
					<ul>
						<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/member/mypage_ticket">예매 확인/취소</a> 
						</li>
						<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/member/mypage_modify">개인정보 수정</a> 
						</li>
						<li><i class="fa fa-caret-right"></i> &nbsp;&nbsp;&nbsp;
						<a href="${pageContext.request.contextPath}/member/mypage_remove">회원 탈퇴</a> 
						</li>
					</ul>
				</div>
			</div>
		</div>
		<div class="row">
			<form id="modify_form" method="post">
			<div class="col-md-8">
				<div class="st_bcc_heading_wrapper float_left container_title">							
					<h3>개인정보 수정</h3>
				</div>
			</div>
			<div class="col-md-8">
			<div class="table_spase"> 
				<h3 style="color: purple;">기본 정보</h3>
			</div>
			  <div class="st_bcc_ticket_boxes_wrapper float_left col-md-8">
				<div class="container mt-3 col-md-12">
				  <table class="table mypage_ticket_table col-md-8" >
				    <thead>
				      <tr class="vertical_table" id="vertical_table1">
				        <th>아이디</th>
				        <th>이름</th> 
				        <th class="phoneth_box">휴대폰</th>
				        <th>이메일</th>
				        <th>비밀번호</th>
				        <th>비밀번호 확인</th>
				      </tr>
				    </thead>
				    <tbody class="mypage_tbody">
				      <tr>
				      	<td>${member.memberId}</td>
				        <td>
				        	<div class="st_profile_input float_left">
				        		<p>${member.memberName}</p>
						      	<input type="hidden" value="${member.memberId}" name="memberId">
				        		<input type="hidden" value="${member.memberName}" name="memberName">
				        	</div>
				        </td>
				        <td>
				        	<div class="st_profile_input float_left clearfix">
				        		<p class="reset_PhoneNum">
				        			${member.memberPhoneNum}
				        		</p>
				        		<div style="clear: both;" id="PhoneBox_wrap">
					        		<input style="width : 55%;" type="text" id="mTel" class="phone_input" name="memberPhoneNum" placeholder="'-' 없이 입력">
					        		<button style="margin-left : 10px;" type="button" id="phone_modify" class="btn btn-info">휴대폰번호 변경</button>
					        		<button style="margin-left : 10px;" type="button" id="phone1_modify" class="btn btn-info">인증번호 전송</button>
					        		<button style="margin-left : 10px;" type="button" id="phone1_modify_cancel" class="btn btn-info">취소</button>
					        		<input style="width : 55%;" type="text" id="memberPhoneChk" class="phone_input_Chk" placeholder="인증번호 입력">
					        		<span class="phonechk_input_re_1">인증번호가 일치합니다.</span>
									<span class="phonechk_input_re_2">인증번호가 일치하지 않습니다.</span>
				        		</div>
				        	</div>
				        </td>
				        <td>
				        	<div class="st_profile_input float_left">
				        		<input value="${member.memberEmail}"  style="width : 55%;"id="memberEmail" type="text" class="mail_input" name="memberEmail">
				        	</div>
				        </td>
				        <td>
				        	<div class="st_profile_input float_left">
				        		<input style="width : 55%;" type="password" class="pw_input" placeholder="새 비밀번호를 입력해 주세요">
				        	</div>
				        </td>
				        <td>
				        	<div class="st_profile_input float_left">
				        		<input style="width : 55%;" type="password" id="memberChkPw"class="pwchk_input" name="memberPw" placeholder="비밀번호 확인">
				        		<span class="pwck_input_re_1" id="pwck_span">비밀번호가 일치 합니다!</span>
								<span class="pwck_input_re_2" id="pwck_span">비밀번호가 일치하지 않습니다.</span>
					        </div>
					   </td>
					   </tr>
					    </tbody>
					  </table>
					  <div class="prs_contact_input_wrapper prs_contact_input_wrapper2" id ="mypage_modify_btn_wrap">
						<ul>
							<li>
								<button type="button" class="submitForm" id="cancel_btn">취소</button>
								<button type="button" class="submitForm" id="register_btn">등록</button>
							</li>
						</ul>
					</div>
					</div>
					</div>
				</div>					
				</form>
			</div>
		</div>
	</div>
</div>	
	<jsp:include page="../common/footer.jsp"/>
</body>
<script>
var phonecode = "";
//모든 공백 체크 정규식
var empJ = /\s/g;
//아이디 정규식
var idJ = /^[a-z0-9][a-z0-9_\-]{4,19}$/;
// 비밀번호 정규식
var pwJ = /^[A-Za-z0-9]{4,12}$/;
// 이름 정규식
var nameJ = /^[가-힣]{2,4}|[a-zA-Z]{2,10}\s[a-zA-Z]{2,10}$/;
// 이메일 검사 정규식
var mailJ = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
// 휴대폰 번호 정규식
var phoneJ = /^01([0|1|6|7|8|9]?)?([0-9]{3,4})?([0-9]{4})$/;

/* 유효성 검사 변수 초기화 */
var pwCheck = false;       // 비번
var pwckCheck = false;     // 비번 확인
var pwckcorCheck = false;  // 비번 확인 일치 확인
var mailCheck = false;     // 이메일
var mailnumCheck = false;  // 이메일 인증번호 확인
var phoneCheck = false;	   // 
var phonenumCheck = false; // 
$(document).ready(function() {	
	$("#register_btn").click(function() {	
		var id = '${member.memberId}';	
		var name = '${member.memberName}';
		var pw = '${member.memberPw}'; 
		var phone = $(".phone_input").val();
		console.log(id)
		console.log(name)
		$("#modify_form").attr("action", "${pageContext.request.contextPath}/member/mypage_modify");
		$("#modify_form").submit();
	})
	// '휴대폰 번호 변경' 버튼 클릭 이벤트
	$("#phone_modify").click(function() {
		$('.phone_input').css('display', 'inline-block');
		$('#phone_modify').css('display', 'none');
		$('#phone1_modify').css('display', 'inline-block');
		$('.reset_PhoneNum').css('display', 'none')
	})
	// 인증번호 전송 클릭 이벤트
	$("#phone1_modify").click(function() {
		var inputed = $("#mTel").val(); // 입력한 핸드폰값을 inputed에 저장.	
		$.ajax({
			type : "post",
			dataType : "json",
			data: {
				mTel : inputed
			},
			url : "sendMessage",
			success : function(data) {
				phonecode = data.phonecode;
				console.log("phone : " + phonecode) 
				alert($("#mTel").val() + "에 인증번호를 전송 하였습니다. 확인 후 인증번호를 입력해 주세요")			
				$('#memberPhoneChk').css('display', 'inline-block')
				$('#phone1_modify_cancel').css('display', 'inline-block')
				$('#phone1_modify').css('display', 'none')
				$('.phoneth_box').css('height', '125px');
				$('.phoneth_box').css('padding-top', '53px');
				$('#mypage_modify .mypage_tbody td:NTH-CHILD(3)').css('height', '124px')
				$('.phone_input').attr('readonly', 'readonly')			
			}
		});
	})

	// 휴대폰 인증 확인 일치 유효성 검사 
	$('.phone_input_Chk').on("propertychange change keyup paste input", function() {
		var PhoneNumChk = $('#memberPhoneChk').val();
		var PhoneNumChk_final = phonecode;
		console.log(phonecode)
			if(PhoneNumChk == phonecode) {
				$('.phonechk_input_re_1').css("display", "inline-block");
				$('.phonechk_input_re_1').css("color", "green");
				$('.phonechk_input_re_2').css("display", "none");			
			} else {
				$('.phonechk_input_re_1').css("display", "none")
				$('.phonechk_input_re_2').css("display", "inline-block");
				$('.phonechk_input_re_2').css("color", "red");
			}
	})
	// 초기값으로 되돌리기 위해 빈 문자열 ('')을 전달
	$("#phone1_modify_cancel").click(function() {
		$('#phone_modify').css('display', 'inline-block');
		$('.reset_PhoneNum').css('display', 'inline-block'); 
		$('#memberPhoneChk').css('display', '');
		$('#phone1_modify_cancel').css('display', 'none');
		$('#phone1_modify').css('display', 'none');
		$('.phoneth_box').css('height', '');
		$('.phoneth_box').css('padding-top', '');
		$('#mypage_modify .mypage_tbody td:NTH-CHILD(3)').css('height', '');
		$('.phone_input').removeAttr('readonly'); // readonly 속성 제거
		$('.phone_input').css('display', 'none'); // 안보이기
	})
	//Password 확인 일치 유효성 검사 
	$('.pwchk_input').on("propertychange change keyup paste input", function() {
		var memberPw = $('.pw_input').val();
		var memberChkPw = $('.pwchk_input').val();
		$('.pw_ck2').css('display', 'none');
		 /* && pwJ.test($('.pw_input').val()) */
			if(memberPw == memberChkPw) {
				$('.pwck_input_re_1').css("display", "inline-block");
				$('.pwck_input_re_1').css("color", "green");
				$('.pwck_input_re_2').css("display", "none");			
			} else {
				$('.pwck_input_re_1').css("display", "none")
				$('.pwck_input_re_2').css("display", "inline-block");
				$('.pwck_input_re_2').css("color", "red");
				}
			})
		})
</script>
</html>