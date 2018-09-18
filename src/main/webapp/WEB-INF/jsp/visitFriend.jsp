<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>好友空间</title>
    <link rel="shortcut icon" href="../../source/images/logo-b.png"/>
    <!-- 头部 -->
    <link rel="stylesheet" href="../../source/css/reset.css">
    <link rel="stylesheet" href="../../source/css/index.css">
    <script src="../../source/js/jquery.js"></script>
    <script src="../../source/js/script.js"></script>
    <script src="../../source/js/index.js"></script>
    <!-- 主体 -->
    <link rel="stylesheet" href="../../source/mysong/css/main.css">
    <script src="../../source/mysong/js/main.js"></script>
    <script src="../../source/mysong/js/addFriend.js"></script>
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

    <!-- 分页样式 -->
    <link rel="stylesheet" type="text/css"
          href="../../source/SearchMusic/fenye/css/zxf_page.css"/>

    <!--提示框-->
    <link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
          rel="stylesheet"/>
    <script src="../../myjs/qikoo.js"></script>
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
</head>
<body onload="getName('${username}');userLogin('${username}');">
<header class="header">
    <div class="header-container" style="width: 1200px;">
        <div class="header-top">
            <a href="../../index.jsp" class="logo"></a>
            <nav class="header-nav">
                <ul>
                    <li><a href="../../index.jsp">音乐基地</a></li>
                    <li><a href="myMusic.do" class="header-nav__cur">我的歌声</a></li>
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
            <div class="header-search" style="margin-left: -20px;">
                <form action="searchMusic.do" method="post" id="searchform">
                    <input style="width: 170px;" type="text" class="text"
                           placeholder="我是歌手第四季" name="musicName" id="musicName" speech
                           x-webkit-speech/> <span class="btn" id="vid"
                                                   style="float: left;"><i><img style="margin-top: 6px;"
                                                                                src="../../source/images/video.png"></i></span>
                    <span class="btn"
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
				<a href="personal"><img src="${imgstr}" id="img2" /></a>
			</div>
			<div id="name" style="display: none; padding-top: 35px;">
				<a href="personal" style="cursor: pointer"><i
					onmouseover="xianshi()" onmouseout="xiaoshi2()">${username}</i></a>
			</div>
			<div id="xianshi">
				<p style="margin-left: 5px; margin-top: 3px;">
					<a href="personal"><img src="/images/person.png"></a>
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
        <ul class="header-subNav" style="margin-top: 20px;">
            <li><a href="#" class="subNav-cur">首页</a></li>
            <li><a href="recommendedSongs.do">个性推荐</a></li>
            <li><a href="rank.do">排行榜</a></li>
            <li><a href="musicClassify.jsp">音乐分类</a></li>
            <li><a href="getDynamic.do">音乐圈</a></li>
            <li><a href="huati.jsp">话题</a></li>

        </ul>
    </div>
</header>
<!-- 中部上 -->
<section id="banner" style="margin-top:30px; color:#FFFFFF">
    <div class="header2">
        <h3>欢迎来到${user}的音乐空间</h3>
    </div>
    <div
            style="position: relative; margin-left: 1080px; margin-top: -45px;">
        <a href="myMusic.do"><img src="../../source/mysong/images/return.png"/></a>
    </div>
    <div class="image round" style="margin-top: -15px;">
        <c:choose>
            <c:when test="${img== null or img==''}">
                <a><img src="../../source/mysong/images/pic02.jpg" alt="Pic 02"/></a>
            </c:when>
            <c:otherwise>
                <a><img src="${img}" id="img2"/></a>
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
    <a class="open-vip" id="friendshow">好友作品</a>
    <c:choose>
        <c:when test="${isfriend== null or isfriend==''}">
            <a class="open-vip" id="addguanzhu" onclick="addFriend('${user}')"
               hp="0">添加关注</a>
        </c:when>
        <c:otherwise>
            <a class="open-vip" id="addguanzhu"
               onclick="addFriend('${user}','${isfriend}')" hp="1">已关注</a>
        </c:otherwise>
    </c:choose>
    <a class="open-vip" id="listen123">听歌排行</a>
</div>

<!-- 我的作品界面 -->
<div class="phInner">
    <div style="float: left; margin-top: 10px; width: 10px;">
        <input type="checkbox" name="allChecked" id="allChecked"
               onclick="DoCheck()" class="checkIn">
    </div>
    <div class="col" style="margin-left: 122px;">
        歌曲(${musicListSize})
    </div>
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
                                <a href="playMusic.do?id=${music.id }&type=1" target='_new'>${music.musicName}</a>
                            </div>
                            <div class="col colcn" style="font-size: 16px;">
                                <a>${music.special }</a>
                            </div>
                            <div class="col colcn" style="font-size: 16px;">
                                <a>${music.type }</a>
                            </div>
                            <div class="col colcn" style="font-size: 16px;">${music.time }</div>
                        </div>
                    </div>
                </li>
            </c:forEach>
            <div class="zxf_pagediv" style="margin-top: 40px;"></div>
        </ul>
    </div>
</div>

<div class="listen124" style="display:none">
    <iframe frameborder=0 width=1300 height=580 marginheight=0 marginwidth=0 scrolling=no
            src="getlistening.do?userName=${user}"></iframe>
</div>

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
                        obj.append('<a href="getFriendSong.do?page=${pageNo-1}&user=${user}" class="prebtn">上一页</a>');
                    } else {
                        obj.remove('.prevPage');
                        obj.append('<span class="disabled">上一页</span>');
                    }
                    /*中间页*/
                    if (pageinit.current > 4 && pageinit.pageNum > 4) {
                        obj.append('<a href="javascript:;" class="zxfPagenum">' + 1 + '</a>');
                        obj.append('<a href="javascript:;" class="zxfPagenum">' + 2 + '</a>');
                        obj.append('<span>...</span>');
                    }
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
                                obj.append('<a href="getFriendSong.do?page=' + start + '&user=${user}" class="zxfPagenum nextpage">' + start + '</a>');
                            } else {
                                obj.append('<a href="getFriendSong.do?page=' + start + '&user=${user}" class="zxfPagenum">' + start + '</a>');
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
                        obj.append('<a href="getFriendSong.do?page=${pageNo+1}&user=${user}" class="nextbtn">下一页</a>');
                    }
                    /*尾部*/
                    obj.append('<span>' + '共' + '<b>' + pageinit.pageNum + '</b>' + '页，' + '</span>');
                    obj.append('<span><form action="getFriendSong.do" method="post" id="from1">到第<input type="text" value="${user}" name="user" style="display:none;"><input type="text" name="page" class="zxfinput"/>页<button type="submit" class="zxfokbtn" style="margin-top:5px; margin-left:5px;">确定</button></form></span>');
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
<footer class="footer"
        style="height:170px;width:100%;margin-top:100px;">
    <div class="footer-inner" style="height: 170px; width: 100%;">
        <div class="footer-copyright"
             style="height: 90px; padding-top: 40px; width: 100%;">
            <p><a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a href="#">意见反馈</a><span>|</span><a
                    href="#">独立音乐人合作</a><span>|</span><a href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a></p>
            <p>© 2018 Qingdao University of Technology| LPJ</p>
            <p><a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a></p>
        </div>
    </div>
</footer>

</body>
</html>