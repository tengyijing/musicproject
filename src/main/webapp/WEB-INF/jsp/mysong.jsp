<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>我的歌声</title>
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<!-- 头部 -->
<link rel="stylesheet" href="../../source/css/reset.css">
<link rel="stylesheet" href="../../source/css/index.css">
<script src="../../source/js/jquery.js"></script>
<script src="../../source/js/script.js"></script>
  <script src="/myjs/index.js"></script>
<!-- 主体 -->
<link rel="stylesheet" href="../../source/mysong/css/main.css">
<script src="../../source/mysong/js/main.js"></script>
<script type="text/javascript" src="../../source/js/jquery.flexText.js"></script>
<!-- 音乐上传 -->
<!-- 引用控制层插件样式 -->
<link rel="stylesheet" href="../../source/mysong/control/css/zyUpload.css"
	type="text/css">

<!-- 引用核心层插件 -->
<script type="text/javascript" src="../../source/mysong/core/zyFile.js"></script>
<!-- 引用控制层插件 -->
<script type="text/javascript"
	src="../../source/mysong/control/js/zyUpload.js"></script>
<!-- 引用初始化JS -->
<script type="text/javascript" src="../../source/mysong/demo.js"></script>
<!-- 图片 -->
<link type="text/css" rel="stylesheet"
	href="../../source/css/bootstrap-fileinput.css">
<!-- 分页样式 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/fenye/css/zxf_page.css" />

<!--提示框-->
<link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
      rel="stylesheet" />
<script src="../../source/SearchMusic/js/qikoo.js"></script>
<style>
/*滚动条*/
::-webkit-scrollbar {
	width: 6px;
	height: 6px;
}

::-webkit-scrollbar-track-piece {
	background-color:;
}

body::-webkit-scrollbar-track-piece {
	background-color: #ccc;
}

::-webkit-scrollbar-track-piece:no-button {
	
}

::-webkit-scrollbar-thumb {
	background-color: #F5B5B6;
	border-radius: 2px;
}

::-webkit-scrollbar-thumb:hover {
	background-color: #F5B5B6;
}

::-webkit-scrollbar-thumb:active {
	background-color: #F5B5B6;
}
/*/滚动条*/
</style>
<!-- 提示框 -->
<link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
      rel="stylesheet" />
