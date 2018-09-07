<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>音乐搜索</title>
<link rel="shortcut icon" href="source/images/logo-b.png" />
<link rel="stylesheet" href="source/css/index.css">
<link rel="stylesheet" href="source/css/reset.css">

  <script src="source/js/jquery.min.js"></script>
  <script src="source/js/index.js"></script>
<!-- 中部样式 -->
<link rel="stylesheet" type="text/css" href="source/SearchMusic/css/scroll.css">
<link rel="stylesheet" type="text/css" href="source/SearchMusic/css/lovesearch.css">
<script type="text/javascript" src="source/SearchMusic/js/canvas.js"></script>
<script type="text/javascript" src="source/SearchMusic/js/mousewheel.js"></script>
<script type="text/javascript" src="source/SearchMusic/js/scroll.js"></script>
<script type="text/javascript" src="source/SearchMusic/js/love.js"></script>
<!-- 分页样式 -->
<link rel="stylesheet" type="text/css"
	href="source/SearchMusic/fenye/css/zxf_page.css" />
<!--提示框-->
<link href="source/SearchMusic/css/qikoo.css" type="text/css" rel="stylesheet" />
<script src="source/SearchMusic/js/qikoo.js"></script>
<script language="javascript" >
userLogin('${username}');
</script>
</head>
<body onload="getName('${username}');">
	<header class="header">
	<div class="header-container">
		<div class="header-top">
			<a href="index.jsp" class="logo"></a>
			<nav class="header-nav">
			<ul>
            <li><a href="index.jsp" class="header-nav__cur">音乐基地</a></li>
            <li><a href="myMusic.do">我的歌声</a></li>
            <li><a href="playList.do?type=1" target='_new'>音乐盒</a></li>
            <c:choose>
        <c:when test="${username== null or username==''}">
            <li onclick="userLogin2('${username}')"><a>唱聊IM</a></li>
        </c:when>
        <c:otherwise>
         <li><a href="bin/chat.jsp">唱聊IM</a></li>
        </c:otherwise>
        </c:choose>
            </ul>
			</nav>
			<div class="header-search">
		  <form action="searchMusic.do" method="post" id="searchform">
          <input style="width:170px;" type="text" class="text" placeholder="我是歌手第四季" name="musicName" id="musicName" speech x-webkit-speech />
          <span class="btn" id="vid" style="float:left;"><i><img  style="margin-top:6px;"src="source/images/video.png" ></i></span>
          <span class="btn" onclick="search();"><i class="icon-sprite"></i></span>
          </form>
          <div class="videoFrame">
           <iframe  frameborder=0 width=290 height=330 marginheight=0 marginwidth=0 scrolling=no src="video.jsp"></iframe>
          </div>
				<div class="result">
                        <a href="playMusic.do?id=46&type=1" target='_new' class="result-item">
              <span class="rank">1</span>
              <span class="title">房间</span>
              <span class="num">3.4万</span>
            </a>
            <a href="playMusic.do?id=26&type=1" target='_new' class="result-item">
              <span class="rank">2</span>
              <span class="title">追光者</span>
              <span class="num">2.1万</span>
            </a>
            <a href="playMusic.do?id=35&type=1" target='_new' class="result-item">
              <span class="rank">3</span>
              <span class="title">远走高飞</span>
              <span class="num">12.5万</span>
            </a>
            <a href="playMusic.do?id=38&type=1" target='_new' class="result-item">
              <span class="rank">4</span>
              <span class="title">春风十里不如你</span>
              <span class="num">7万</span>
            </a>
            <a href="playMusic.do?id=89&type=1" target='_new' class="result-item">
              <span class="rank">5</span>
              <span class="title">童话镇</span>
              <span class="num">6.8万</span>
            </a>

          </div>
			</div>

			 <div id="nameicon" class="center_header" style="margin-left:80px;margin-right:10px;float:left;display:none">
				<c:choose>
					<c:when test="${imgstr== null or imgstr==''}">
						<a href="userInfo.do"><img src="source/images/user.png"
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
					<a href="userInfo.do"><img src="source/images/个人.png"></a>
				</p>
				<p style="margin-left: 4px; margin-top: 5px;">
					<a href="LogoutServlet.do"><img src="source/images/退出.png"></a>
				</p>
			</div>
			<div class="header-login">
				<a href="login.jsp" class="open-green" id="login">登录</a>
				<a href="regist.jsp" class="open-vip" id="reg">注册</a>
			</div>
		</div>
	</div>
	</header>

