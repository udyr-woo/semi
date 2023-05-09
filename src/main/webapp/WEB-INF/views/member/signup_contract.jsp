<%--
 *
 * fileName       : index (파일명)
 * author         : 이재원 (작성자)
 * date           : 2023/04/5 (생성일 또는 최종 수정일)
 * description    : 회원가입 페이지  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/25       이재원           파일 생성 및 화면배치, 유효성 검사 완료
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
 	height : 930px;
	position: relative;
	padding-bottom: 30px;
}

.body-step {
	margin-left : auto;
	margin-right : auto;
	width : 100%;
	height : 65px;
	position: relative;
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
.pageText .agreeTitle {
    font-size: 18px;
    color: black;
    font-weight: 500;
    margin-top: 20px;
}
.pageText .joinAgree .agreement li {
    float: right;
    margin-right: 15px;
}
.pageText .joinAgree .btnTypeAll label {
    display: block;
    width: 250px;
    height: 60px;
    text-align: center;
    line-height: 60px;
    background: #fff;
    border: 1px solid #a9a9a9;
    cursor: pointer;
}
.pageText .joinAgree .btnTypeAll {
    overflow: hidden;
    margin: 30px auto 45px;
    width: 510px;
}
.pageText .joinAgree .btnTypeAll label{
    padding-left : 0px;
}
.marketing-box {
    border: 1px solid #ddd;
    margin: 10px 0 0 0;
    font-size: 14px;
    width: 1080px;
    display: block;
}
.contents .pageStart .pageText {
    padding-top: 30px;
    z-index: 1000;
}
div {
    margin: 0;
    padding: 0;
    font-family: 'NanumGothic';
}
.pageText .joinAgree .btnTypeAll input:checked + label {
    color: #fff;
    background: #04375f;
    border-color: #04375f;
}
#signup_contract #contract_next_btn {
	width: 350px;
    height: 56px;
    line-height: 0px;
    background: #503396;
    border: 0px;
    color: white;
    font-size: 20px;
    border-radius: 9px;
    margin-bottom: 40px;
    margin-right: 304px;
}

#signup_contract_btn_wrap {
	float: right;
}
</style>
</head>
<body id="signup_contract">
<jsp:include page="../common/header.jsp"/>
<div class="body-wrap" >
 	<div class="body-step">
 	   <h2>이용약관 동의</h2>
 	</div>
      <!-- 상세페이지 타이틀 끝 --> 
      
      <!-- 상세페이지 내용 -->
      <div class="pageText">
        <div class="joinAgree">
      <form name="Frm" method="get" id="form_contract">
        <div class="agreeTitle"> WKKL Cinema 회원약관 (필수) </div>
        <textarea style="white-space: pre-line; width: 100%; height: 200px; margin:10px 0;font-size:14px; padding:4px;line-height: 1.8em; color: #393f43; word-wrap: break-word; overflow-y:scroll;border: 1px solid #d0d0d0;">
WKKL Cinema 회원 약관

제 1장 총 칙

제 1조 (목 적)
이 약관은 WKKL(이하 "회사"라 합니다)이 제공하는 웹서비스(이하 "서비스"라 합니다)의 이용조건 및 절차 등에 관한 사항을 규정함을 목적으로 합니다.

제 2조 (약관의 효력 및 변경)
① 본 서비스를 이용하고자 하는 모든 이용자에 대하여 그 효력을 발생합니다.
② 이 약관의 내용은 서비스의 일부 화면 또는 기타 방법 등에 의하여 그 내용을 게재함으로써 그 효력을 발생합니다.
③ 회사는 운영 또는 영업상 중요한 사유가 있을 경우 본 약관을 임의로 변경할 수 있으며, 변경된 약관은 본 조 제2항과 같은 방법으로 공지함으로써 그 효력을 발생합니다.

제 3조 (약관 외 준칙)
이 약관에 명시되지 않은 사항은 전기통신기본법, 전기통신사업법, 정보통신망이용촉진 등에 관한 법률 및 기타 관련법령, 회사가 별도로 정한 지침 등에 의합니다.

