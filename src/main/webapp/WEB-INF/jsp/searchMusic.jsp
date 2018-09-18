<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>音乐搜索</title>
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<link rel="stylesheet" href="../../source/css/index.css">
<link rel="stylesheet" href="../../source/css/reset.css">

<script src="../../source/js/jquery.min.js"></script>
<script src="/myjs/index.js"></script>
<!-- 中部样式 -->
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
<script src="../../myjs/qikoo.js"></script>
<script language="javascript">
        userLogin('${username}')
        
        
        
     // 功能栏 歌曲添加到歌单功能
    	var flag6 = false;
        var objname = "";
    	function add() {
    		var j = 0;
    		var ch = document.getElementsByName("choose");
    		var pankong = $(".menuUL3").find("li").length>0;
    		alert(pankong);
    		for (var i = 0; i < ch.length; i++) {
    			if (ch[i].checked) {
    				j++;
    			}
    		}
    		if (j == 0) {
    			qikoo.dialog2.alert("未选择歌曲");
    		} else if (!pankong) {
    			qikoo.dialog2.alert("歌单为空，请新建歌单");
    		} else {
    			if (flag6) {
    				$(".jump").hide();
    				flag6 = false;
    			} else {
    				$(".jump").show();
					$(".menuLi3").click(function () {
						for(var i=0;i<ch.length;i++){
							if(ch[i].checked){
								addSongsingle(ch[i].value, objname);	
							}
						}
						$(".jump").hide();
    					qikoo.dialog2.alert("添加成功");
    					for (var i = 0; i < ch.length; i++) {
    						ch[i].checked = false;
    					}
    					$(".checkIn").hide();
    					$("#piliang").html("批量选择");
    					flag = false;
					})			 
    				flag6 = true;
    			}
    		
    		}
    	}
      
    function name1(obj){	
    	objname = obj.getAttribute("single")
    }
    
    
    function addSongsingle(sid, single) {
    	alert("sdfsdfsdf")
    	$.ajax({
    		type : 'get',
    		url : '/serachAdd',
    		async : false,// (默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为
    						// false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
    		data : {
    			mlid : sid,
    			mid : single,
    		},
    		success : function(data) {
    			
    		}

    	});
    }
    </script>