<script src="../../source/SearchMusic/js/qikoo.js"></script>
<script type="text/javascript">
var id=${id}
</script>
</head>
<body onload="getName('${username}');userLogin('${username}');">
	 <header class="header">
    <div class="header-container"  style="width:1200px;">
            <div class="header-top">
        <a href="../../index.jsp" class="logo"></a>
        <nav class="header-nav">
          <ul id="topmysong">
            
          </ul>
        </nav>
        <div class="header-search" style="margin-left:-20px;">
        <form action="searchMusic.do" method="post" id="searchform">
          <input style="width:170px;" type="text" class="text" placeholder="我是歌手第四季" name="musicName" id="musicName" speech x-webkit-speech />
          <span class="btn" id="vid" style="float:left;"><i><img  style="margin-top:6px;"src="../../source/images/video.png" ></i></span>
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
            <a href="userInfo.do"><img src="../../source/images/user.png" id="img1"/></a>
        </c:when>
        <c:otherwise>
        <a href="userInfo.do"><img src="${imgstr}" id="img2"/></a>
        </c:otherwise>
        </c:choose>
         </div>
         <div id="name" style="display:none;padding-top:35px;"><a href="userInfo.do" style="cursor:pointer" ><i  onmouseover = "xianshi()"  onmouseout = "xiaoshi2()">${username}</i></a></div>
         <div id="xianshi">
         <p style="margin-left:5px;margin-top:3px;"><a href="userInfo.do"><img src="../../source/images/个人.png"></a></p>
         <p style="margin-left:4px;margin-top:5px;"><a href="Logout.do"><img src="../../source/images/退出.png"></a></p>
         </div>
        <div class="header-login"style="margin-right:-10px;">
          <a href="login.jsp" class="open-green" id="login">登录</a>
          <a href="regist.jsp" class="open-vip" id="reg">注册</a>
        </div>
      </div>
      <ul class="header-subNav" style="margin-top:20px;" id="topmysongChild">
        
      </ul>
    </div>
  </header>
	<!-- 中部上 -->
	<section id="banner" style="margin-top:30px; color:#FFFFFF">
	<div class="image round" style="margin-top: -50px;">
		<c:choose>
			<c:when test="${imgstr== null or imgstr==''}">
				<a><img src="../../source/mysong/images/pic02.jpg" alt="Pic 02" /></a>
			</c:when>
			<c:otherwise>
				<a><img src="${imgstr}" id="img2" /></a>
			</c:otherwise>
		</c:choose>
	</div>

	<div class="header1">
		<div
			style="float: left; margin-left: 541px; margin-right: 15px; margin-top: 10px;">
			<h3>${friendListSize}</h3>
			<h3 style="margin-top: 10px;">关注</h3>
		</div>
		<div style="float: left;" class="jiange"></div>
		<div style="float: left; margin-left: 15px; margin-top: 10px;">
			<h3>${good}</h3>
			<h3 style="margin-top: 10px;">点赞</h3>
		</div>
	</div>
	</section>
	<!-- end -->
	<!-- 中部中 -->
	<div class="header-login3" style="margin-top: 20px;">
		<a class="open-vip" id="playall">我的作品</a>
		<a class="open-vip" id="guanzhu">关注</a>
		<a class="open-vip" id="shangchuan">上传音乐作品</a>
		<a class="open-vip" id="share">分享至音乐圈</a>
		<a class="open-vip" id="listening">听歌排行</a>
	</div>


	<!-- 关注界面 -->
	<div class="guanzhu">
	    <div class="header-login3"
			style="position:absolute;margin-left: 450px; margin-bottom: 100px;">
			<a class="open-vip" id="add2">好友推荐</a>
		</div>
		<div class="header-login3"
			style="margin-left: 580px; margin-top: -120px; margin-bottom: 100px;">
			<a class="open-vip" id="add">关注更多好友</a>
		</div>
		<div id="fudong2"
			style="position:absolute;margin-left: -90px; margin-top: -100px; z-index: 9999;display: none;">
			<iframe frameborder=0 width=400 height=400 marginheight=0
				marginwidth=0 scrolling=no src="getInfoOfUserClustering.do"></iframe>
	   </div>
		<div id="fudong"
			style="margin-left: -90px; margin-top: -100px; z-index: 9999; display: none;">
			<iframe frameborder=0 width=400 height=400 marginheight=0
				marginwidth=0 scrolling=no src="addfriendiframe.jsp"></iframe>
		</div>
		<c:choose>
			<c:when test="${friendListSize== null or friendListSize==''}">
				<img id="tupian" src="../../source/mysong/images/guanzhu.jpg" />
			</c:when>
			<c:otherwise>
				<div class="manyfriend">
					<c:forEach items="${friendList}" var="friends" varStatus="index">
						<div class="friend">
							<div id="nameicon" class="center_header3"
								style="margin-left: 22px; margin-top: 10px;">
								<c:choose>
									<c:when test="${friends.imgstr== null or friends.imgstr==''}">
										<a href="getFriendSong.do?user=${friends.friend}"><img
                                                src="../../source/mysong/images/pic02.jpg" alt="Pic 02" /></a>
									</c:when>
									<c:otherwise>
										<a href="getFriendSong.do?user=${friends.friend}"><img
											src="${friends.imgstr}" id="img2" /></a>
									</c:otherwise>
								</c:choose>
							</div>
							<div style="margin-top: 15px; font-size: 16px;">
								<a href="getFriendSong.do?user=${friends.friend}">${friends.friend}</a>
							</div>
							<div class="header-login4"
								style="margin-left: 5px; margin-top: 10px;">
								<a class="open-green" id="move"
									onclick="move('${friends.friend}')">已关注</a>
							</div>
						</div>
					</c:forEach>
					<div class="zxf_pagediv"
						style="margin-top: 400px; margin-left: -40px;"></div>
				</div>
			</c:otherwise>
		</c:choose>


	</div>

	<!--分享音乐界面 -->
	<div class="share">
	<!-- <form action="ShareDynamicServlet.do" method="post" id="shareform" style="font-size:15px;"> -->
	<form id="shareform" style="font-size:15px;">
	要分享的音乐：<select style="width:205px;height:30px;" id="MusicId" name="MusicId">
	<c:forEach items="${musicList}" var="music" varStatus="index">
	 <option style="width:205px;height:30px;" value="${music.id}">${music.musicName}</option>
	</c:forEach>
    </select>
    <div class="container" style="margin-top:30px;margin-bottom:-20px;">
    <div class="page-header">
            <div class="form-group" id="uploadForm" enctype='multipart/form-data'>
                <div class="h4">挑一张喜欢的图片作为歌曲配图吧~~</div>
                <div class="fileinput fileinput-new" data-provides="fileinput"  id="exampleInputUpload" style="margin-top:8px;">
                    <div class="fileinput-new thumbnail" style="width: 200px;height: auto;max-height:150px;border:1px solid #f0f0f0; ">
                        <img id='picImg' style="width: 190px;height: auto;max-height: 140px;padding:5px;" src="../../source/images/noimage.png" alt="" />
                    </div>
                    <div class="fileinput-preview fileinput-exists thumbnail" style="max-width: 200px; max-height: 150px;"></div>
                    <span class="header-login4">
                        <div class="btn btn-primary btn-file" style="margin-top:10px;">
                            <a href="" class="fileinput-new open-green" style="cursor:pointer;width:65px;float:clear;">选择文件</a>
                            <a href="" class="fileinput-exists open-green" style="width:65px;">换一张</a>
                            <input type="file" name="picID" id="picID" accept="image/jpeg"/>  
                        </div>
                        <a href="javascript:;" class="btn btn-warning fileinput-exists open-green" style="width:65px;margin-top:10px;" data-dismiss="fileinput">移除</a>  
                    </span>
                </div>

            </div>
    </div>
