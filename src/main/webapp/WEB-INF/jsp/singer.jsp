<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <title>个性推荐</title>
    <!-- 头部 -->
    <link rel="shortcut icon" href="../../source/images/logo-b.png"/>
    <link rel="stylesheet" href="../../source/css/reset.css">
    <link rel="stylesheet" href="../../source/css/index.css">
    <script src="../../source/js/jquery.js"></script>
    <script src="../../source/js/script.js"></script>
    <script src="/myjs/searcher.js"></script>
    <script src="/myjs/index.js"></script>
    <!-- 头部 -->
    <!-- 音乐人 -->
    <style>
        .sing {
            color: black;
        }

        .sing:hover {
            color: red;
        }
    </style>
    <link rel="stylesheet" type="text/css"
          href="../../source/singer/css/style.css"/>
    <link rel="stylesheet" type="text/css"
          href="source/singer/css/index.css"/>
    <link rel="Shortcut Icon" href="source/singer/images/favicon.ico"/>
    <script type="text/javascript" src="../../source/singer/js/modernizr.js"></script>
    <!-- 音乐人 -->
    <!-- 提示框 -->
    <link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
          rel="stylesheet"/>
    <script src="../../myjs/qikoo.js"></script>
    <script type="text/javascript">
        var menuid =
        ${menuid}
    </script>
</head>
<body onload="getName('${username}');">
<header class="header">
    <div class="header-container" style="width: 1200px;">
        <div class="header-top">
            <a href="../../index.jsp" class="logo"></a>
            <nav class="header-nav">
                <ul id="topsinger">

                </ul>
            </nav>
            <div class="header-search" style="margin-left:-20px;">
        <form action="/seacher" method="post" id="searchform" onsubmit="return searchNull()">
          <input style="width:170px;" type="text" class="text" placeholder="我是歌手第四季" name="musicName" id="musicName" speech x-webkit-speech onkeyup="searchStr(this.value)" />
          <span class="btn" id="vid" style="float:left;"><i><img  style="margin-top:6px;"src="../../source/images/video.png" ></i></span>
          <span class="btn" onclick="search();"><i class="icon-sprite"></i></span>
          </form>
          <div class="videoFrame">
           <iframe  frameborder=0 width=290 height=330 marginheight=0 marginwidth=0 scrolling=no src="video.jsp"></iframe>
          </div>
          <div class="result" id="searchBox">
         <c:forEach items="${hot}" var="hot_song" varStatus="stat">
				<c:if test="${stat.count<=6 }">
				<a  class="result-item" href="play?id=${hot_song.musicid}" target='_new'> 
				<span class="rank">${stat.count }</span> 
				<span class="title">${hot_song.title}</span> <span class="num">${hot_song.playsum }万</span></a>
				</c:if>	
				</c:forEach>				

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
        <ul class="header-subNav" style="margin-top: 20px;" id="topsingerChild">

        </ul>
    </div>