제 4조 (용어의 정의)
이 약관에서 사용하는 용어의 정의는 다음과 같습니다.
1. 회 원 : 서비스를 제공받기 위하여 회사와 이용계약을 체결한 자를 말합니다.
2. 아이디 (ID) : 회원식별과 회원의 서비스 이용을 위한 주민번호 및 성명
3. 비 밀 번 호 : 회원의 비밀보호를 위해 회원자신이 설정한 문자와 숫자의 조합

제 5조 (서비스의 내용)
회사는 회원에게 회사가 자체 개발하는 서비스, 타 업체와 협력 개발한 서비스, 타 업체가 개발한 서비스 및 기타 회사에서 별도로 정하는 각종 서비스 등을 제공합니다.
단, 회사의 사정상 각 서비스별로 제공일정 및 제공방법이 변경되거나 지연, 미 제공될 수도 있습니다.

제 2장 서비스 이용계약

제 6조 (이용계약의 성립)
① "위의 이용약관에 동의하십니까?" 라는 이용신청시의 물음에 회원이 "동의" 단추를 누르면 이 약관에 동의하는 것으로 간주됩니다.
② 이용계약은 제7조에 규정한 회원의 이용신청에 대하여 회사가 승낙함으로써 성립합니다.

제 7조 (이용신청)
① 본 서비스를 이용하기 위해서는 회사 소정의 가입신청 양식에서 요구하는 모든 이용자 정보를 기록하여 신청합니다.
② 가입신청 양식에 기재하는 모든 이용자 정보는 모두 실제 데이터인 것으로 간주됩니다. 실명이나 실제 정보를 입력하지 않은 사용자는 법적인 보호를 받을 수 없으며 서비스의 제한을 받을 수 있습니다.

제 8조 (회원정보 사용에 대한 동의)
① 회사는 제7조에 따라 가입 신청 양식에 기재된 회원의 개인정보를 본 이용계약의 이행과 본 이용계약상의 서비스 제공을 위한 목적으로 이용합니다.
② 회원 정보는 회사와 제휴한 업체에 제공될 수 있습니다. 단, 회사는 회원 정보 제공 이전에 제휴 업체, 제공 목적, 제공할 회원 정보의 내용 등을 사전에 공지하고 회원의 동의를 얻어야 합니다.
③ 회원은 회원 정보 수정을 통해 언제든지 개인 정보에 대한 열람 및 수정을 할 수 있습니다.
④ 회원이 가입 신청 양식에 회원정보를 기재하고, 회사에 본 약관에 따라 이용신청을 하는 것은 회사가 본 약관에 따라 이용신청서에 기재된 회원정보를 수집, 이용 및 제공하는 것에 동의하는 것으로 간주됩니다.

제 9조 (이용신청의 승낙)
① 회사는 회원이 제7조에서 정한 사항을 정확히 기재하여 이용 신청을 하였을 때 다음 제2항, 제3항의 경우를 예외로 하여 승낙할 수 있습니다. 기재 사항의 항목에 따라 서비스 이용의 일부가 제한될 수 있습니다.
②회사는 다음의 경우 이용신청에 대하여는 승낙을 유보할 수 있습니다.
1. 서비스 이용설비에 여유가 없는 경우
2. 기술상 서비스 제공이 불가능한 경우
3. 기타 사유로 이용승낙이 곤란한 경우
③ 회사는 다음 각 호의 1에 해당하는 이용신청에 대하여 이를 승낙하지 않을 수 있습니다.
1. 다른 사람의 명의를 사용하여 신청한 경우
2. 이용신청시 필요내용을 허위로 기재하여 신청한 경우
3. 사회의 안녕질서 또는 미풍양속을 저해할 목적으로 신청한 경우
4. 기타 회사가 정한 이용신청요건이 만족되지 않았을 경우

제 10조 (계약사항의 변경)
회원은 이용 신청시 기재한 이용자정보가 변경되었을 경우에는, 온라인으로 수정을 하여야 하며 미 변경으로 인하여 발생되는 문제의 책임은 이용자에게 있습니다.

제 3장 계약당사자의 의무

