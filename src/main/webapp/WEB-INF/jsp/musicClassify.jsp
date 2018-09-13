<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>音乐分类</title>
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<!-- 头部 -->
<link rel="stylesheet" href="../../source/css/reset.css">
<link rel="stylesheet" href="../../source/css/index.css">
<link rel="stylesheet" href="../../source/css/style.css">

<script src="../../source/js/jquery.min.js"></script>
<script src="../../source/js/script.js"></script>
<script src="/myjs/index.js"></script>
<script src="/myjs/musicClassify.js"></script>

<!-- 分类 -->
<link rel="stylesheet" data-dist="true"
	href="../../source/musicclassify/css/lomegwdp.css" />
	
	
	

<!-- 中部 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/css/scroll.css">
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/css/lovesearch.css">
<script type="text/javascript"
	src="../../source/SearchMusic/js/canvas.js"></script>
<script type="text/javascript"
	src="../../source/SearchMusic/js/mousewheel.js"></script>
<script type="text/javascript"
	src="../../source/SearchMusic/js/scroll.js"></script>
<script type="text/javascript" src="../../source/SearchMusic/js/love.js"></script>
<!-- 分页样式 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/fenye/css/zxf_page.css" />
<!--提示框-->
<link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
	rel="stylesheet" />
<script src="../../source/SearchMusic/js/qikoo.js"></script>

<script type="text/javascript">
	var menuid = ${menuid}	
</script>
<style type="text/css">

 .mod-tags1 {
	padding-right: 20px;
}
.mod-tags1  {
	margin-bottom: 5px;
}
.mod-tags1 dl {
	height: 120px;
 	overflow: hidden;  
	margin-right: 200px;
	padding-top: 5px;
	margin-bottom: 15px;
	clear: left;
}

.mod-tags1 dd {
	 display: inline; 
	float: left;
	margin: 5px 5px 6px;
}
.mod-tags1 dt{
float: left;
}
 .mod-tags1 dd dt {
 	width: 15px;
	height: 15px;
	background: url("../images/w4sb0yrw.png");
	display: block;
	margin:30px;
	left: 0;
	top: 0;
	background-position: -768px -36px; 
}
.mod-tags1 dt{
padding-top: 12px;
}
.mod-tags1 dd a {
	display: inline;
	float: left;
	display: block;
	padding: 0 10px;
	border: 1px solid #e6e6e6;
	height: 28px;
	line-height: 28px;
	background: white;
	color: black;
	white-space: nowrap;
	text-decoration: none;
}

 .mod-tags1 dd .live-link {
	color: red;
}

.mod-tags1 dd a:visited {
	color: black;
}

.mod-tags1 dd a:focus {
	color: black;
}

.mod-tags1 dd a:hover {
	color: black;
}

.mod-tags1 dd a:active {
	color: black;
}

.mod-tags1 dd a:hover,
.mod-tags1 dd a.on {
	margin: -5px;
	padding: 5px 15px;
	background: #FA3B4A;
	color: white;
	text-decoration: none;
}

.mod-tags1 dd a:hover:visited,
.mod-tags1 dd a.on:visited {
	color: white;
}

.mod-tags1 dd a:hover:focus,
.mod-tags1 dd a.on:focus {
	color: white;
}

.mod-tags1 dd a:hover:hover,
.mod-tags1 dd a.on:hover {
	color: white;
}

.mod-tags1 dd a:hover:active,
.mod-tags1 dd a.on:active {
	color: white;
}
.mod-tags1 dd {
	margin-right: 8px;
}
.mod-tags1 dl.mod-tags-h173 {
	height: 173px !important;
}  