<!-- 精彩推荐 -->
	<div class="main" id="recommend">
		<div class="main-inner">
			<div class="carousel">
				<div class="carousel-slider">
					<a href="#" class="item item-pic1"><img
						src="source/images/cont/11.png" alt="#"></a> <a href="#"
						class="item item-pic2"><img
						src="source/images/cont/22.png" alt="#"></a> <a href="#"
						class="item item-pic3"><img
						src="source/images/cont/33.png" alt="#"></a> <a href="#"
						class="item item-pic4"><img
						src="source/images/cont/44.jpg" alt="#"></a> <a href="#"
						class="item item-pic5"><img
						src="source/images/cont/55.jpg" alt="#"></a> <a href="#"
						class="item item-pic6"><img
						src="source/images/cont/66.jpg" alt="#"></a>
				</div>
			</div>
		</div>
		<div class="main-operate">
			<a href="#" class="slider-prev"><i class="icon-sprite"></i></a> <a
				href="#" class="slider-next"><i class="icon-sprite"></i></a>
		</div>
	</div>
	<!-- 结束 -->
	
	<!-- 中部按钮 -->
	
	<!-- 结束 -->
	
	<!-- 中部 <div class="col" style="margin-right: 62px;">
				<span style="float: left; margin-top: 10px; margin-right: 45px;">
				<input  type="checkbox" name="allChecked" id="allChecked" onclick="DoCheck()"  class="checkIn" >
				</span>
				歌曲(${musicListSize})
			</div>-->
	<div class="playHd" style="margin-top:40%; margin-left: 70px; width: 1200px;">
    <div class="header-login2" style="margin-top:-5%">
	<a class="open-vip" id="playall" >播放全部</a>
	<a class="open-vip" id="addTo">添加到</a>
	<div class="jump">
        <div class="inner-container"> 
			<ul class="menuUL3" style="width:120px;height:200px;">
				<c:forEach items="${musicList3}" var="music" varStatus="index1">
					<li class="menuLi3 cur">
						<a class="beijing" single="${music.songSingle}">
						${music.songSingle}</a> 
					</li>
				</c:forEach>
			</ul>
		</div>
    </div>
	
	<a  class="open-vip" id="piliang" onclick="checkIn()">批量操作</a>
	</div>	
					
		<div class="phInner">
		<div style="float: left; margin-top: 10px;width:10px;">
				<input  type="checkbox" name="allChecked" id="allChecked" onclick="DoCheck()"  class="checkIn" >
				</div>
			<div class="col" style="margin-left: 54px;">
				歌曲(${musicListSize4})
			</div>
			<div class="col">演唱者</div>
			<div class="col">专辑</div>
			<div class="col">时长</div>
		</div>
	</div>
	<div class="playBd"
		style="margin-top:40%; margin-left: 70px;">
		<div class="scrollView">
			<!-- <div class="scroll"></div> -->
			<ul class="songUL">
				<c:forEach items="${musicList4}" var="music" varStatus="index">

					<li class="songList">
						<div class="songLmain">
							<div class="check">
								<input class="checkIn" type="checkbox" name="choose" value="${music.id}">
							</div>
							<div class="start">
								<em sonN="2" style="font-size: 16px;">${index.index+1 }</em>
							</div>
							<div class="songBd">
								<div class="col colsn" style="font-size: 16px;"><a href="playMusic.do?id=${music.id }&type=1" target='_new' ">${music.musicName}</a></div>
								<div class="col colcn" style="font-size: 16px;"><a >${music.singer }</a></div>
								<div class="col colcn" style="font-size: 16px;"><a >${music.special }</a></div>
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
	<!-- 分页部分 -->
	<script src="source/SearchMusic/fenye/js/jquery.min.js" type="text/javascript"></script>
	<script src="source/SearchMusic/fenye/js/zxf_page.js" type="text/javascript"></script>
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
					obj.append('<a href="searchMusic.do?page=${pageNo-1}&musicName=${musicName}" class="prebtn">上一页</a>');
				} else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled">上一页</span>');
				}
				/*中间页*/

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
							obj.append('<a href="searchMusic.do?page='+start+'&musicName=${musicName}" class="zxfPagenum nextpage">'+ start +'</a>');
						}else{
							obj.append('<a href="searchMusic.do?page='+start+'&musicName=${musicName}" class="zxfPagenum">'+ start +'</a>');
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
					obj.append('<a href="searchMusic.do?page=${pageNo+1}&musicName=${musicName}" class="nextbtn">下一页</a>');
				}
				/*尾部*/
				obj.append('<span>'+'共'+'<b>'+pageinit.pageNum+'</b>'+'页，'+'</span>');
				obj.append('<span><form action="searchMusic.do" method="post" id="from1">到第<input type="text" value="${musicName}" name="musicName" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
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

$(".zxf_pagediv").createPage({
	pageNum: ${count},
	current: ${pageNo},
	backfun: function(e) {
	//console.log(e);//回调
}
});
</script>


<!-- footer -->
          <footer class="footer" style="height:170px;width:100%;margin-top:30%">
            <div class="footer-inner" style="height:170px;width:100%;">              
              <div class="footer-copyright" style="height:90px;padding-top:40px;width:100%;">
<p><a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a href="#">意见反馈</a><span>|</span><a href="#">独立音乐人合作</a><span>|</span><a href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a></p>
                <p>© 2018 Qingdao University of Technology| LPJ</p>
                <p><a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a></p>
              </div>
            </div>
          </footer>             

  <script src="source/js/jquery.min.js"></script>
  <script src="source/js/script.js"></script>
  

</body>
</html>