제 11 조 (회사의 의무)
① 회사는 제19조 및 제21조에서 정한 경우를 제외하고 이 약관에서 정한 바에 따라 계속적, 안정적으로 서비스를 제공할 수 있도록 최선의 노력을 다하여야 합니다.
② 회사는 서비스에 관련된 설비를 항상 운용할 수 있는 상태로 유지, 보수하고, 장애가 발생하는 경우 지체 없이 이를 수리, 복구할 수 있도록 최선의 노력을 다하여야 합니다.

제 12 조 (사생활의 보호)
① 회사는 서비스와 관련하여 기득한 회원의 개인정보를 본인의 사전 승낙없이 타인에게 누설, 공개 또는 배포할 수 없으며, 서비스 관련 업무 이외의 상업적 목적으로 사용할 수 없습니다. 다만, 다음 각 호의 1에 해당하는 경우에는 그러하지 아니합니다.
1. 관계법령에 의하여 수사상의 목적으로 관계기관으로부터 요구받은 경우
2. 정보통신윤리위원회의 요청이 있는 경우
3. 기타 관계법령에 의한 경우
② 제1항의 범위 내에서, 회사는 광고업무와 관련하여 회원 전체 또는 일부의 개인정보에 관한 통계자료를 작성하여 이를 사용할 수 있고, 서비스를 통하여 회원의 컴퓨터에 쿠키를 전송할 수 있습니다. 이 경우 회원은 쿠키의 수신을 거부하거나 쿠키의 수신에 대하여 경고하도록 사용하는 컴퓨터의 브라우저의 설정을 변경할 수 있습니다.

제 13조(회원의 의무)
① 회원은 서비스를 이용할 때 다음의 행위를 하지 않아야 합니다.
1. 다른 회원의 ID 및 비밀번호를 부정하게 사용하는 행위
2. 서비스를 이용하여 얻은 정보를 회원의 개인적인 이용 외에 복사,가공,번역,2차적 저작 등을 통하여 복제,공연,방송,전시,배포,출판 등에 사용하거나 제3자에게 제공하는 행위
3. 타인의 명예를 손상시키거나 불이익을 주는 행위
4. 회사의 저작권, 제3자의 저작권 등 기타 권리를 침해하는 행위
5. 공공질서 및 미풍양속에 위반되는 내용의 정보,문장,도형,음성 등을 타인에게 유포하는 행위
6. 범죄와 결부된다고 객관적으로 인정되는 행위
7. 서비스와 관련된 설비의 오동작이나 정보 등의 파괴 및 혼란을 유발시키는 컴퓨터 바이러스 감염자료를 등록 또는 유포하는 행위
8. 서비스의 안정적 운영을 방해할 수 있는 정보를 전송하거나 수신자의 의사에 반하여 광고성 정보를 전송하는 행위
9. 정보통신윤리위원회, 소비자보호단체 등 공신력 있는 기관으로부터 시정요구를 받는 행위
10. 선거관리위원회의 중지, 경고 또는 시정명령을 받는 선거법 위반 행위
11. 기타 관계법령에 위배되는 행위
② 회원은 이 약관에서 규정하는 사항과 서비스 이용안내 또는 주의사항을 준수 하여야 합니다.
③ 회원은 내용별로 회사가 서비스 공지사항에 게시하거나 별도로 공지한 이용 제한사항을 준수하여야 합니다.
④ 회원은 회사의 사전승낙 없이는 서비스를 이용하여 어떠한 영리행위도 할 수 없으며, 영리행위에 의해 발생한 결과에 대하여 회사는 책임을 지지 않습니다.
⑤ 회원은 이와 같은 영리행위에 대하여 회사에 손해배상의무를 집니다.
⑥ 회원은 서비스의 이용권한, 기타 이용 계약상 지위를 타인에게 양도, 증여할 수 없으며, 이를 담보로 제공할 수 없습니다.
⑦ 회원은 회사의 사전승낙 없이는 서비스의 전부 또는 일부 내용 및 기능을 전용할 수 없습니다.

제 4장 서비스 이용