#pageSonger a{
float: left;
padding: 5px;
}
</style>
</head>
<body onload="getName('${username}');">
<a href="/musicClassify/queryAll">dsfsdf</a>

	<header class="header">
	<div class="header-container" style="width: 1200px;">
		<div class="header-top">
			<a href="../../index.jsp" class="logo"></a>
			<nav class="header-nav">
			<ul id="topmusicClassify">
			</ul>
			</nav>
			<div class="header-search" style="margin-left: -20px;">
				<form action="searchMusic.do" method="post" id="searchform">
					<input style="width: 170px;" type="text" class="text"
						placeholder="我是歌手第四季" name="musicName" id="musicName" speech
						x-webkit-speech /> <span class="btn" id="vid"
						style="float: left;"><i><img style="margin-top: 6px;"
							src="../../source/images/video.png"></i></span> <span class="btn"
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
				<c:choose>
					<c:when test="${imgstr== null or imgstr==''}">
						<a href="userInfo.do"><img src="../../source/images/user.png"
							id="img1" /></a>
					</c:when>
					<c:otherwise>
						<a href="userInfo.do"><img src="${imgstr}" id="img2" /></a>
					</c:otherwise>
				</c:choose>
			</div>
			<div id="name" style="display: none; padding-top: 35px;">
				<a href="userInfo.do" style="cursor: pointer"><i
					onmouseover="xianshi()" onmouseout="xiaoshi2()">${username}</i></a>
			</div>
			<div id="xianshi">
				<p style="margin-left: 5px; margin-top: 3px;">
					<a href="userInfo.do"><img src="../../source/images/个人.png"></a>
				</p>
				<p style="margin-left: 4px; margin-top: 5px;">
					<a href="Logout.do"><img src="../../source/images/退出.png"></a>
				</p>
			</div>
			<div class="header-login" style="margin-right: -10px;">
				<a href="login.jsp" class="open-green" id="login">登录</a> <a
					href="regist.jsp" class="open-vip" id="reg">注册</a>
			</div>
		</div>
		<ul class="header-subNav" style="margin-top: 20px;"
			id="topmusicClassifyChild">


		</ul>
	</div>
	</header>


	<div class="responsive"
		style="margin: 0 auto; width: 880px; margin-top: 50px;">
		<!-- start 页面上部左右分栏 -->
		<div class="main-top-wrapper" monkey="H_NI_header">
			<div class="main-top screen-hd clearfix">
				<!-- start 上方左边模块 -->
				<div class="main">
					<div class="top-box clearfix">
						<div class="tag-album-box">
							<div class="mod mod-tags" monkey="H_NI_tags">
								<div class="bd">								
									<div class="clearfix" id="musicmcategory" >								
									</div>
									</div>
							</div>
						</div>
					</div>
					<!-- end 上方右边模块 -->
				</div>
				<!-- end 页面上部左右分栏 -->
			</div>
		</div>
	</div>





	<c:choose>
		<c:when test="${musicListSize2== null or musicListSize2=='0'}">

			<section class="section_cont" style="margin-top:-40px;" > <!--在线首发 开始-->
			<div class="new_songs new_common" id="songer" >
			</div>
			<div id="pageSonger" style="margin-left: 40%"  >
			
			</div>
				 </section>
		</c:when>
		<c:otherwise>
			<!-- 音乐馆 模块 结束 -->
			<!-- 中部列表 -->
			<div class="playHd"
				style="position: relative; margin-top: 50px; margin-left: 90px; width: 1200px;">
				<div class="header-login2" style="margin-top: -5%">
					<a class="open-vip" id="playall">播放全部</a> <a class="open-vip"
						id="addTo">添加到</a>
					<div class="jump">
						<div class="inner-container">
							<ul class="menuUL3" style="width: 120px; height: 200px;">
								<c:forEach items="${musicList3}" var="music" varStatus="index1">
									<li class="menuLi3 cur"><a class="beijing"
										single="${music.songSingle}"> ${music.songSingle}</a></li>
								</c:forEach>
							</ul>
						</div>
					</div>

					<a class="open-vip" id="piliang" onclick="checkIn()">批量操作</a>
				</div>

				<div class="phInner" style="margin-top: 10px;">
					<div style="float: left; margin-top: 10px; width: 10px;">
						<input type="checkbox" name="allChecked" id="allChecked"
							onclick="DoCheck()" class="checkIn">
					</div>
					<div class="col" style="margin-left: 54px;">
						歌曲(${musicListSize2})</div>
					<div class="col">演唱者</div>
					<div class="col">专辑</div>
					<div class="col">时长</div>
				</div>
			</div>
			<div class="playBd"
				style="position: relative; margin-top: -40px; margin-left: 90px;">
				<div class="scrollView">
					<!-- <div class="scroll"></div> -->
					<ul class="songUL">
						<c:forEach items="${musicList2}" var="music" varStatus="index">

							<li class="songList">
								<div class="songLmain">
									<div class="check">
										<input class="checkIn" type="checkbox" name="choose"
											value="${music.id}">
									</div>
									<div class="start">
										<em sonN="2" style="font-size: 16px;">${index.index+1 }</em>
									</div>
									<div class="songBd">
										<div class="col colsn" style="font-size: 16px;">
											<a href="playMusic.do?id=${music.id }&type=1" target='_new'">${music.musicName}</a>
										</div>
										<div class="col colcn" style="font-size: 16px;">
											<a>${music.singer }</a>
										</div>
										<div class="col colcn" style="font-size: 16px;">
											<a>${music.special }</a>
										</div>
										<div class="col colcn" style="font-size: 16px;">${music.time }</div>
									</div>
									<div class="control">
										<a class="cicon more"></a>
									</div>
								</div>
							</li>
						</c:forEach>
						<div class="zxf_pagediv" style="margin-top: 40px;"></div>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>
	<!-- 分页部分 -->
	<script src="../../source/SearchMusic/fenye/js/zxf_page.js"
		type="text/javascript"></script>
	<script type="text/javascript">