</div>
			<textarea name="textarea" placeholder="说点什么吧" cols="50" rows="6"
				class="textarea"></textarea>
			<div class="header-login"
				style="margin-right: -10px; margin-right: 528px;">
				<a class="open-green" id="shareMusic">点击分享</a>
			</div>
		</form>
	</div>
<!-- 分享界面结束 -->
<!-- 听歌排行 -->
<div class="listen" style="display:none;margin-left:5px;">
<iframe frameborder=0 width=1300 height=580 marginheight=0 marginwidth=0 scrolling=no src="getlistening.do?userName=${username}"></iframe>
</div>
<!-- 听歌排行结束 -->
	<script type="text/javascript" src="../../source/js/bootstrap-fileinput.js"></script>
	<script type="text/javascript">
$(function () {
    //比较简洁，细节可自行完善
    $('#shareMusic').click(function () {
    	var i = $('#MusicId option:selected').text();
    	var j = $("#picID").val();
    	if(i==null||i==""){
    		alert("暂无歌曲，请上传后再分享");
    	}else if(j==null||j==""){
    		alert("请选一幅喜欢的图片吧");
    	}else{
        var form = new FormData(document.getElementById("shareform"));
        $.ajax({
            url: 'uploadDynamicOfShare.do',
            type: 'POST',
            data: form,
            async: false,
            cache: false,
            contentType: false,
            processData: false,
            success: function (data) {
            qikoo.dialog2.confirm('要转到音乐圈查看刚发表的动态吗',function(){
            		window.location.href="getDynamic.do";
            	    },function(){
            	    window.location.reload();
            		});
            },
            error: function (data) {
                
            }
        });
    	}
    });
})
</script>
	<!-- 上传作品界面 -->
	<div class="shangchuan">
		<div id="demo" class="demo"
			style="margin-top: 20px; margin-left: 365px;"></div>
	</div>


	<!-- 我的作品界面 -->
	<div class="phInner">
		<div style="float: left; margin-top: 50px; width: 10px;">
			<input type="checkbox" name="allChecked" id="allChecked"
				onclick="DoCheck()" class="checkIn">
		</div>
		<div class="col" style="margin-left: 122px;">
			歌曲(${musicListSize})</div>
		<div class="col">原唱</div>
		<div class="col">类型</div>
		<div class="col">时长</div>
	</div>

	<div class="playBd" style="margin-top: -50px; margin-left: 70px;">
		<div class="scrollView">
			<!-- <div class="scroll"></div> -->
			<ul class="songUL">
				<c:forEach items="${musicList}" var="music" varStatus="index">

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
									<a href="playMusic.do?id=${music.id }&type=1"
										target='_new'>${music.musicName}</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">
									<a>${music.special }</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">
									<a>${music.type }</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">${music.time }</div>
							</div>
							<div class="control">
								<a class="cicon dele" sonID="${music.id}"></a>
							</div>
						</div>
					</li>
				</c:forEach>
				<div class="zxf_pagediv" style="margin-top: 40px;"></div>
			</ul>
		</div>
	</div>


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
					obj.append('<a href="myMusic.do?page=${pageNo-1}&musicName=${musicName}" class="prebtn">上一页</a>');
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
							obj.append('<a href="myMusic.do?page='+start+'&musicName=${musicName}" class="zxfPagenum nextpage">'+ start +'</a>');
						}else{
							obj.append('<a href="myMusic.do?page='+start+'&musicName=${musicName}" class="zxfPagenum">'+ start +'</a>');
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
					obj.append('<a href="myMusic.do?page=${pageNo+1}&musicName=${musicName}" class="nextbtn">下一页</a>');
				}
				/*尾部*/
				obj.append('<span>'+'共'+'<b>'+pageinit.pageNum+'</b>'+'页，'+'</span>');
				obj.append('<span><form action="myMusic.do" method="post" id="from1">到第<input type="text" value="${musicName}" name="musicName" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
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
	<footer class="footer"
		style="height:170px;width:100%;margin-top:120px;">
	<div class="footer-inner" style="height: 170px; width: 100%;">
		<div class="footer-copyright"
			style="height: 90px; padding-top: 40px; width: 100%;">
<p><a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a href="#">意见反馈</a><span>|</span><a href="#">独立音乐人合作</a><span>|</span><a href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a></p>
                <p>© 2018 Qingdao University of Technology| LPJ</p>
                <p><a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a></p>
		</div>
	</div>
	</footer>

</body>
</html>