제 14조 (회원 ID와 비밀번호 관리에 대한 회원의 의무와 책임)
① 아이디(ID)와 비밀번호에 관한 모든 관리책임은 회원에게 있습니다. 회원에게 부여된 아이디(ID)와 비밀번호의 관리소홀, 부정사용에 의하여 발생하는 모든 결과에 대한 책임은 회원에게 있습니다.
② 자신의 아이디(ID)가 타인에 의해 무단 이용되는 경우 회원은 반드시 회사에 그 사실을 통보해야 합니다.
③ 회원의 아이디(ID)는 회사의 사전 동의 없이 변경할 수 없습니다.

제 15조 (정보의 제공)
회사는 회원이 서비스 이용 도중 필요가 있다고 인정되는 다양한 정보에 대해서 전자우편이나 서신우편 등의 방법으로 회원에게 제공할 수 있습니다.

제 16조 (회원의 게시물)
① 회사는 회원이 게시하거나 전달하는 서비스 내의 모든 내용물이 다음 각 호의 1에 해당된다고 판단되는 경우 사전통지 없이 삭제할 수 있습니다.
1. 다른 회원 또는 제3자를 비방하거나 중상모략으로 명예를 손상시키는 내용인 경우
2. 서비스의 안정적인 운영에 지장을 주거나 줄 우려가 있는 경우
3. 공공질서 및 미풍양속에 위반되는 내용인 경우
4. 범죄적 행위에 결부된다고 인정되는 내용인 경우
5. 회사의 지적재산권, 제3자의 지적재산권 등 기타 권리를 침해하는 내용인 경우
6. 회사에서 규정한 게시기간을 초과한 경우
7. 기타 관계법령 및 회사의 세부 지침 등에 위반된다고 판단되는 경우
② 회사는 게시물에 관련된 세부 이용지침을 별도로 정하여 시행할 수 있으며 회원은 그 지침에 따라 각종 게시물(회원간 전달 포함)을 등록,삭제 등을 하여야 합니다.

제 17조 (게시물에 대한 권리 및 책임)
서비스에 게재된 모든 자료에 대한 권리는 다음과 같습니다.
1. 게시물에 대한 권리와 책임은 게시자에게 있으며 회사는 게시자의 동의 없이는 이를 서비스 내 게재 이외에 영리적 목적으로 사용할 수 없습니다.
단, 비영리적인 경우에는 그러하지 아니하며 회사는 타 서비스내의 게재권을 갖습니다.
2. 회원은 서비스를 이용하여 얻은 정보를 가공, 판매하는 행위 등 서비스에 게재된 자료를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 사용할 수 없습니다.

제18조 (서비스 이용시간)
① 서비스의 이용은 회사의 업무상 또는 기술상 특별한 지장이 없는 한 연중무휴 1일 24시간을 원칙으로 합니다. 다만, 정기점검, 긴급조치 등 회사가 서비스 점검 및 조치를 필요로 하는 시간은 그러하지 않습니다.
② 회사는 서비스를 일정범위로 분할하여 각 범위별로 이용가능 시간을 별도로 정할 수 있습니다. 이 경우 그 내용을 사전에 공지합니다.

제 19조(서비스 이용책임)
회원은 회사에서 공식적으로 인정한 경우를 제외하고는 서비스를 이용하여 상품을 판매하는 영업활동을 할 수 없으며 특히 해킹, 광고를 통한 수익, 음란사이트를 통한 상업행위, 상용S/W 불법배포 등을 할 수 없습니다. 이를 어기고 발생한 영업활동의 결과 및 손실, 관계기관에 의한 구속 등 법적 조치 등에 관해서는 회사가 책임을 지지 않습니다.

제20조(서비스 제공의 중지)
① 회사는 다음 각 호에 해당하는 경우 서비스 제공을 중지할 수 있습니다.
1. 서비스용 설비의 보수 등 공사로 인한 부득이한 경우
2. 기타 불가항력적 사유가 있는 경우
② 회사는 국가비상사태, 정전, 제반 설비의 장애 또는 이용량의 폭주 등으로 정상적인 서비스 이용에 지장이 있는 때에는 서비스의 전부 또는 일부를 제한 하거나 중지할 수 있습니다.