(function($){
	var zp = {
		init:function(obj,pageinit){
			return (function(){
				zp.addhtml(obj,pageinit);
				zp.bindEvent(obj,pageinit);
			}());
		},
		addhtml:function(obj,pageinit){
			return (function(){
				obj.empty();
				/*上一页*/
				if (pageinit.current > 1) {
					obj.append('<a href="musicClassify.do?page=${pageNo-1}&musicName=${musicName}" class="prebtn">上一页</a>');
				} else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled">上一页</span>');
				}
				/*中间页*/
				if (pageinit.current >4 && pageinit.pageNum > 4) {
					obj.append('<a href="javascript:;" class="zxfPagenum">'+1+'</a>');
					obj.append('<a href="javascript:;" class="zxfPagenum">'+2+'</a>');
					obj.append('<span>...</span>');
				}
				if (pageinit.current >4 && pageinit.current <= pageinit.pageNum-5) {
					var start  = pageinit.current - 2,end = pageinit.current + 2;
				}else if(pageinit.current >4 && pageinit.current > pageinit.pageNum-5){
					var start  = pageinit.pageNum - 4,end = pageinit.pageNum;
				}else{
					var start = 1,end = 9;
				}
				for (;start <= end;start++) {
					if ((start <= pageinit.pageNum) && (start >=1)) {
						if (start == pageinit.current) {
							obj.append('<span class="current">'+ start +'</span>');
						} else if(start == pageinit.current+1){
							obj.append('<a href="musicClassify.do?page='+start+'&classify=${classify}" class="zxfPagenum nextpage">'+ start +'</a>');
						}else{
							obj.append('<a href="musicClassify.do?page='+start+'&classify=${classify}" class="zxfPagenum">'+ start +'</a>');
						}
					}
				}
				if (end < pageinit.pageNum) {
					obj.append('<span>...</span>');
				}
				/*下一页*/
				if (pageinit.current >= pageinit.pageNum) {
					obj.remove('.nextbtn');
					obj.append('<span class="disabled">下一页</span>');
				} else{
					obj.append('<a href="musicClassify.do?page=${pageNo+1}&classify=${classify}" class="nextbtn">下一页</a>');
				}
				/*尾部*/
				obj.append('<span>'+'共'+'<b>'+pageinit.pageNum+'</b>'+'页，'+'</span>');
				obj.append('<span><form action="musicClassify.do" method="post" id="from1">到第<input type="text" value="${classify}" name="classify" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
				//obj.append('<span class="zxfokbtn"><a onclick="javascript:document.form1.submit();">确定</a></span>');
			}());
		},
		bindEvent:function(obj,pageinit){
			return (function(){
				obj.on("click","a.prebtn",function(){
					var cur = parseInt(obj.children("span.current").text());
					var current = $.extend(pageinit, {"current":cur-1});
					zp.addhtml(obj,current);
					if (typeof(pageinit.backfun)=="function") {
						pageinit.backfun(current);
					}
				});
				obj.on("click","a.zxfPagenum",function(){
					var cur = parseInt($(this).text());
					var current = $.extend(pageinit, {"current":cur});
					zp.addhtml(obj,current);
					if (typeof(pageinit.backfun)=="function") {
						pageinit.backfun(current);
					}
				});
				obj.on("click","a.nextbtn",function(){
					var cur = parseInt(obj.children("span.current").text());
					var current = $.extend(pageinit, {"current":cur+1});
					zp.addhtml(obj,current);
					if (typeof(pageinit.backfun)=="function") {
						pageinit.backfun(current);
					}
				});
				obj.on("click","span.zxfokbtn",function(){
					var cur = parseInt($("input.zxfinput").val());
					var current = $.extend(pageinit, {"current":cur});
					zp.addhtml(obj,{"current":cur,"pageNum":pageinit.pageNum});
					if (typeof(pageinit.backfun)=="function") {
						pageinit.backfun(current);
					}
				});
			}());
		}
	}
	$.fn.createPage = function(options){
		var pageinit = $.extend({
			pageNum : 15,
			current : 1,
			backfun : function(){}
		},options);
		zp.init(this,pageinit);
	}
}(jQuery));

/* $(".zxf_pagediv").createPage({
	pageNum: ${count},
	current: ${pageNo},
	backfun: function(e) {
	//console.log(e);//回调
} 
}) */




</script>
	<!-- footer -->
	<footer class="footer" style="height:170px;width:100%;margin-top:5%">
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
</body>
</html>



