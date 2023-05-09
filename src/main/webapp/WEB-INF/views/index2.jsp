<%--
 *
 * fileName       : index2 (파일명)
 * author         : 우성준 (작성자)
 * date           : 2023/04/08 (생성일 또는 최종 수정일)
 * description    : 실험용 인덱스  (파일 목적)
 * ===========================================================
 * DATE              AUTHOR             NOTE
 * -----------------------------------------------------------
 * 2023/04/08        우성준           파일생성
 * 2023/04/08		 우성준			  인덱스 배너 삭제 및 헤더 수정
 * 2023/04/11		 우성준			  배너 정상 작동
 * 
 * --%>
 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">

<head>
 	<jsp:include page="common/head.jsp"/>
	<style>
		body {
			background-color: rgb(24, 22, 37);
		}
		.logo-img img {
			width: 200px;
		}
		.prs_navigation_main_wrapper {
			background-color: rgb(24, 22, 37);
		}
		.container-fluid {
			margin-top: 45px;
		}
		.prs_animate_btn1 .button--tamaya {
			margin: 0 10px;
		}
		.movieposter {
			margin: 100px 40px 30px;
    		width: 20%;
    		height: 20%;
		}
		
		.homeposters {
			text-align: center;
		}
		
		.posterbtns {
			text-align: center;
			margin-bottom: 100px;	
		}
		.bookingbtn {
			background-color: rgb(51, 121, 145);
    		color: white;
    		padding: 7px 15px;
    		margin: 0px 52px;
    		width: 360px;
			font-size: 1.1em;
		}
		.footer {
			padding: 50px;
		}
		
	</style>
</head>

<body>
	<!-- preloader Start -->
	<jsp:include page="common/header.jsp"/>
	<!-- prs navigation End -->
	<div class="homeposters">
		<img src="${pageContext.request.contextPath}/resources/images/content/movie_single/home-img.jpeg" class="movieposter">
		<img src="${pageContext.request.contextPath}/resources/images/content/movie_single/home-img1.jpeg" class="movieposter">
		<img src="${pageContext.request.contextPath}/resources/images/content/movie_single/home-img2.jpeg" class="movieposter">
		<img src="${pageContext.request.contextPath}/resources/images/content/movie_single/home-img3.jpeg" class="movieposter">
	</div>
	<div class="posterbtns">
		<a href="movieBooking" class="btn bookingbtn" type="button">예 매</a>
		<a href="movieBooking" class="btn bookingbtn" type="button">예 매</a>
		<a href="movieBooking" class="btn bookingbtn" type="button">예 매</a>
		<a href="movieBooking" class="btn bookingbtn" type="button">예 매</a>
	</div>
	<div class="prs_main_slider_wrapper">
		<div id="rev_slider_41_1_wrapper" class="rev_slider_wrapper fullwidthbanner-container" data-alias="food-carousel26" data-source="gallery" style="margin:0px auto;padding:0px;margin-top:0px;margin-bottom:0px;">
			<div class="prs_slider_overlay"></div>
	<!-- START REVOLUTION SLIDER 5.4.1 fullwidth mode -->
			<div id="rev_slider_41_1" class="rev_slider fullwidthabanner" style="display:none;" data-version="5.4.1">
				<ul>
					<!-- SLIDE  -->
					<li data-index="rs-145" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="The Healthy Bowl" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/KILLING/KILLING_19207741.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 3 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-145-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-145-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-145-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-145-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 7; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-146" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Spicy Chili Soup" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/Shot/0306/Shot_1920774.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 6 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-146-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-146-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-146-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-146-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 10; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-147" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Classic Bolognese" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/MU/0328/MU_1920774.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 9 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-147-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-147-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-147-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-147-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 13; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-148" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Cottage Cheese &amp; Chives" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/IMHERE/IMHERE_1920774.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 12 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-148-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-148-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-148-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-148-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 16; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-149" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Colorful Salad" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/AU/AU_1920774.png" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 15 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-149-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-149-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-149-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-149-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 19; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-150" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Its Just Cornflakes" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/JohnWick/0403/JohnWick_1920774.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 18 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-150-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-150-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-150-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-150-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 22; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
					<!-- SLIDE  -->
					<li data-index="rs-151" data-transition="fade" data-slotamount="7" data-hideafterloop="0" data-hideslideonmobile="off" data-easein="default" data-easeout="default" data-masterspeed="300" data-rotate="0" data-saveperformance="off" data-title="Tasty Muesli" data-param1="" data-param2="" data-param3="" data-param4="" data-param5="" data-param6="" data-param7="" data-param8="" data-param9="" data-param10="" data-description="">
						<!-- MAIN IMAGE -->
						<img src="https://caching2.lottecinema.co.kr/lotte_image/2023/RE/0405/RE_1920774.jpg" alt="" data-bgposition="center center" data-bgfit="contain" data-bgrepeat="no-repeat" class="rev-slidebg" data-no-retina>
						<!-- LAYERS -->
						<!-- LAYER NR. 21 -->
						<div class="tp-caption FoodCarousel-CloseButton rev-btn  tp-resizeme" id="slide-151-layer-5" data-x="441" data-y="110" data-width="['auto']" data-height="['auto']" data-type="button" data-actions='[{"event":"click","action":"stoplayer","layer":"slide-151-layer-3","delay":""},{"event":"click","action":"stoplayer","layer":"slide-151-layer-5","delay":""},{"event":"click","action":"startlayer","layer":"slide-151-layer-1","delay":""}]' data-responsive_offset="on" data-frames='[{"from":"z:0;rX:0;rY:0;rZ:0;sX:0.9;sY:0.9;skX:0;skY:0;opacity:0;","speed":800,"to":"o:1;","delay":"bytrigger","ease":"Power3.easeInOut"},{"delay":"bytrigger","speed":500,"to":"auto:auto;","ease":"nothing"},{"frame":"hover","speed":"300","ease":"Power1.easeInOut","to":"o:1;rX:0;rY:0;rZ:0;z:0;","style":"c:rgba(255,255,255,1);bg:rgba(41,46,49,1);bw:1px 1px 1px 1px;"}]' data-textAlign="['left','left','left','left']" data-paddingtop="[14,14,14,14]" data-paddingright="[14,14,14,14]" data-paddingbottom="[14,14,14,14]" data-paddingleft="[16,16,16,16]" data-lasttriggerstate="reset" style="z-index: 25; white-space: nowrap;border-color:transparent;outline:none;box-shadow:none;box-sizing:border-box;-moz-box-sizing:border-box;-webkit-box-sizing:border-box;cursor:pointer;"><i class="fa-icon-remove"></i> 
						</div>
					</li>
				</ul>
				<div class="tp-bannertimer tp-bottom" style="visibility: hidden !important;"></div>
				</div>
			</div>
		</div>
		<jsp:include page="common/footer.jsp"/>
</body>

</html>