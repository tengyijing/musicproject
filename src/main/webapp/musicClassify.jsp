<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<title>音乐分类</title>
<link rel="shortcut icon" href="source/images/logo-b.png" />
  <!-- 头部 -->
  <link rel="stylesheet" href="source/css/reset.css">
  <link rel="stylesheet" href="source/css/index.css">
  <link rel="stylesheet" href="source/css/style.css">

  <script src="source/js/jquery.min.js"></script>
  <script src="source/js/script.js"></script>
    <script src="source/js/index.js"></script>

  <!-- 分类 -->
<link rel="stylesheet" data-dist="true" href="source/musicclassify/css/lomegwdp.css" />

<!-- 中部 -->
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

</head>
<body onload="getName('${username}');">
   <header class="header">
    <div class="header-container"  style="width:1200px;">
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
        <div class="header-search" style="margin-left:-20px;">
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
        
         <div id="nameicon" class="center_header" style="margin-left:60px;margin-right:10px;float:left;display:none">
         <c:choose>
        <c:when test="${imgstr== null or imgstr==''}">
            <a href="userInfo.do"><img src="source/images/user.png" id="img1"/></a>
        </c:when>
        <c:otherwise>
        <a href="userInfo.do"><img src="${imgstr}" id="img2"/></a>
        </c:otherwise>
        </c:choose>
         </div>
         <div id="name" style="display:none;padding-top:35px;"><a href="userInfo.do" style="cursor:pointer" ><i  onmouseover = "xianshi()"  onmouseout = "xiaoshi2()">${username}</i></a></div>
         <div id="xianshi">
         <p style="margin-left:5px;margin-top:3px;"><a href="userInfo.do"><img src="source/images/个人.png"></a></p>
         <p style="margin-left:4px;margin-top:5px;"><a href="Logout.do"><img src="source/images/退出.png"></a></p>  
         </div>
        <div class="header-login"style="margin-right:-10px;">
          <a href="login.jsp" class="open-green" id="login">登录</a>
          <a href="regist.jsp" class="open-vip" id="reg">注册</a>
        </div>
      </div>
      <ul class="header-subNav" style="margin-top:20px;">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="recommendedSongs.do">个性推荐</a></li>
        <li><a href="rank.do">排行榜</a></li>
        <li><a href="musicClassify.jsp"  class="subNav-cur">音乐分类</a></li>
        <li><a href="getDynamic.do">音乐圈</a></li>
        <li><a href="huati.jsp">话题</a></li>
        
      </ul>
    </div>
  </header>
	<div class="responsive" style="margin: 0 auto;width: 880px;margin-top:50px;">
		<!-- start 页面上部左右分栏 -->
		<div class="main-top-wrapper" monkey="H_NI_header">
			<div class="main-top screen-hd clearfix">
				<!-- start 上方左边模块 -->
				<div class="main">
					<div class="top-box clearfix">
						<div class="tag-album-box">
							<div class="mod mod-tags" monkey="H_NI_tags">
								<div class="bd">
									<ul class="clearfix">
										<li><a href="musicClassify.do?classify=情歌">情歌</a></li>
										<li><a href="musicClassify.do?classify=红歌">红歌</a></li>
										<li><a href="musicClassify.do?classify=我是歌手">我是歌手</a></li>
										<li><a href="musicClassify.do?classify=流行">流行</a></li>
										<li><a href="musicClassify.do?classify=对唱">对唱</a></li>
										<li><a href="musicClassify.do?classify=粤语">粤语</a></li>
										<li><a href="musicClassify.do?classify=热歌">热歌</a></li>
										<li><a href="musicClassify.do?classify=90后">90后</a></li>
										<li><a href="musicClassify.do?classify=劲爆">劲爆</a></li>
										<li><a href="musicClassify.do?classify=天籁">天籁</a></li>
										<li><a href="musicClassify.do?classify=古风">古风</a></li>
										<li><a href="musicClassify.do?classify=欧美">欧美</a></li>
                                        <li><a href="musicClassify.do?classify=校园">校园</a></li>	
										<li><a href="musicClassify.do?classify=民谣">民谣</a></li>
										<li><a href="musicClassify.do?classify=80后">80后</a></li>
										<li><a href="musicClassify.do?classify=儿歌">儿歌</a></li>
										<li><a href="musicClassify.do?classify=伤感">伤感</a></li>
										<li><a href="musicClassify.do?classify=安静">安静</a></li>
										<li><a href="musicClassify.do?classify=影视">影视</a></li>
										<li><a href="musicClassify.do?classify=DJ舞曲">DJ舞曲</a></li>
										<li><a href="musicClassify.do?classify=怀旧">怀旧</a></li>
										<li><a href="musicClassify.do?classify=古典音乐">古典音乐</a></li>
										<li><a href="musicClassify.do?classify=治愈">治愈</a></li>
										<li><a href="musicClassify.do?classify=摇滚">摇滚</a></li>
										<li><a href="musicClassify.do?classify=乡村">乡村</a></li>
										<li><a href="musicClassify.do?classify=网络红歌">网络红歌</a></li>
										<li><a href="musicClassify.do?classify=英伦风">英伦风</a></li>
									</ul>
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
        
     <section class="section_cont" style="margin-top:-40px;">
   
    <!--在线首发 开始-->
    <div class="new_songs new_common">
        <!--第1页-->
        <ul class="show">			
                        <li class="albumBox">
                <div class="album" style="background-color:#535B5E">
                    <p>
                        <a href="?p=16"><img width="220" height="220" src=" source/pic/album1-220x220.jpg" class="attachment-220x220 wp-post-image" alt="帽子戏法 - 魏晨" />
                        <span><em>帽子戏法</em><em>魏晨</em></span></a>	
                    </p>
                    <a  style="background-color:#535B5E" href="?p=16"><span>歌曲</span><strong>5</strong></a>
                    <a style="background-color:#535B5E"  href="?p=16"><span>试听</span><strong>1860<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=13"><img width="220" height="220" src=" source/pic/album2-220x220.jpg" class="attachment-220x220 wp-post-image" alt="哎呦，不错哦 - 周杰伦" />                        
                        <span><em>爱呀</em><em>金玟岐</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=13"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=13"><span>试听</span><strong>3750<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=10"><img width="220" height="220" src=" source/pic/album3-220x220.jpg" class="attachment-220x220 wp-post-image" alt="新地球 - 林俊杰" />                        
                        <span><em>哎呦，不错哦</em><em>周杰伦</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=10"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=10"><span>试听</span><strong>4020<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=7"><img width="220" height="220" src=" source/pic/album4-220x220.jpg" class="attachment-220x220 wp-post-image" alt="album5" />
                        <span><em>他说</em><em>林俊杰</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=7"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=7"><span>试听</span><strong>2060<em>万</em></strong></a>
                </div>
            </li>
         </ul>

    </div>
    <div class="new_songs new_common" style="margin-top:-20px;">
        <!--第2页-->
        <ul class="show">			
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=16"><img width="220" height="220" src=" source/pic/album5-220x220.jpg" class="attachment-220x220 wp-post-image" alt="帽子戏法 - 魏晨" />                        
                        <span><em>三十未满</em><em>苏醒</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=16"><span>歌曲</span><strong>5</strong></a>
                    <a style="background-color:#535B5E" href="?p=16"><span>试听</span><strong>1860<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=13"><img width="220" height="220" src=" source/pic/album6-220x220.jpg" class="attachment-220x220 wp-post-image" alt="哎呦，不错哦 - 周杰伦" />                        
                        <span><em>敬世人</em><em>徐若瑄</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=13"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=13"><span>试听</span><strong>3750<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=10"><img width="220" height="220" src=" source/pic/album7-220x220.jpg" class="attachment-220x220 wp-post-image" alt="新地球 - 林俊杰" />                        
                        <span><em>我怀念的</em><em>孙燕姿</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=10"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=10"><span>试听</span><strong>4020<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=7"><img width="220" height="220" src=" source/pic/album8-220x220.jpg" class="attachment-220x220 wp-post-image" alt="album5" />                        
                        <span><em>阴天</em><em>莫文蔚</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=7"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=7"><span>试听</span><strong>2060<em>万</em></strong></a>
                </div>
            </li>
                    </ul>

    </div>
    <div class="new_songs new_common" style="margin-top:-20px;">
        <!--第3页-->
        <ul class="show">			
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=16"><img width="220" height="220" src=" source/pic/album9-220x220.jpg" class="attachment-220x220 wp-post-image" alt="帽子戏法 - 魏晨" />                        
                        <span><em>贝加尔湖畔</em><em>李健</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=16"><span>歌曲</span><strong>5</strong></a>
                    <a style="background-color:#535B5E" href="?p=16"><span>试听</span><strong>1860<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=13"><img width="220" height="220" src=" source/pic/album10-220x220.jpg" class="attachment-220x220 wp-post-image" alt="哎呦，不错哦 - 周杰伦" />                        
                        <span><em>黑暗中的笑脸</em><em>李亦捷</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=13"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=13"><span>试听</span><strong>3750<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=10"><img width="220" height="220" src=" source/pic/album11-220x220.jpg" class="attachment-220x220 wp-post-image" alt="新地球 - 林俊杰" />                        
                        <span><em>One Last Time</em><em>Ariana Grande</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=10"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=10"><span>试听</span><strong>4020<em>万</em></strong></a>
                </div>
            </li>
                        <li class="albumBox">
                <div class="album">
                    <p>
                        <a href="?p=7"><img width="220" height="220" src=" source/pic/album12-220x220.jpg" class="attachment-220x220 wp-post-image" alt="album5" />                        
                        <span><em>大城小爱</em><em>王力宏</em></span></a>	
                    </p>
                    <a style="background-color:#535B5E" href="?p=7"><span>歌曲</span><strong>12</strong></a>
                    <a style="background-color:#535B5E" href="?p=7"><span>试听</span><strong>2060<em>万</em></strong></a>
                </div>
            </li>
                    </ul>

    </div>
    <!--在线首发 结束-->
    