</header>
<!-- 音乐馆 模块 开始  default-->
<section class="section_cont"> <!--MV首播 开始-->
    <div class="new_mv new_common">
        <!--标题 开始-->
        <div class="new_mv_title new_common_title index_mv_title">
            <span></span> <a href="?cat=6" class="more"></a>
            <ul style="float: left; margin-left: -150px;">
                <li><a href="javascript:;" style="text-decoration: none;"><font
                        color=#FA3B4A>歌曲推荐</font></a></li>
            </ul>
        </div>
        <div style="margin-left: 15px; margin-top: 10px; margin-bottom: 5px;">根据您的听歌记录，实时生成</div>
        <!--标题 结束-->
        <div class="new_mv_body index_mv_body">
            <!--1首播-->
            <div class="mvList" style="display: block;">
                <c:choose>
                    <c:when test="${recommendedSongsListSize==null or recommendedSongsListSize==''}">
                        <div style="margin-top:70px;text-align:center;">
                            <b>您的听歌记录太少了，请您多听几首再来</b>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <ul class="sb">
                            <c:forEach items="${recommendedSongsList}" var="recommended"
                                       varStatus="index">
                                <li><a href="${recommended.musicStr}" target='_new'> <img
                                        width="220" height="125" src="${recommended.imageStr}"
                                        class="attachment-220x125 wp-post-image" alt="mv_1x2_10"/>
                                    <strong>${recommended.musicName}</strong>
                                    <strong><font color="#FA3B4A">${recommended.singer}</font></strong>
                                    <span> <font>${recommended.musicName}
												&#8211;${recommended.singer}</font> <font><i></i></font> <font><i></i><em></em></font>
									</span>
                                </a></li>
                            </c:forEach>
                        </ul>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
    <!--MV首播 结束--> <!--新歌推荐 开始--> <!--精选集 开始-->
    <div class="omnibus hot_singer">
        <div class="omnibus_cont new_common">
            <div class="omnibus_title new_common_title">
                <span><font color="red">精选集</font></span> <a href="" class="more"></a>
            </div>
            <ul id="omnibus_list">
                <li class="post_big"><a href=""> <img
                        src="../../source/singer/images/20141010110027.jpg.jpg" alt=""
                        width="305" height="290"> <i></i>
                </a> <a href="" style="text-decoration: none; color: #EF8F90"
                        class="sing">神曲虐我千百遍，我待神曲如初恋</a></li>
                <li class="post_small"><a href=""> <img
                        src="../../source/singer/images/20141010110103.jpg" alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">孤单的时候有二次元</a>
                </li>
                <li class="post_small"><a href=""> <img
                        src='../../source/singer/images/20141010110157.jpg' alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">萌娃爱唱歌</a></li>
                <li class="post_small"><a href=""> <img
                        src="../../source/singer/images/20141010110216.jpg" alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">不疯狂,不青春</a>
                </li>
                <li class="post_small"><a href=""> <img
                        src='../../source/singer/images/20141010110239.jpg' alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">00后出没，请注意！</a>
                </li>
                <li class="post_small"><a href=""> <img
                        src='../../source/singer/images/20141013142335.jpg' alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">爱你就是永远的承诺</a>
                </li>
                <li class="post_small"><a href=""> <img
                        src="../../source/singer/images/20141013142414.jpg" alt="" width="130"
                        height="130"> <span></span>
                </a> <a href="" style="text-decoration: none; color: #EF8F90">笑多了会怀孕哦</a>
                </li>
            </ul>
        </div>
        <div class="hot_singer_cont new_common">
            <div class="hot_singer_title new_common_title">
                <span><font color="red">热门歌手</font></span> <a href="" class="more"></a>
            </div>
            <ul class="singer_list">
                <li><a href="?p=369" class="singerPhoto"> <img
                        src="../../source/singer/images/0025NhlN2yWrP4.jpg" alt="" width="70"
                        height="70"></a> <a href="?p=369" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">周杰伦</a>
                </li>
                <li><a href="?p=357" class="singerPhoto"> <img
                        src="../../source/singer/images/001BLpXF2DyJe2.jpg" alt="" width="70"
                        height="70"></a> <a href="?p=357" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">林俊杰</a>
                </li>
                <li><a href="?p=363" class="singerPhoto"> <img
                        src="../../source/singer/images/003Nz2So3XXYek.jpg" alt="" width="70"
                        height="70"></a> <a href="?p=363" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">陈奕迅</a>
                </li>
                <li><a href="?p=367" class="singerPhoto"> <img
                        src="../../source/singer/images/002azErJ0UcDN6.jpg" alt="" width="70"
                        height="70"></a> <a href="?p=367" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">张杰</a>
                </li>
                <li><a href="?p=360" class="singerPhoto"> <img
                        src='../../source/singer/images/001fNHEf1SFEFN.jpg' alt="" width="70"
                        height="70"></a> <a href="?p=360" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">邓紫棋</a>
                </li>
                <li><a href="?p=345" class="singerPhoto"> <img
                        src="../../source/singer/images/000CK5xN3yZDJt.jpg" alt="" width="70"
                        height="70"></a> <a href="?p=345" class="singer"
                                            style="text-decoration: none; color: #EF8F90; margin-left: 20px;">许嵩</a>
                </li>
                <div style="clear: both;"></div>
            </ul>
            <ul class="singer_classify">
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">华语男歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">华语女歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">华语女组合</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">日韩男歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">日韩女歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">日韩组合</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">欧美男歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">欧美女歌手</a></li>
                <li><a href="" class="singer"
                       style="text-decoration: none; color: #F2A2A5">欧美组合</a></li>
            </ul>
        </div>
        <div style="clear: both"></div>
    </div>
    <!--精选集 结束--> </section>
<!-- 音乐馆 模块 结束 -->

<!-- 底部模板调用 开始 -->
<!-- footer -->
<footer class="footer" style="height:170px;width:100%;margin-top:50px;">
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
<script type="text/javascript" src="singer/js/index.js"></script>
<!--播放器js-->
<script type="text/javascript" src="singer/js/player.js"></script>
<script type="text/javascript" src="singer/js/playlist.js"></script>
<script type="text/javascript" src="singer/js/player_database.js"></script>
<!--播放器js-->
<!-- 底部模板调用 结束 -->
</html>