</head>
<body onload="getName('${username}');">
<a name="ab">sdfsdf</a>
	<header class="header">
	<div class="header-container">
		<div class="header-top">
			<a href="../../index.jsp" class="logo"></a>
			<nav class="header-nav">
			<ul>
				<c:forEach items="${TbMenu }" var="tbmenu" varStatus="stat">
					<c:if test="${stat.count==1 }">
						<li><a href="index?menuid=2" class="header-nav__cur">${tbmenu.mname}</a></li>
					</c:if>
					<c:if test="${stat.count!=1 }">
						<li><a href="/${tbmenu.ename }?menuid=${tbmenu.mid}">${tbmenu.mname}</a></li>

					</c:if>
				</c:forEach>
			</ul>
			</nav>
			<div class="header-search">
				<form action="searchMusic.do" method="post" id="searchform">
					<input style="width: 170px;" type="text" class="text"
						placeholder="我是歌手第四季" name="musicName" id="musicName" speech
						x-webkit-speech /> <span class="btn" id="vid" style="float: left;"><i><img
							style="margin-top: 6px;" src="../../source/images/video.png"></i></span>
					<span class="btn" onclick="search();"><i class="icon-sprite"></i></span>
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
	</div>
	</header>

	<!-- 精彩推荐 -->
	<div class="main" id="recommend">
		<div class="main-inner">
			<div class="carousel">
				<div class="carousel-slider">
					<a href="#" class="item item-pic1"><img
						src="../../source/images/cont/11.png" alt="#"></a> <a href="#"
						class="item item-pic2"><img
						src="../../source/images/cont/22.png" alt="#"></a> <a href="#"
						class="item item-pic3"><img
						src="../../source/images/cont/33.png" alt="#"></a> <a href="#"
						class="item item-pic4"><img
						src="../../source/images/cont/44.jpg" alt="#"></a> <a href="#"
						class="item item-pic5"><img
						src="../../source/images/cont/55.jpg" alt="#"></a> <a href="#"
						class="item item-pic6"><img
						src="../../source/images/cont/66.jpg" alt="#"></a>
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
	<div class="playHd"
		style="margin-top: 40%; margin-left: 70px; width: 1200px;">
		<div class="header-login2" style="margin-top: -5%">
			<a class="open-vip" id="playall">播放全部</a> <a class="open-vip"
				id="addTo" onclick="add()">添加到</a>
			<div class="jump">
				<div class="inner-container">

					<ul class="menuUL3" style="width: 120px; height: 200px;">

						<c:forEach items="${musicList}" var="music" varStatus="index1">
							<li class="menuLi3 cur"><a class="beijing"
								single="${music.mlid}"   onclick="name1(this)"> ${music.name}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>

			<a class="open-vip" id="piliang" onclick="checkIn()">批量操作</a>
		</div>

		<div class="phInner">
			<div style="float: left; margin-top: 10px; width: 10px;">
				<input type="checkbox" name="allChecked" id="allChecked"
					onclick="DoCheck()" class="checkIn">
			</div>
			<div class="col" style="margin-left: 54px;">
				歌曲(${song.song.size()})</div>
			<div class="col">演唱者</div>
			<div class="col">专辑</div>
			<div class="col">上传时间</div>
		</div>
	</div>
	<div class="playBd" style="margin-top: 40%; margin-left: 70px;">
		<div class="scrollView">
			<!-- <div class="scroll"></div> -->

			<ul class="songUL">
				<c:forEach items="${song.song}" var="music" varStatus="index">
					<li class="songList">
						<div class="songLmain">
							<div class="check">
								<input class="checkIn" type="checkbox" name="choose"
									value="${music.mid}">
							</div>
							<div class="start">
								<em sonN="2" style="font-size: 16px;">${index.index+1 }</em>
							</div>
							<div class="songBd">
								<div class="col colsn" style="font-size: 16px;">
									<a href="play?id=${music.mid } target='_new' ">${music.mname}</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">
									<a>${music.sname }</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">
									<a>${music.mname }</a>
								</div>
								<div class="col colcn" style="font-size: 16px;">
									<fmt:formatDate value="${music.uploaddate}" pattern="yyy-MM-dd" />
								</div>
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
	<script src="../../source/SearchMusic/fenye/js/jquery.min.js"
		type="text/javascript"></script>
	<script src="../../source/SearchMusic/fenye/js/zxf_page.js"
		type="text/javascript"></script>
	<script type="text/javascript">
    (function ($) {
        var zp = {
            init: function (obj, pageinit) {
                return (function () {
                    zp.addhtml(obj, pageinit);
                    zp.bindEvent(obj, pageinit);
                }());
            },
            addhtml: function (obj, pageinit) {
                return (function () {
                    obj.empty();
                    /*上一页*/
                    if (pageinit.current > 1) {
                        obj.append('<a href="searchMusic.do?page=${pageNo-1}&musicName=${musicName}" class="prebtn">上一页</a>');
                    } else {
                        obj.remove('.prevPage');
                        obj.append('<span class="disabled">上一页</span>');
                    }
                    /*中间页*/

                    if (pageinit.current > 4 && pageinit.current <= pageinit.pageNum - 5) {
                        var start = pageinit.current - 2, end = pageinit.current + 2;
                    } else if (pageinit.current > 4 && pageinit.current > pageinit.pageNum - 5) {
                        var start = pageinit.pageNum - 4, end = pageinit.pageNum;
                    } else {
                        var start = 1, end = 9;
                    }
                    for (; start <= end; start++) {
                        if ((start <= pageinit.pageNum) && (start >= 1)) {
                            if (start == pageinit.current) {
                                obj.append('<span class="current">' + start + '</span>');
                            } else if (start == pageinit.current + 1) {
                                obj.append('<a href="searchMusic.do?page=' + start + '&musicName=${musicName}" class="zxfPagenum nextpage">' + start + '</a>');
                            } else {
                                obj.append('<a href="searchMusic.do?page=' + start + '&musicName=${musicName}" class="zxfPagenum">' + start + '</a>');
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
                    } else {
                        obj.append('<a href="searchMusic.do?page=${pageNo+1}&musicName=${musicName}" class="nextbtn">下一页</a>');
                    }
                    /*尾部*/
                    obj.append('<span>' + '共' + '<b>' + pageinit.pageNum + '</b>' + '页，' + '</span>');
                    obj.append('<span><form action="searchMusic.do" method="post" id="from1">到第<input type="text" value="${musicName}" name="musicName" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
                    //obj.append('<span class="zxfokbtn"><a onclick="javascript:document.form1.submit();">确定</a></span>');
                }());
            },
            bindEvent: function (obj, pageinit) {
                return (function () {
                    obj.on("click", "a.prebtn", function () {
                        var cur = parseInt(obj.children("span.current").text());
                        var current = $.extend(pageinit, {"current": cur - 1});
                        zp.addhtml(obj, current);
                        if (typeof(pageinit.backfun) == "function") {
                            pageinit.backfun(current);
                        }
                    });
                    obj.on("click", "a.zxfPagenum", function () {
                        var cur = parseInt($(this).text());
                        var current = $.extend(pageinit, {"current": cur});
                        zp.addhtml(obj, current);
                        if (typeof(pageinit.backfun) == "function") {
                            pageinit.backfun(current);
                        }
                    });
                    obj.on("click", "a.nextbtn", function () {
                        var cur = parseInt(obj.children("span.current").text());
                        var current = $.extend(pageinit, {"current": cur + 1});
                        zp.addhtml(obj, current);
                        if (typeof(pageinit.backfun) == "function") {
                            pageinit.backfun(current);
                        }
                    });
                    obj.on("click", "span.zxfokbtn", function () {
                        var cur = parseInt($("input.zxfinput").val());
                        var current = $.extend(pageinit, {"current": cur});
                        zp.addhtml(obj, {"current": cur, "pageNum": pageinit.pageNum});
                        if (typeof(pageinit.backfun) == "function") {
                            pageinit.backfun(current);
                        }
                    });
                }());
            }
        }
        $.fn.createPage = function (options) {
            var pageinit = $.extend({
                pageNum: 15,
                current: 1,
                backfun: function () {
                }
            }, options);
            zp.init(this, pageinit);
        }
    }(jQuery));

    $(".zxf_pagediv").createPage({
        pageNum: ${count},
        current: ${pageNo},
        backfun: function (e) {
            //console.log(e);//回调
        }
    });
</script>


	<!-- footer -->
	<footer class="footer" style="height:170px;width:100%;margin-top:30%">
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

	<script src="../../source/js/jquery.min.js"></script>
	<script src="../../source/js/script.js"></script>


</body>
</html>