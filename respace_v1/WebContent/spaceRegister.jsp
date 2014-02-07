<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
<meta charset="utf-8">
	<title>RESPACE :: 공간에 가치를 더합니다</title>

	<link rel="stylesheet" href="reset.css" type="text/css">
		<link rel="stylesheet" href="style.css" type="text/css">

			<script
				src="http://cdn.jquerytools.org/1.2.7/full/jquery.tools.min.js"></script>

			<link
				href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:200,400,600,700&subset=latin,latin-ext'
				rel='stylesheet' type='text/css'>

				<style type="text/css">
ul.tabs {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999999;
	border-left: 1px solid #999999;
	width: 100%;
}

ul.tabs li {
	float: left;
	margin: 0;
	cursor: pointer;
	padding: 0px 21px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999999;
	border-left: none;
	font-weight: bold;
	font-family: 'Nanum Gothic';
	background: #EEEEEE;
	overflow: hidden;
	position: relative;
}

ul.tabs li:hover {
	background: #CCCCCC;
}

ul.tabs li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.tab_container {
	border: 1px solid #999999;
	border-top: none;
	clear: both;
	float: left;
	width: 100%;
	background: #FFFFFF;
}

.tab_content {
	padding: 20px;
	font-size: 0.9em;
	display: none;
	font-weight: light;
	font-family: 'Nanum Gothic';
	font-color: #777;
}
</style>

				<style type="text/css">
ul.price {
	margin: 0;
	padding: 0;
	float: left;
	list-style: none;
	height: 32px;
	border-bottom: 1px solid #999999;
	border-left: 1px solid #999999;
	width: 100%;
}

ul.price li {
	float: left;
	margin: 0;
	cursor: pointer;
	padding: 0px 15px;
	height: 31px;
	line-height: 31px;
	border: 1px solid #999999;
	border-left: none;
	font-weight: bold;
	font-color: #777;
	font-family: 'Nanum Gothic';
	background: #EEEEEE;
	overflow: hidden;
	position: relative;
}

ul.price li:hover {
	background: #CCCCCC;
}

ul.price li.active {
	background: #FFFFFF;
	border-bottom: 1px solid #FFFFFF;
}

.price_container {
	border: 1px solid #999999;
	border-top: none;
	clear: both;
	float: left;
	width: 100%;
	background: #FFFFFF;
}

.how_much {
	padding: 10px;
	font-size: 0.9em;
	display: block;
	font-weight: light;
	font-family: 'Nanum Gothic';
}
</style>
</head>

