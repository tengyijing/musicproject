<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>爱唱音乐-播放</title>
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<link rel="stylesheet" type="text/css" href="../../source/playmusic/css/scroll.css">
<link rel="stylesheet" type="text/css" href="../../source/playmusic/css/playMusic.css">
<script type="text/javascript" src="../../source/playmusic/js/jquery-1.10.2.js"></script>
<script type="text/javascript" src="../../source/playmusic/js/jquery-ui.js"></script>
<script type="text/javascript" src="../../source/playmusic/js/canvas.js"></script>
<script type="text/javascript" src="../../source/playmusic/js/mousewheel.js"></script>
<script type="text/javascript" src="../../source/playmusic/js/scroll.js"></script>
<script type="text/javascript" src="../../source/playmusic/js/playMusic.js"></script>

<!--新建歌单-->

<link href="../../source/playmusic/css/qikoo.css" type="text/css" rel="stylesheet" />
<script src="../../source/playmusic/js/qikoo.js"></script>
<script>
var type = '${type}';

</script>
</head>
<%-- <body onload="userLogin('${username}');"> --%>
<body>
	<!--模糊画布-->
	<div class="blur">
		<canvas style="width:1366px;height:700px;opacity:0;" width="1366" height="700" id="canvas">
	</div>
	<div class="playerMain">
		<div class="top">
			<a style="cursor: pointer;" href="../../index.jsp" >
			<h2 class="logoaichang" onmouseover="huan()" onmouseout="huan2()">爱唱音乐</h2></a>
			        <script> $(window).load(function(){fPlay('${id}')});
			        $(window).load(function(){bian('${type}')});</script>
			<div class="mainNav">
			<div id="nameicon" class="center_header" style="margin-left:60px;margin-right:10px;float:left;">
         <c:choose>
        <c:when test="${imgstr== null or imgstr==''}">
            <a href="userInfo.do"><img src="../../source/images/user.png" id="img1"/></a>
        </c:when>
        <c:otherwise>
        <a href="userInfo.do"><img src="${imgstr}" id="img2"/></a>
        </c:otherwise>
        </c:choose>
         </div>
         <div id="name" style="padding-top:21px;"><a href="userInfo.do" style="cursor:pointer;color:#fff" >${username}</a></div>
			</div>
		</div>
		<div class="middle">
			<div class="mainWrap">
				<div class="leftBar">
					<ul class="menuUL">
						<li class="menuLi cur"><a href="/play?type=now" class="bianse"
							onclick="menuLi()"> <i
								class="icon iplay"></i> 正在播放
						</a></li>
						<li class="menuLi cur"><a href="/play?type=history" class="bianse2"
							onclick="menuLi3()"> <i
								class="icon ihst"></i> 播放历史
						</a></li>
						<li class="menuLi cur"><a href="/play?type=myLove" class="bianse3"
							onclick="menuLi5()"> <i
								class="icon ishouc"></i> 我喜欢的音乐
						</a></li>
					</ul>
					<div class="collectOut">
						<span class="colS">创建的歌单</span> <a class="colA" onclick="payment();"></a>
						<div class="col" style="margin-left: -60px; width: 180px;">
							<ul class="menuUL2">
							<c:forEach items="${musicList}" var="music" varStatus="index1">
								<li class="menuLi2 cur">
								<div  class="beijing hp" single2="${music.name }">
								 <i class="icon isplay2"></i>
								 <a href="/play?type=${music.mlid }"style="color:black; background-color:transparent;">${music.name }</a>
								 <i class="cicon dele2" single3="${music.mlid }" delNo="${index1.index}"></i>
								 </div>
								</li>
							</c:forEach>
							</ul>
						</div>
					</div>

					<audio id="audio" src="http://other.web.nf01.sycdn.kuwo.cn/resource/n3/84/59/1143440808.mp3"></audio>
				</div>
				<div class="mainBody">
					<div class="playHd">
						<div class="phInner">
							<div class="col" id="gequ" lll="123">歌曲(${musicListSize2})</div>
							<div class="col">演唱者</div>
							<div class="col">专辑</div>
							<div class="col">喜爱</div>
						</div>
					</div>
					<div class="playBd">
						<div class="scrollView">
							<!-- <div class="scroll"></div> -->
							<ul class="songUL">
							<c:forEach items="${songs}" var="music" varStatus="index">
								<li class="songList" ListName="${music.mid}">
									<div class="songLMain">
										<div class="check">
											<input class="checkIn" name="choose" type="checkbox" select="0" value="${music.mid}">
										</div>
										<div class="start">
											<em sonN="${music.mid}" lrc="${music.lyricsurl}" musicUrl="${music.fileurl}" imgurl="${music.image }" ListId="${index.index}"><input type="text" style="display:none;" name="son" value="${music.mid}">${index.index+1}</em>
										</div>
										<div class="songBd">
											<div class="col colsn">${music.mname}</div>
											<div class="col colcn">${music.sname}</div>
											<%-- <div class="col">${music.special}</div> --%>
											<div class="col">待添加</div>
										</div>
										<div class="control" hp="123">
										    <c:choose>
                                            <%-- <c:when test="${music.love==1}"> --%>
                                            <c:when test="${music.isdownload==true}">
                                            <a class="cicon love" style="background-position:0 -131px" loveN="1"></a> 
                                            </c:when>
                                            <c:otherwise>
                                            <a class="cicon love" loveN="0"></a> 
                                            </c:otherwise>
                                            </c:choose> 
											<a class="cicon more" style="display: none"></a>
											 <a class="cicon dele" style="display: none"></a>
										</div>
									</div>
								</li>
								</c:forEach>
								<li class="songList"></li>
							</ul>
						</div>
						
					</div>
					<div class="songSingleChoose">
					    <div class="inner-container"> 
							<ul class="menuUL3" style="width:120px;height:200px;">
							<c:forEach items="${musicList}" var="music" varStatus="index1">
								<li class="menuLi3 cur">
								<a class="beijing" single="${music.name}">
								 <i class="icon isplay2"></i>${music.name}</a>
								</li>
							</c:forEach>
							</ul>
					   </div>
					</div>
					<!-- 新建歌单窗口 -->
					 <div class="dialog">
					 <div class="dialog-top">
					 <div class="title">新建歌单</div>
					 <div class="close" onclick="closeDialog()"></div>
					 </div>
					 <div class="dialog-content">
					 <div class="showMessage"></div>
					 歌单名称:&nbsp;&nbsp;<input type="text" name="musicListName" id="musicListName" style="height:28px;width:200px;margin-top:40px;">
					 <div class="btn">
					 <button class="wancheng" onclick="valSongSingle()">完成</button>
					 <button class="quxiao" onclick="closeDialog()">取消</button>
					 </div>
					 </div>
					 </div>
					<div class="playFt">			
						<div class="track">
						
							<div class="uiCheck">
								<input class="checkAll" name="allChecked" type="checkbox" select="0">
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itDele">删除</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itShou">收藏</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itJin">添加到歌单</a>
							</div>
							<div class="uiItem">
								<a href="#" class="itIcon itMore" onclick="hp()">更多</a>
							</div>
						</div>
					</div>
				</div>
				<div class="mainOuther">
					<div class="albumCover">
						<a href="#">
							<img src="source/playmusic/images/2.jpg" width="200" height="200" id="canvas1" class="canvas1">
						</a>
					</div>
					<div class="albumSale"></div>
					<div id="lyr" class="lyr"></div>
				</div>
			</div>
		</div>
		<div class="bottom" style="background-color: black;">
			<div class="playerWrap">
				<div class="playerCon" playStyle="0">
					<a href="#" class="pbtn prevBtn"></a>
					<a href="#" class="pbtn playBtn" isplay="0"></a>
					<a href="#" class="pbtn nextBtn"></a>
					<div style="color: #fff;" class="modesuiji">随机播放</div>
					<div style="color: #fff;" class="modeshunxv">顺序播放</div>
					<div style="color: #fff;" class="modedanqu">单曲循环</div>
					<a href="#" class="mode" onClick="mode2()"></a>
					<a href="#" class="mode2" onClick="mode3()"></a>
					<a href="#" class="mode3" onClick="mode()"></a>
				</div>
				<div class="playInfo">
					<div class="trackInfo">
						<a href="#" class="songName" singID="0" onclick="xs()">未知歌名</a> - <a href="#"
							class="songPlayer">未知歌手</a>
						<div class="trackCon">
							<a href="#" class="tc1" onclick="tc1change()"></a> <a href="#"
								class="tc2"></a> <a href="#" class="tc3"></a>
						</div>
					</div>
					<div class="playerLength">
						<div class="position">00:00</div>
						<div class="progress">
							<div class="pro1"></div>
							<div class="pro2">
								<a href="#" class="dian"></a>
							</div>
						</div>
						<div class="duration">00:00</div>
					</div>
				</div>
				<div class="vol">
					<a class="pinBtn" onclick="pinBtnchange()"></a>
					<div class="volm">
						<a class="volSpeaker" onclick="volSpeakerchange()"></a>
						<div class="volControl">
							<a class="dian2"></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
