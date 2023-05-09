<%--
 *
 * fileName       : mypage_remove (파일명)
 * author         : 이재원 (작성자)
 * date           : 2023/04/21 (생성일 또는 최종 수정일)
 * description    : 회원가입 탈퇴  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/21       이재원           파일 생성 및 회원 삭제 구현 완료
 * 2023/04/21	    이재원			 유효성 검사
 * 
 * --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<style>
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
#mypage_remove .mypage_tbody td:NTH-CHILD(1){
	vertical-align: middle;
	padding-top : 11px;
}
#mypage_remove .mypage_tbody td:NTH-CHILD(2){
	vertical-align: middle;
	padding-top : 11px;
}
#mypage_remove .mypage_tbody td{
	vertical-align: middle;
}
#mypage_remove .mypage_tbody p{
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

#mypage_remove #vertical_table1 th {
	padding-top : 19px;
	border-bottom: 1px solid #ddd;	
}

#mypage_remove .prs_contact_input_wrapper2 {
	margin-top : 0px;
	float: right;
}
#mypage_remove #mypage_remove_btn_wrap {
	margin-left: 0 auto;
	margin-right : 0 auto;
	width: 74%;
}
#mypage_remove #cancel_btn {
	width : 130px;
    height: 35px;
    line-height: 0px;
    background: #adadad;
    border: 0px;
    color : white; 
}
#mypage_remove #remove1_btn {
	width : 130px;
    height: 35px;
    line-height: 0px;
    background: #503396;
    border: 0px;
    color : white;
    margin-left: 35px;
}
#mypage_remove .phone_input {
	display : none;
} 
#mypage_remove #phone1_remove, #phone1_remove_cancel{
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
#contents h3 {
	padding : 10px;
}
.user-out .txt {
	font-weight: bold;
	font-size: 18px;
	padding : 8px;
}
#modal-content #modal-footer {
	padding-top : 70px;		
}
#modal-content #modal-footer button{
	margin-left : 30px;
	text-align : center;
	width : 70px;
	height:40px;	
}
#modal-dialog #modal-header {
	text-align: center;
	background-color: #503396;
	padding : 10px;	
}
#modal-dialog #modal-title {
	color : white;
	padding : 0px;
	font-size: 20px;
}
#modal-dialog #modal-content {
	text-align: center;
	padding : 0px;
}
#modal-dialog #modal-body {
	padding : 30px;
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

<body id="mypage_remove">
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
			<div class="col-md-8">
				<div class="st_bcc_heading_wrapper float_left container_title">							
					<h3>회원 탈퇴</h3>
				</div>
			</div>
			<div class="col-md-8">
			  <div id="contents">