제 21조 (광고주와의 거래)
회사는 본 서비스상에 게재되어 있거나 본 서비스를 통한 광고주의 판촉활동에 회원이 참여하거나 교신 또는 거래의 결과로서 발생하는 모든 손실 또는 손해에 대해 책임을 지지 않습니다.

제 22조 (링크)
본 서비스 또는 제3자는 월드와이드웹 사이트 또는 자료에 대한 링크를 제공할 수 있습니다.
회사는 그러한 사이트 및 자료에 대한 아무런 통제권이 없으므로, 회원은 회사가 그와 같은 외부 사이트나 자료를 이용하는 것에 대해 책임이 없으며, 그러한 사이트나 자료에 대한, 또는 그로부터 이용 가능한 내용, 광고, 제품이나 재료에 대해 회사가 아무런 보증도 하지 않고, 그에 대해 책임이 없음을 인정하고 이에 동의합니다.
또한, 회원은 그러한 사이트나 자료에 대한, 또는 그를 통하여 이용 가능한 내용, 상품 또는 서비스를 이용하거나 이를 신뢰함으로 인해, 또는 이와 관련하여 야기되거나 야기되었다고 주장되는 어떠한 손해나 손실에 대하여 회사는 직접적 또는 간접적으로 책임을 지지 않음을 인정하고 이에 동의합니다.

제 5장 계약해지 및 이용제한

제 23조 (계약해지 및 이용제한)
① 회원이 서비스 이용계약을 해지하고자 할 경우에는 본인이 온라인 또는 회사가 정한 별도의 이용방법을 통해 회사에 해지신청을 하여야 합니다.
② 회사는 회원이 다음 각 호의 1에 해당하는 행위를 하였을 경우 사전 통지 없이 이용계약을 해지하거나 또는 서비스 이용을 중지할 수 있습니다.
1. 타인의 서비스 ID 및 비밀번호를 도용한 경우
2. 서비스 운영을 고의로 방해한 경우
3. 가입한 이름이 실명이 아닌 경우
4. 동일 사용자가 다른 ID로 이중등록을 한 경우
5. 공공질서 및 미풍양속에 저해되는 내용을 고의로 유포시킨 경우
6. 회원이 국익 또는 사회적 공익을 저해할 목적으로 서비스 이용을 계획 또는 실행 하는 경우
7. 타인의 명예를 손상시키거나 불이익을 주는 행위를 한 경우
8. 서비스의 안정적 운영을 방해할 목적으로 정보를 전송하거나 광고성 정보를 전송하는 경우
9. 통신설비의 오동작이나 정보 등의 파괴를 유발시키는 컴퓨터 바이러스 프로그램 등을 유포하는 경우
10. 회사, 다른 회원 또는 제3자의 지적재산권을 침해하는 경우
11. 정보통신윤리위원회 등 외부기관의 시정 요구가 있거나 선거관리위원회의 중지, 경고 또는 시정명령을 받는 선거법 위반행위가 있는 경우
12. 타인의 개인정보, 이용자ID 및 비밀번호를 부정하게 사용하는 경우
13. 회사의 서비스 정보를 이용하여 얻은 정보를 회사의 사전 승낙 없이 복제 또는 유통시키거나 상업적으로 이용하는 경우
14. 회원이 게시판 등에 음란물을 게재하거나 음란사이트를 연결(링크)하는 경우
15. 관련 법령이나, 본 약관을 포함하여 기타 회사가 정한 이용조건에 위반한 경우
③ 회사는 회원이 이용계약을 체결하여 아이디(ID) 및 비밀번호를 부여 받은 후에라도 회원의 조건에 따른 서비스 이용을 제한 할 수 있습니다.
④ 본조 제2항, 제3항의 회사조치에 대하여 회원은 회사가 정한 절차에 따라 이의신청을 할 수 있습니다.
⑤ 전항의 이의신청이 정당하다고 회사가 인정하는 경우, 회사는 즉시 서비스의 이용을 재개해야 합니다.

