<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>LoveMusic</title>
<link rel="shortcut icon" href="/source/images/logo-b.png" />
<link rel="stylesheet" href="/source/css/reset.css">
<link rel="stylesheet" href="/source/css/index.css">
<script type="text/javascript" src="/source/js/jquery.js"></script>
<script src="/source/js/script.js"></script>
<script src="/myjs/index.js"></script>


<!-- 轮播图 -->
<link rel="stylesheet" type="text/css"
	href="/source/content-top-resource/css/style.css" />
<!-- 提示框 -->
<link href="/source/SearchMusic/css/qikoo.css" type="text/css"
	rel="stylesheet" />
<script src="/myjs/qikoo.js"></script>
<script type="text/javascript">
	var menuid = 1;
</script>
</head>

<body onload="getName('${username}');">
	<header class="header">
	<div class="header-container" style="width: 1200px;">
		<div class="header-top">
			<a href="/index" class="logo"></a>
			<nav class="header-nav">
			<ul id="topindex">


			</ul>
			</nav>
			<div class="header-search" style="margin-left: -20px;">
				<form action="searchMusic.do" method="post" id="searchform">
					<input style="width: 170px;" type="text" class="text"
						placeholder="我是歌手第四季" name="musicName" id="musicName" speech
						x-webkit-speech /> <span class="btn" id="vid"
						style="float: left;"><i><img style="margin-top: 6px;"
							src="/source/images/video.png"></i></span> <span class="btn"
						onclick="search();"><i class="icon-sprite"></i></span>
				</form>
				<div class="videoFrame">
					<iframe frameborder=0 width=290 height=330 marginheight=0
						marginwidth=0 scrolling=no src="video.jsp"></iframe>
				</div>
				<div class="result">
					<a href="playMusic.do?id=46&type=1" target='_new'
						class="result-item"> <span class="rank">1</span> <span
						class="title">房间</span> <span class="num">3.4万</span>
					</a> <a href="playMusic.do?id=26&type=1" target='_new'
						class="result-item"> <span class="rank">2</span> <span
						class="title">追光者</span> <span class="num">2.1万</span>
					</a> <a href="playMusic.do?id=35&type=1" target='_new'
						class="result-item"> <span class="rank">3</span> <span
						class="title">远走高飞</span> <span class="num">12.5万</span>
					</a> <a href="playMusic.do?id=38&type=1" target='_new'
						class="result-item"> <span class="rank">4</span> <span
						class="title">春风十里不如你</span> <span class="num">7万</span>
					</a> <a href="playMusic.do?id=89&type=1" target='_new'
						class="result-item"> <span class="rank">5</span> <span
						class="title">童话镇</span> <span class="num">6.8万</span>
					</a>

				</div>
			</div>

			<div id="nameicon" class="center_header"
				style="margin-left: 60px; margin-right: 10px; float: left; display: none">
				<a href="User/personalInfo"><img src="${imgstr}" id="img2" /></a>
			</div>
			<div id="name" style="display: none; padding-top: 35px;">
				<a href="User/personalInfo" style="cursor: pointer"><i
					onmouseover="xianshi()" onmouseout="xiaoshi2()">${username}</i></a>
			</div>
			<div id="xianshi">
				<p style="margin-left: 5px; margin-top: 3px;">
					<a href="User/personalInfo"><img src="/images/person.png"></a>
				</p>
				<p style="margin-left: 4px; margin-top: 5px;">
					<a href="User/exit"><img src="/images/exit.png"></a>
				</p>
			</div>
			<div class="header-login" style="margin-right: -10px;">
				<a href="/login" class="open-green" id="login">登录</a> <a
					href="/regist" class="open-vip" id="reg">注册</a>
			</div>
		</div>
		<ul class="header-subNav" style="margin-top: 20px;" id="topindexChild">

		</ul>
	</div>
	</header>
	<section class="section_cont" style="margin-top:20px;"> <!--轮播图 开始 -->
	<div class="main_banner">
		<div class="main_banner_bg"></div>
		<div class="main_banner_wrap">
			<canvas id="myCanvas" width="0" height="0"></canvas>
			<div class="main_banner_box" id="m_box">
				<a href="javascript:void(0)" class="banner_btn js_pre"> <span
					class="banner_btn_arrow"><i></i></span>
				</a> <a href="javascript:void(0)" class="banner_btn btn_next js_next">
					<span class="banner_btn_arrow"><i></i></span>
				</a>
				<ul>
					<li id="imgCard0"><a href=""><span style="opacity: 0;"></span></a>
						<img
						src="/source/content-top-resource/main_banner/big0120150101183428.jpg"
						alt="">
						<p style="bottom: 0">周杰伦粉丝版</p></li>
					<li id="imgCard1"><a href=""><span style="opacity: 0.4;"></span></a>
						<img
						src="/source/content-top-resource/main_banner/big0020150102211033.jpg"
						alt="">
						<p>乐侃有声节目第二期</p></li>
					<li id="imgCard2"><a href=""><span style="opacity: 0.4;"></span></a>
						<img
						src="source/content-top-resource/main_banner/big0320150101183351.jpg"
						alt="">
						<p>乐见大牌：灵魂段子手</p></li>
					<li id="imgCard3"><a href=""><span style="opacity: 0.4;"></span></a>
						<img
						src="source/content-top-resource/main_banner/big0420150101224343.jpg"
						alt="">
						<p>王力宏四年心血结晶</p></li>
					<li id="imgCard4"><a href=""><span style="opacity: 0.4;"></span></a>
						<img
						src="source/content-top-resource/main_banner/big0720150102210934.jpg"
						alt="">
						<p>《武媚》女神团美艳大比拼</p></li>
				</ul>
				<!--火狐倒影图层-->
				<p id="rflt"></p>
				<!--火狐倒影图层-->
			</div>
			<!--序列号按钮-->
			<div class="btn_list">
				<span class="curr"></span><span></span><span></span><span></span><span></span>
			</div>
		</div>
	</div>
	<!--轮播图 结束 --> </section>
	<!-- 新歌首发 -->
	<div class="main" id="newSong">
		<div class="main-inner">
			<div class="main-title">
				<h2 class="title">
					<font size=50px;>新歌首发</font>
				</h2>
				<span class="line line-left"></span> <span class="line line-right"></span>
			</div>
			<div class="main-slider tab-cont">
				<ul class="slider-wrapper">
					<li><a href="playMusic.do?id=104&type=1" target='_new'
						class="img"> <img src="source/images/cont/slider_img1.jpg"
							alt="#"> <span class="mask"></span> <i class="icon-play"></i>
					</a>
						<div class="info">
							<div class="title">
								<a href="playMusic.do?id=104&type=1" target='_new'>终于等到你</a>
							</div>
							<a href="playMusic.do?id=104&type=1" target='_new' class="author">张靓颖</a>
						</div></li>
					<li><a href="playMusic.do?id=20&type=1" target='_new'
						class="img"> <img src="source/images/cont/slider_img2.jpg"
							alt="#"> <span class="mask"></span> <i class="icon-play"></i>
					</a>
						<div class="info">
							<div class="title">
								<a href="playMusic.do?id=20&type=1" target='_new'>红色高跟鞋</a>
							</div>
							<a href="playMusic.do?id=20&type=1" target='_new' class="author">蔡健雅</a>
						</div></li>
					<li><a href="playMusic.do?id=35&type=1" target='_new'
						class="img"> <img src="source/images/cont/slider_img3.jpg"
							alt="#"> <span class="mask"></span> <i class="icon-play"></i>
					</a>
						<div class="info">
							<div class="title">
								<a href="playMusic.do?id=35&type=1" target='_new'>远走高飞</a>
							</div>
							<a href="playMusic.do?id=35&type=1" target='_new' class="author">金志文</a>
						</div></li>
					<li><a href="playMusic.do?id=58&type=1" target='_new'
						class="img"> <img src="source/images/cont/slider_img4.jpg"
							alt="#"> <span class="mask"></span> <i class="icon-play"></i>
					</a>
						<div class="info">
							<div class="title">
								<a href="playMusic.do?id=58&type=1" target='_new'>他不懂</a>
							</div>
							<a href="playMusic.do?id=58&type=1" target='_new' class="author">张杰</a>
						</div></li>
				</ul>
				<div class="slider-btns">
					<span class="cur"><i></i></span> <span><i></i></span> <span><i></i></span>
				</div>
			</div>
		</div>
	</div>
	<!-- MV -->
	<div class="main" id="mv">
		<div class="main-inner">
			<div class="main-title">
				<h2 class="title">
					<font size=50px;>热门歌曲</font>
				</h2>
				<span class="line line-left"></span> <span class="line line-right"></span>
			</div>
			<a href="javascript:;" class="readAll">全部<i class="icon-sprite"></i></a>
			<div class="main-tab tab-title">
				<a href="javascript:;" class="item item-cur">全部</a> <a
					href="javascript:;" class="item">华语</a> <a href="javascript:;"
					class="item">欧美</a> <a href="javascript:;" class="item">港台</a> <a
					href="javascript:;" class="item">韩国</a> <a href="javascript:;"
					class="item">日本</a>
			</div>
			<ul class="mv-list tab-cont">
				<li class="item"><a href="playMusic.do?id=34&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img1.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=34&type=1" target='_new' class="title">最初的梦想</a>
						<a href="playMusic.do?id=34&type=1" target='_new' class="author">范玮琪</a>
						<span class="play-total"><i class="icon-sprite"></i>18万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=1&type=1" class="img"><img
						src="source/images/cont/mv_img2.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=1&type=1" class="title">漂洋过海来看你</a> <a
							href="playMusic.do?id=1&type=1" class="author">周深</a> <span
							class="play-total"><i class="icon-sprite"></i>11万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=79&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img3.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=79&type=1" target='_new' class="title">暧昧</a>
						<a href="playMusic.do?id=79&type=1" target='_new' class="author">薛之谦</a>
						<span class="play-total"><i class="icon-sprite"></i>28万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=95&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img4.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=95&type=1" target='_new' class="title">年少有你</a>
						<a href="playMusic.do?id=95&type=1" target='_new' class="author">李易峰</a>
						<span class="play-total"><i class="icon-sprite"></i>35万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=26&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img5.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=26&type=1" target='_new' class="title">追光者</a>
						<a href="playMusic.do?id=26&type=1" target='_new' class="author">岑宁儿</a>
						<span class="play-total"><i class="icon-sprite"></i>36万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=47&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img6.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=47&type=1" target='_new' class="title">我们的明天</a>
						<a href="playMusic.do?id=47&type=1" target='_new' class="author">鹿晗</a>
						<span class="play-total"><i class="icon-sprite"></i>19万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=41&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img7.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=41&type=1" target='_new' class="title">老街</a>
						<a href="playMusic.do?id=41&type=1" target='_new' class="author">李荣浩</a>
						<span class="play-total"><i class="icon-sprite"></i>29万</span>
					</div></li>
				<li class="item"><a href="playMusic.do?id=72&type=1"
					target='_new' class="img"><img
						src="source/images/cont/mv_img8.jpg" alt="#"><i
						class="icon-play"></i></a>
					<div class="info">
						<a href="playMusic.do?id=72&type=1" target='_new' class="title">不再见</a>
						<a href="playMusic.do?id=72&type=1" target='_new' class="author">陈学冬</a>
						<span class="play-total"><i class="icon-sprite"></i>42万</span>
					</div></li>
			</ul>
		</div>
	</div>

	<!-- footer -->
	<footer class="footer" style="height:170px;width:100%;">
	<div class="footer-inner" style="height: 170px; width: 100%;">
		<div class="footer-copyright"
			style="height: 90px; padding-top: 40px; width: 100%;">
			<p>
				<a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a
					href="#">意见反馈</a><span>|</span><a href="#">独立音乐人合作</a><span>|</span><a
					href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a>
			</p>
			<p>© 2018 Qingdao University of Technology| LPJ</p>
			<p>
				<a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a>
			</p>
		</div>
	</div>
	</footer>
	<script type="text/javascript"
		src="source/content-top-resource/js/index.js"></script>

</body>
</html>