<body>

	<!-- *********  Header  ********** -->

	<%@include file="header.jsp"%>
	<!-- *********  Main part – headline ********** -->


	<div id="main_part_inner">
		<div id="main_part_inner_in">

			<h2>SPACE</h2>

			<div class="button_main">
				<a href="download.html" class="button_dark">SHARE!</a>
			</div>

		</div>

	</div>


	<!-- *********  Content  ********** -->

	<div id="content_inner">
		<h3>
			<label>공간명: </label><input type="text" value="${space.name}"></input>
		</h3>
		</font>

		<p class="teamline"></p>
		<div class="cara"></div>
		<hr class="cleanit">

			<!-- **** Details **** -->

			<div class="left_portfolio" style="overflow: auto; height: 100%;">

				<ul id="tab_picture" class="tabs">
					<li class="active" rel="tab1">사진</li>
				</ul>

				<div id="tab_picture_container" class="tab_container">

					<div id="tab_picture_content" class="tab_content">
						<div class="slider-wrapper">

							<ul class="s-slides">
								<li id="slide-1" class="slideleft"><img
									src="img/space_1.jpg" alt="" /></li>
								<li id="slide-2" class="slideleft"><img
									src="img/space_2.jpg" alt="" /></li>
								<li id="slide-3" class="slideleft"><img
									src="img/space_3.jpg" alt="" /></li>
								<li id="slide-4" class="slideleft"><img
									src="img/space_4.jpg" alt="" /></li>
								<li id="slide-5" class="slideleft"><img
									src="img/space_3.jpg" alt="" /></li>
								<li id="slide-6" class="slideleft"><img
									src="img/space_2.jpg" alt="" /></li>
								<li id="slide-7" class="slideleft"><img
									src="img/space_1.jpg" alt="" /></li>
							</ul>
							<ul class="s-thumbs">
								<li><a href="#slide-1"><img src="img/space_1.jpg"
										alt="" /></a></li>
								<li><a href="#slide-2"><img src="img/space_2.jpg"
										alt="" /></a></li>
								<li><a href="#slide-3"><img src="img/space_3.jpg"
										alt="" /></a></li>
								<li><a href="#slide-4"><img src="img/space_4.jpg"
										alt="" /></a></li>
								<li><a href="#slide-5"><img src="img/space_3.jpg"
										alt="" /></a></li>
								<li><a href="#slide-6"><img src="img/space_2.jpg"
										alt="" /></a></li>
								<li><a href="#slide-7"><img src="img/space_1.jpg"
										alt="" /></a></li>
							</ul>
						</div>





					</div>
				</div>
				<hr class="cleanit">
				<ul class="tabs">
					<li class="active" rel="tab2">지도</li>
				</ul>

				<div class="tab_container">


					<div id="tab_map_content" class="tab_content">
						<fieldset class="l2_fieldset">
							<legend class="l2_fieldset_legend">주소 (지도 검색용) - 노출되는 맵의 위치는 지도검색용에 근거해 만들어집니다.</legend>
							<input type="text" name="report_approach_narrative_ckeditor" value="도산대로13길 32, 강남구, 서울"
								style="width: 80%"> <button>Validate</button>
							<br>
							<legend class="l2_fieldset_legend">주소 (상세)</legend>
							<input type="text" name="report_approach_narrative_ckeditor"
								style="width: 80%" value="서울특별시 마포구 와우산로 DM빌딩 1층">
						</fieldset>

						<div class="mapspace">
							<iframe width="656" height="360" frameborder="0" scrolling="no"
								marginheight="0" marginwidth="0"
								src="https://maps.google.com/maps?f=q&amp;source=s_q&amp;hl=en&amp;geocode=&amp;q=San+Francisco,+CA,+United+States&amp;aq=0&amp;oq=san+f&amp;sll=37.0625,-95.677068&amp;sspn=45.553578,93.076172&amp;ie=UTF8&amp;hq=&amp;ll=37.77493,-122.419416&amp;z=14&amp;output=embed">
							</iframe>
						</div>
						<br />

					</div>
					<!-- #tab2 -->


				</div>
				<hr class="cleanit">
				<ul class="tabs">
					<li class="active" rel="tab3">일정</li>
				</ul>

				<div class="tab_container">



					<div id="tab_schedule_content" class="tab_content">


						<strong> 현재 가능한 예약 일정을 알려드립니다.
							<p>
						</strong>
						</p>
						<br />

					</div>
					<!-- #tab3 -->

				</div>
				<!-- .tab_container -->



				<script type="text/javascript">
					$(document).ready(function() {
						$('#tab_picture_content').show();
						$('#tab_map_content').show();
						$('#tab_schedule_content').show();
					});
				</script>
			</div>

			<div class="right_portfolio">
				<ul class="price">
					<li class="active" rel="price0">시간</li>
					<li rel="price1">일</li>
					<li rel="price2">주</li>
					<li rel="price3">월</li>
				</ul>

				<div class="price_container">

					<div id="price0" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="150,000"
							style="width: 40%; display: inline" /> \</b><span>/Per Hour</span> <br><br>
					</div>
					<!-- #price0 -->

					<div id="price1" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="150,000" style="width: 40%;" /> \</b><span>/Per
							Day</span> <br><br>
					</div>
					<!-- #price1 -->
					<div id="price2" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="150,000" style="width: 40%;" /> \</b><span>/Per
							Week</span>


					</div>
					<!-- #price2 -->
					<div id="price3" class="how_much">
						<h5>Standard Rental Rate</h5>
						<b><input type="text" value="150,000" style="width: 40%;" /> \</b><span>/Per
							Month</span>


					</div>
					<!-- #price3 -->
				</div>
				<!-- .tab_container -->
				<hr class="cleanit">
					<section class="ac-container">
					<div>
						<input id="ac-1" name="accordion-1" type="checkbox" checked /> <label
							for="ac-1"><b>비용 상세내역 보기</b></label>
						<article class="ac-small" style="overflow:auto;">
						<p>
							<b>임대료</b> <span><input type="text"
								style="width: 100px; display: inline" value="125,000">\</span>
							<br>
							<b>보증금</b> <span><input type="text"
								style="width: 100px; display: inline" value="25,000">\</span> <br>
							<b>수수료</b> <span>오픈행사중</span>
						</p>
						</article>
					</div>
					<div>
						<input id="ac-2" name="accordion-1" type="checkbox" checked /> <label
							for="ac-2"><b>공간 소개</b></label>
						<article class="ac-medium">
						<p>
							<b>수용인원</b>&nbsp;&nbsp;최대 <input type="text"
								style="width: 20px; display: inline" value="150"></input>-<input
								type="text" style="width: 20px; display: inline" value="170"></input>명
							<br><b>이용시간</b>&nbsp;&nbsp;<input type="text"
								style="width: 20px; display: inline" value="월"></input>-<input type="text"
								style="width: 20px; display: inline" value="금"></input> <input type="text"
								style="width: 20px; display: inline" value="10:00"></input>-<input type="text"
								style="width: 20px; display: inline" value="22:00"></input> <br><b>구비시설</b>&nbsp;&nbsp;<input type="text"
								style="width: 120px; display: inline" value="무선인터넷, 빔프로젝트, 스피커"></input>
						</p>

						</article>
					</div>
					</section>
			</div>

			<hr class="cleanit">

				<div class="story_portfolio" style="height: 100%">




					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">공간소개</legend>
						<textarea name="report_approach_narrative_ckeditor" rows="3"
							style="width: 100%;"></textarea>
					</fieldset>
					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">임대조건</legend>
						<textarea name="report_approach_narrative_ckeditor" rows="3"
							style="width: 100%"></textarea>
					</fieldset>

					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">예약일정</legend>
						<textarea name="report_approach_narrative_ckeditor" rows="3"
							style="width: 100%"></textarea>
					</fieldset>
					<fieldset class="l2_fieldset" style="padding: 10px;">
						<legend class="l2_fieldset_legend">이용후기</legend>
						<textarea name="report_approach_narrative_ckeditor" rows="3"
							style="width: 100%"></textarea>
					</fieldset>

				</div>

				<hr class="cleanit">

					<div style="float: right;">

						<a href="spaceEdit.do?id=${space.id}" class="button_light"
							style="float: left">UPDATE</a> <a
							href="spaceDelete.do?id=${space.id}" class="button_light"
							style="float: left">DELETE</a>
					</div>
	</div>


	</div>


	<!-- *********  Footer  ********** -->
	<%@include file="footer.jsp"%>
</body>
</html>