제 6장 손해배상 등

제 24조 (손해배상)
회사는 서비스 이용요금이 무료인 동안의 서비스 이용과 관련하여 회사의 고의과실에 의한 것이 아닌 한 회원에게 발생한 어떠한 손해에 대하여도 책임을 지지 않습니다.
회원이 서비스를 이용함에 있어 행한 불법행위로 인하여 회사가 당해 회원 이외의 제3자로부터 손해배상청구, 소송을 비롯한 각종의 이의제기를 받는 경우 당해 회원은 회사의 면책을 위하여 노력하여야 하며, 만일 회사가 면책되지 못한 경우는 당해 회원은 그로 인하여 회사에 발생한 모든 손해를 배상하여야 합니다.

제 25조 (면책사항)
① 회사는 천재지변 또는 이에 준하는 불가항력으로 인하여 서비스를 제공할 수 없는 경우에는 서비스 제공에 관한 책임이 면제됩니다.
② 회사는 회원의 귀책사유로 인한 서비스의 이용장애에 대하여 책임을 지지 않습니다.
③ 회사는 회원이 회사의 서비스 제공으로부터 기대되는 이익을 얻지 못하였거나 서비스 자료에 대한 취사 선택 또는 이용으로 인하여 손해가 발생한 경우에 그에 대해 책임을 지지 않습니다.
④ 회사는 회원이 서비스에 게재한 정보, 자료, 사실의 신뢰도, 정확성 등 그 내용에 관하여는 책임을 지지 않습니다.

제 26조 (관할법원)
① 서비스 이용과 관련하여 회사와 회원사이에 분쟁이 발생한 경우, 우선 쌍방간에 분쟁의 해결을 위해 성실히 협의하여야 합니다.
② 회사와 회원간의 분쟁에 대해 소송이 제기될 경우 수원지방법원을 관할법원으로 정합니다.

부칙

1. 이 약관은 2023년 4월 26일부터 시행합니다. 
		</textarea>

        <ul class="agreement">
          <li>
            <input type="radio" name="agree" value="N" id="" style="position:relative;top:2px;">
            동의하지 않습니다. </li>
          <li>
            <input type="radio" name="agree" id="" style="position:relative;top:2px;" value="Y">
            동의합니다. </li>
        </ul>
        <div class="agreeTitle"> 수집하는 개인정보 항목 (필수) </div>
        <textarea style="white-space: pre-line; width: 100%; height: 200px; margin:10px 0;font-size:14px; padding:4px;line-height: 1.8em; color: #393f43; word-wrap: break-word; overflow-y:scroll;border: 1px solid #d0d0d0;">		  
수집하는 개인정보 항목

WKKL에서는 고객님께 다양하고 편리한 정보와 소식을 제공하기 위하여 개인정보를 수집하고 있습니다.

1. 수집방법: 홈페이지 회원가입
2. 수집항목 : 이름, 이메일 주소, 휴대전화번호, 사이트 방문목적 등 
 
개인정보의 수집 및 이용목적 
회사는 수집한 개인정보를 다음의 목적을 위해 사용합니다.

1. 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산 
2. 회원 관리 
가. 개인 식별 
나. 불량회원의 부정 이용 방지와 비인가 사용 방지 
다. 가입 의사 확인 
라. 연령확인 
마. 불만처리 등 민원처리 
바. 고지사항 전달 
 
개인정보의 보유 및 이용기간 
회사는 개인정보 수집 및 이용목적이 달성된 후에는 예외 없이 정보를 지체 없이 파기합니다.

개인정보침해 관련 상담 및 신고
개인정보침해에 대한 신고ㆍ상담이 필요하신 경우에는 정보통신부 산하 공공기관인 한국정보보호진흥원(KISA)내 개인정보침해신고센터로 문의하시기 바랍니다.

[개인정보침해 신고센터]