<h3 class="reset">회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</h3>
<div class="user-out mt10">
	<ol>
		<li>
			<p class="txt"> 7일간 동일한 ID로는 회원 재가입이 불가능합니다.</p>

			<ul class="dot-list mt10">
				<li>회원 탈퇴 후, 7일 경과 후 재가입할 수 있습니다.</li>
			</ul>
		</li>
		<li>
			<p class="txt"> 탈퇴 후 삭제 내역</p>
			<p style="font-weight : bold;">(회원 탈퇴하시면 회원정보가 모두 삭제되며 데이터는 복구되지 않습니다.)</p>
		</li>
		<ul class="dot-list mt10">
			<li>영화 관람 내역</li>
			<li>로그인 시 연동 정보</li>
			<li>게시글, 댓글 정보</li>
		</ul>
	</ol>
		<ol>
		<li>
			<p class="txt">${member.memberId} 고객님께서 불편하셨던 점, 아쉬웠던 점을 골라 주세요</p>
			<input type="hidden" name="memberId" value="${member.memberId}">
			<input type="hidden" name="memberPw" value="${member.memberPw}">
			<ul class="reason">
					<li>
						<input type="radio" name="useroutcheck" id="userout01" value="서비스 장애가 잦아서">
						<label for="userout01">서비스 장애가 잦아서</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout02" value="이벤트 및 무료서비스 혜택이 적어서">
						<label for="userout02">이벤트 및 무료서비스 혜택이 적어서</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout03" value="불만 및 불편사항에 대한 고객응대가 나빠서">
						<label for="userout03">불만 및 불편사항에 대한 고객응대가 나빠서</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout04" value="영화관람시 시설 및 가격등의 불만 때문에">
						<label for="userout04">영화관람시 시설 및 가격등의 불만 때문에</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout05" value="이용빈도가 낮고 개인정보 유출이 우려되어">
						<label for="userout05">이용빈도가 낮고 개인정보 유출이 우려되어</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout06" value="탈퇴 후 재가입을 위해">
						<label for="userout06">탈퇴 후 재가입을 위해</label>							
					</li>					
					<li>
						<input type="radio" name="useroutcheck" id="userout07" value="기타">
						<label for="userout07">기타</label>							
							<input type="text" class="input-text w600px ml10" title="기타 입력" id="etcText">							
					</li>			
			</ul>
		</li>
		</ol>		
			<form id="remove_form" method="post">
			<div class="table_spase"> 
				<h3>4. 회원님의 비밀번호를 입력하시고 [탈퇴] 버튼을 클릭해주세요.</h3>
			</div>
			  <div class="st_bcc_ticket_boxes_wrapper float_left col-md-8">
				  <table class="table mypage_ticket_table col-md-8" >
				    <thead>
				      <tr class="vertical_table" id="vertical_table1">
				        <th>비밀번호</th>
				        <th>비밀번호 확인</th>
				      </tr>
				    </thead>
				    <tbody class="mypage_tbody">
				      <tr>
				        <td>
				        	<div class="st_profile_input float_left">
				        		<input style="width : 55%;" type="password" id="memberPw" class="pw_input" name="memberPw" placeholder="비밀번호 입력">
					        </div>
					    </td>
					    <td>
				        	<div class="st_profile_input float_left">
				        		<input style="width : 55%;" type="password" id="memberPw" class="pwchk_input" name="memberPwChk" placeholder="비밀번호 확인">
				        		<span class="pwck_input_re_1" id="pwck_span">비밀번호가 일치 합니다!</span>
								<span class="pwck_input_re_2" id="pwck_span">비밀번호가 일치하지 않습니다.</span>
				        	</div>
				        </td>
					  </tr>
					</tbody>
				  </table>
					<div class="prs_contact_input_wrapper prs_contact_input_wrapper2" id ="mypage_remove_btn_wrap">
						<ul>
							<li>
								<button type="button" class="submitForm" id="cancel_btn">취소</button>
								<button data-target="#remove" data-toggle="modal" type="button" class="submitForm" id="remove1_btn">탈퇴</button>
							</li>
						</ul>
					</div>
					</div>
				</form>
				 </div>
				</div>
			  </div>
			</div>					
		</div>
	</div>
</div>
<div class="modal fade st_pop_form_wrapper" id="remove" role="dialog">
	<div class="modal-dialog" id="modal-dialog">
	 <div class="modal-content" id="modal-content" >
	  <div class="modal-header" id="modal-header">
		 <h3 class="modal-title" id="modal-title">정말 탈퇴 하시겠습니까?</h3>
	 </div>
	<div class="modal-body" id="modal-body">
       <h4>탈퇴 하시면 되돌릴 수 없습니다</h4>
      </div>
      <div class="modal-footer" id="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" id="remove_btn">탈퇴</button>
	</div>
	</div>
	</div>
</div>
<jsp:include page="../common/footer.jsp"/>
</body>
<script>
var pwckcorCheck = false;  // 비번 확인 일치 확인
$(document).ready(function() {	
	$("#remove_btn").click(function() {	
		var id = '${member.memberId}';
		var pw = '${member.memberPw}';
		$("#remove_form").attr("action", "${pageContext.request.contextPath}/member/mypage_remove");
		if(pwckcorCheck==true) {
			$("#remove_form").submit();
			alert("성공적으로 회원탈퇴가 완료 되었습니다 홈페이지로 이동됩니다")
		} else {
			alert("회원의 비밀번호가 일치하지 않습니다 다시한번 확인해 주세요")	
		}
	})
	$('.pwchk_input').on("propertychange change keyup paste input", function() {
	var memberPw = $('.pw_input').val();
	var memberPwChk = $('.pwchk_input').val();
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
})
</script>
</html>