</section>
</c:when>
        <c:otherwise>
<!-- 音乐馆 模块 结束 -->
		<!-- 中部列表 -->
	<div class="playHd" style="position:relative;margin-top:50px; margin-left: 90px; width: 1200px;">
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
					
		<div class="phInner"style="margin-top:10px;">
		<div style="float: left; margin-top: 10px;width:10px;">
				<input  type="checkbox" name="allChecked" id="allChecked" onclick="DoCheck()"  class="checkIn" >
				</div>
			<div class="col" style="margin-left: 54px;">
				歌曲(${musicListSize2})
			</div>
			<div class="col">演唱者</div>
			<div class="col">专辑</div>
			<div class="col">时长</div>
		</div>
	</div>
	<div class="playBd" style=" position:relative;margin-top:-40px; margin-left: 90px;">
		<div class="scrollView">
			<!-- <div class="scroll"></div> -->
			<ul class="songUL">
				<c:forEach items="${musicList2}" var="music" varStatus="index">

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
	        </c:otherwise>
        </c:choose>
	<!-- 分页部分 -->
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

$(".zxf_pagediv").createPage({
	pageNum: ${count},
	current: ${pageNo},
	backfun: function(e) {
	//console.log(e);//回调
}
});
</script>
<!-- footer -->
          <footer class="footer" style="height:170px;width:100%;margin-top:5%">
            <div class="footer-inner" style="height:170px;width:100%;">              
              <div class="footer-copyright" style="height:90px;padding-top:40px;width:100%;">
<p><a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a href="#">意见反馈</a><span>|</span><a href="#">独立音乐人合作</a><span>|</span><a href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a></p>
                <p>© 2018 Qingdao University of Technology| LPJ</p>
                <p><a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a></p>
              </div>
            </div>
          </footer>            
</body>
</html>