- 전화 : 118
- 사이트 : https://wkkl.kisa.or.kr
 
		</textarea>

        <ul class="agreement">
          <li>
            <input type="radio" name="agree2" value="N" id="" style="position:relative;top:2px;">
            동의하지 않습니다. </li>
          <li>
            <input type="radio" name="agree2" id="" style="position:relative;top:2px;" value="Y">
            동의합니다. </li>
        </ul>



        <div class="agreeTitle"> 제3자 정보제공 동의 (필수) </div>
        <div style="white-space: pre-line; width: 100%; height: 200px; margin:10px 0;font-size:14px; padding:4px;line-height: 1.8em; color: #393f43; word-wrap: break-word; overflow-y:scroll;border: 1px solid #d0d0d0;">
제3자 정보제공 동의

회원은 WKKL가 아래와 같이 제3자에게 회원의 개인정보를 제공하는 것에 관하여 동의합니다.

1) 제공받는 자 : <b style="font-weight:bold;font-size:12pt">WKKL CINEMA</b>
2) 제공하는 개인정보 항목 : 이름, 휴대전화번호, 이메일
3) 제공받는 자의 개인정보의 이용 목적 : <b style="font-weight:bold;font-size:12pt">각종 서비스 및 영화 예매 서비스</b>
4) 제공받는 자의 보유/이용 기간 : <b style="font-weight:bold;font-size:12pt">개인정보 수집 및 이용목적이 달성된 후에는 정보를 지체 없이 파기</b>
5) 동의거부권 및 불이익 : 고객님께서는 동의를 거부하실 관리가 있습니다. 단, 거부하시는 경우에는 영화예매 서비스를 이용하실 수 없습니다.
		  </div>
        <ul class="agreement">
          <li>
            <input type="radio" name="agree3" value="N" id="" style="position:relative;top:2px;">
            동의하지 않습니다. </li>
          <li>
            <input type="radio" name="agree3" id="" style="position:relative;top:2px;" value="Y">
            동의합니다. </li>
        </ul>
	<br>
        <!-- 전체동의 시작 -->
        <div class="btnTypeAll" id="btnTypeAll">
          <div class="radio" id="radio">
            <input type="radio" name="chkAll" id="chkAll1">
            <label style="float:left" for="chkAll1" class="disagree" onclick="javascript:allDisAgree();"> 모두 동의하지 않습니다. </label>
          </div>
          <div class="radio">
            <input type="radio" name="chkAll" id="chkAll2">
            <label style="float:right" for="chkAll2" class="disagree" onclick="javascript:allAgree();"> 모두 동의합니다. </label>
          </div>
        </div>
        <div id ="signup_contract_btn_wrap">
			<ul>
				<li>
					<button type="button" class="submitForm" id="contract_next_btn">다음</button>
				</li>
			</ul>
		</div>
      </form>
  </div>		
 </div>
</div>
<script>
$(".submitForm").click(function() {
	if(document.Frm.agree[1].checked == false)	{
		alert("인터넷 회원약관에 동의 하셔야 예약회원가입이 가능합니다.");
		document.Frm.agree[1].focus();
		return;
	}

	if(document.Frm.agree2[1].checked == false)	{
		alert("수집하는 개인정보 항목에 동의 하셔야 예약회원가입이 가능합니다.");
		document.Frm.agree2[1].focus();
		return;
	}

	if(document.Frm.agree3[1].checked == false)	{
		alert("제3자 정보제공에 동의 하셔야 예약회원가입이 가능합니다.");
		document.Frm.agree3[1].focus();
		return;
	}
	if(document.Frm.agree[1].checked == true 
		&& document.Frm.agree2[1].checked == true 
		&& document.Frm.agree3[1].checked == true)	{
		
	}
	$("#form_contract").attr("action", "${pageContext.request.contextPath}/member/signup");
	$("#form_contract").submit();
})

function allAgree()  {
	document.Frm.agree[1].checked = true;
	document.Frm.agree2[1].checked = true;
	document.Frm.agree3[1].checked = true;
}

function allDisAgree()  {
	document.Frm.agree[0].checked = true;
	document.Frm.agree2[0].checked = true;
	document.Frm.agree3[0].checked = true;
}
</script>
<jsp:include page="../common/footer.jsp"/>
</body>
</html>

