<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>听歌排行</title>
<script src="../../source/js/jquery.min.js"></script>
<script src="../../source/js/script.js"></script>
<!-- 中部样式 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/css/scroll.css">
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/css/lovesearch.css">
<script type="text/javascript" src="../../source/SearchMusic/js/canvas.js"></script>
<script type="text/javascript" src="../../source/SearchMusic/js/mousewheel.js"></script>
<script type="text/javascript" src="../../source/SearchMusic/js/love.js"></script>
<script type="text/javascript" src="../../source/SearchMusic/js/scroll.js"></script>
<!-- 横向柱状图 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/css/cols.css">
<!-- 分页样式 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/fenye/css/zxf_page.css" />
</head>
<body>
	<c:choose>
		<c:when test="${isUserName==true}">
			<div style="margin-left: 70px; margin-top: 50px;">
				<span><b style="font-size: 21px; color: #666666;">听歌排行</b></span> <span
					style="font-size: 14px; margin-left: 10px;">累计听歌${listeningCount}首</span>
				<c:choose>
					<c:when test="${isListening=='false'}">
						<span style="font-size: 15px; margin-left: 820px;"
							onclick="isVisitListening2()"><a id="han"
							style="cursor: pointer; color: #586063;">开启访客查看</a></span>
					</c:when>
					<c:otherwise>
						<span style="font-size: 15px; margin-left: 820px;"
							onclick="isVisitListening()"><a id="han"
							style="cursor: pointer;">关闭访客查看</a></span>
					</c:otherwise>
				</c:choose>
			</div>

			<div
				style="margin-left: 70px; width: 1200px; margin-top: 10px; border-bottom: 2px solid #C20C0C;">
				<!-- <div class="phInner" style="margin-left:72px; margin-top:-10px;">
			<div class="col">歌曲</div>
			<div class="col">歌手</div>
			<div class="col">次数</div>
		</div> -->
			</div>
			<div class="playBd" style="margin-left: 70px; margin-top: 50px;">
				<div class="scrollView">
					<!-- <div class="scroll"></div> -->
					<ul class="songUL">
						<c:forEach items="${listeningList}" var="music" varStatus="index">

							<li class="songList">
								<div class="songLmain">
									<div class="start">
										<em sonN="2" style="font-size: 16px;">${index.index+1 }</em>
									</div>
									<div class="songBd">
										<div class="col colsn" style="font-size: 16px;">
											<a href="playMusic.do?id=${music.musicId}&type=1"
												target='_new' style="color: black;">${music.musicName}</a>
										</div>
										<div class="col colcn" style="font-size: 16px;">
											<a>${music.singer}</a>
										</div>
										<div class="col colcn" style="font-size: 16px;">
											<span class="g_bar" style="width:${music.bilv}"><div
													style="font-size: 14px; margin-top: -5px; margin-left: 10px; width: 50px;">${music.count}次</div></span>
										</div>
									</div>
									<div class="control">
										<a class="cicon more"></a>
									</div>
								</div>
							</li>
						</c:forEach>
						<div class="zxf_pagediv" style="margin-top: 20px;"></div>
					</ul>
				</div>
			</div>
			</div>
		</c:when>
		<c:otherwise>
			<c:choose>
				<c:when test="${isListening=='true'}">
					<div style="margin-left: 70px; margin-top: 50px;">
						<span><b style="font-size: 21px; color: #666666;">听歌排行</b></span>
						<span style="font-size: 14px; margin-left: 10px;">累计听歌${listeningCount}首</span>
					</div>

					<div
						style="margin-left: 70px; width: 1200px; margin-top: 10px; border-bottom: 2px solid #C20C0C;">
						<!-- <div class="phInner" style="margin-left:72px; margin-top:-10px;">
			<div class="col">歌曲</div>
			<div class="col">歌手</div>
			<div class="col">次数</div>
		</div> -->
					</div>
					<div class="playBd" style="margin-left: 70px; margin-top: 50px;">
						<div class="scrollView">
							<!-- <div class="scroll"></div> -->
							<ul class="songUL">
								<c:forEach items="${listeningList}" var="music"
									varStatus="index">

									<li class="songList">
										<div class="songLmain">
											<div class="start">
												<em sonN="2" style="font-size: 16px;">${index.index+1 }</em>
											</div>
											<div class="songBd">
												<div class="col colsn" style="font-size: 16px;">
													<a href="playMusic.do?id=${music.musicId}&type=1"
														target='_new' style="color: black;">${music.musicName}</a>
												</div>
												<div class="col colcn" style="font-size: 16px;">
													<a>${music.singer}</a>
												</div>
												<div class="col colcn" style="font-size: 16px;">
													<span class="g_bar" style="width:${music.bilv}"><div
															style="font-size: 14px; margin-top: -5px; margin-left: 10px; width: 50px;">${music.count}次</div></span>
												</div>
											</div>
											<div class="control">
												<a class="cicon more"></a>
											</div>
										</div>
									</li>
								</c:forEach>
								<div class="zxf_pagediv" style="margin-top: 20px;"></div>
							</ul>
						</div>
					</div>
					</div>
				</c:when>
				<c:otherwise>
					<div style="font-size: 22px; color: #586063;margin:0 auto; text-align:center;margin-top:70px;">
						<b>暂无权限</b>
					</div>
				</c:otherwise>
				</c:choose>
		</c:otherwise>
	</c:choose>
	<!-- 分页部分 -->
	<script src="../../source/SearchMusic/fenye/js/jquery.min.js"
		type="text/javascript"></script>
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
					obj.append('<a href="getlistening.do?page=${pageNo2-1}&userName=${listenName}" class="prebtn"  style="font-size:16px;">上一页</a>');
				} else{
					obj.remove('.prevPage');
					obj.append('<span class="disabled" style="font-size:16px;">上一页</span>');
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
							obj.append('<a href="getlistening.do?page='+start+'&userName=${listenName}" class="zxfPagenum nextpage">'+ start +'</a>');
						}else{
							obj.append('<a href="getlistening.do?page='+start+'&userName=${listenName}" class="zxfPagenum">'+ start +'</a>');
						}
					}
				}
				if (end < pageinit.pageNum) {
					obj.append('<span>...</span>');
				}
				/*下一页*/
				if (pageinit.current >= pageinit.pageNum) {
					obj.remove('.nextbtn');
					obj.append('<span class="disabled" style="font-size:16px;">下一页</span>');
				} else{
					obj.append('<a href="getlistening.do.do?page=${pageNo2+1}&userName=${listenName}" class="nextbtn" style="font-size:16px;">下一页</a>');
				}
				/*尾部*/
				obj.append('<span>'+'共'+'<b>'+pageinit.pageNum+'</b>'+'页，'+'</span>');
				obj.append('<span><form action="getlistening.do" method="post" id="from1">到第<input type="text" value="${listenName}" name="userName" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
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
	pageNum: ${count4},
	current: ${pageNo2},
	backfun: function(e) {
	//console.log(e);//回调
}
});
</script>
</body>
</html>