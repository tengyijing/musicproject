<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="UTF-8">
<title>排行榜</title>
<!-- 头部 -->
<link rel="shortcut icon" href="source/images/logo-b.png" />
<link rel="stylesheet" href="source/css/reset.css">
<link rel="stylesheet" href="source/css/index.css">
  <script src="source/js/jquery.min.js"></script>
  <script src="source/js/script.js"></script>
<script src="source/js/index.js"></script>
<!-- 排行榜 -->
          
<link rel="stylesheet" data-dist="true" href="source/content/css/lomegwdp.css"/>
<style>
/*滚动条*/
::-webkit-scrollbar{width:6px; height:6px;}
::-webkit-scrollbar-track-piece{background-color:;}
body::-webkit-scrollbar-track-piece{background-color:#ccc;}
::-webkit-scrollbar-track-piece:no-button{}
::-webkit-scrollbar-thumb{background-color:#F5B5B6;border-radius: 2px;}
::-webkit-scrollbar-thumb:hover{background-color:#F5B5B6;}
::-webkit-scrollbar-thumb:active{background-color:#F5B5B6;}
/*/滚动条*/
</style>
<!-- 提示框 -->
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
        <li><a href="rank.do"  class="subNav-cur">排行榜</a></li>
        <li><a href="musicClassify.jsp">音乐分类</a></li>
        <li><a href="getDynamic.do">音乐圈</a></li>
        <li><a href="huati.jsp">话题</a></li>
        
      </ul>
    </div>
  </header>
	<!-- 排行榜-->
	<div class="responsive" style="margin-top:40px;">
		<!-- start 页面上部左右分栏 -->
		<div class="main-top-wrapper" monkey="H_NI_header">
			<div class="main-top screen-hd clearfix">
				<!-- start 上方左边模块 -->
				<div class="main" style="margin-top:50px;">
					<!-- <div id="adMainTopLeft"></div-->
					
					<div class='ranklist-wrapper clearfix'
						style="margin: 0 auto; width: 920px;">
						<div class="mod mod-song-rank js-mod mod-newsong"
							monkey="H_NI_billboard_new"
							data-js-mod-name="new_index_billboard_new" >
							<div class="hd">
								<h2 class="title">新歌榜</h2>
								<span
									data-args='{"id":[533571441,533656736,533538061,533547491,533328025,533531446,523150864,533605759,315749339,277389316,533598616,533553499,533524488,524442825,533357759,533538088,533445980,300892203,533348890,533371311,533566283,537753198,533327111,533597864,533308233,533674289,316006226,315705707,533664492,537792415,533524351,537792416,300753945,537734211,533245018,533446980,526077428,533445855,533327417,317852858,533575061,536898392,533569821,533598448,533547559,533429358,316090935,269266591,316226360,533402112,315796023,273373731,537754667,306608166,270882096,537792530,537793840,535832779,526155630,532579300,535995473,300868372,535988417,526043808,533295962,533267762,526109683,537791155,533327204,533327294,537768018,533275316,533417003,533358672,537733984,533327584,522869515,523100839,522767660,533252481],"moduleName":"new"}'><a
									href="javascript:;" class="icon-play-all play-all js-play-song"></a></span>
							</div>
							<div class="bd">
								<ul class="song-list">

									<li class=" top1"><div class="index">01</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a  title="我管你" style="text-decoration:none;" href="playMusic.do?id=1&type=1" target='_new'>漂洋过海来看你</a><span
														class="artist"> <span class="author_list"
														title="华晨宇"> <a hidefocus="true"
															 href="playMusic.do?id=1&type=1" target='_new'>周深</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533571441","type":"song","moduleName":"newIcon","albumId":"533571170","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/caa844912cdb0548dd243e276216856f\/533571144\/533571144.jpg@s_0,w_90","songTitle":"\u6211\u7ba1\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top2"><div class="index">02</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a  title="上瘾 (纯钢琴版)" href="playMusic.do?id=2&type=1" target='_new'>光年之外</a><span
														class="artist"> <span class="author_list"
														title="光泽"> <a hidefocus="true"
															href="playMusic.do?id=2&type=1" target='_new'>邓紫棋</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533656736","type":"song","moduleName":"newIcon","albumId":"533650362","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/4325e1c8e8eeb060017c2e08287e0f79\/533645190\/533645190.png@s_0,w_90","songTitle":"\u4e0a\u763e (\u7eaf\u94a2\u7434\u7248)","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top3"><div class="index">03</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a  title="皮皮虾我们走" href="playMusic.do?id=3&type=1" target='_new'>追梦赤子心 </a><span
														class="artist"> <span class="author_list"
														title="MC梦柯"> <a hidefocus="true"
															href="playMusic.do?id=3&type=1" target='_new'>GALA</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533538061","type":"song","moduleName":"newIcon","albumId":"533537065","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/8d69ae5cd83d1204d93420736892a09c\/533537233\/533537233.jpg@s_0,w_90","songTitle":"\u76ae\u76ae\u867e\u6211\u4eec\u8d70","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top4"><div class="index">04</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=3&type=1" target='_new' title="Something Just Like This">海阔天空 </a><span class="artist"> <span class="author_list"
														title="The Chainsmokers,Coldplay"> <a
															hidefocus="true" href="playMusic.do?id=3&type=1" target='_new'>Beyond </a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533547491","type":"song","moduleName":"newIcon","albumId":"533547418","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/ee38362cdfc6dd021521632fedd7aeb7\/533547342\/533547342.jpg@s_0,w_90","songTitle":"Something Just Like This","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top5"><div class="index">05</div>
										<div class="status status-down">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=5&type=1" target='_new' title="刚好遇见你">温柔</a><span
														class="artist"> <span class="author_list"
														title="李玉刚"> <a hidefocus="true"
															href="playMusic.do?id=5&type=1" target='_new'>五月天</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533328025","type":"song","moduleName":"newIcon","albumId":"533281702","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/b01c4babf83fea2e61ebb309545d0ff4\/533281700\/533281700.JPG@s_0,w_90","songTitle":"\u521a\u597d\u9047\u89c1\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top6"><div class="index">06</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=6&type=1" target='_new' title="可疑">刚好遇见你 </a><span
														class="artist"> <span class="author_list"
														title="厉娜"> <a hidefocus="true" href="playMusic.do?id=6&type=1" target='_new'>李玉刚</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533531446","type":"song","moduleName":"newIcon","albumId":"533531420","resourceTypeExt":"1","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/c1575cf222e45e809bcd2cd9edc7ac4b\/533531419\/533531419.jpg@s_0,w_90","songTitle":"\u53ef\u7591","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top7"><div class="index">07</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=7&type=1" target='_new' title="一生所爱">Always Online</a><span
														class="artist"> <span class="author_list"
														title="林更新,姚晨"> <a hidefocus="true"
															href="playMusic.do?id=7&type=1" target='_new'>林俊杰</a><span class="artist-line">/</span>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"523150864","type":"song","moduleName":"newIcon","albumId":"523150825","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/b5cd80ef4daf696bf5f6a5fabf502ab9\/523150824\/523150824.jpg@s_0,w_90","songTitle":"\u4e00\u751f\u6240\u7231","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top8"><div class="index">08</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=19&type=1" target='_new' title="痛快人生">空白格</a><span
														class="artist"> <span class="author_list"
														title="孙露"> <a hidefocus="true"
															href="playMusic.do?id=19&type=1" target='_new'>蔡健雅</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533605759","type":"song","moduleName":"newIcon","albumId":"533605496","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/3133912ef4e9ec852d853746f40d6357\/533605472\/533605472.JPG@s_0,w_90","songTitle":"\u75db\u5feb\u4eba\u751f","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top9"><div class="index">09</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=26&type=1" target='_new' title="美女与野兽">追光者</a><span
														class="artist"> <span class="author_list"
														title="田馥甄,井柏然"> <a hidefocus="true"
															href="playMusic.do?id=26&type=1" target='_new'>岑宁儿 </a><span class="artist-line">/</span>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"315749339","type":"song","moduleName":"newIcon","albumId":"315749329","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/6565856ec3a56290d0e44259d872ab09\/315749330\/315749330.jpg@s_0,w_90","songTitle":"\u7f8e\u5973\u4e0e\u91ce\u517d","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top10"><div class="index">10</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=27&type=1" target='_new' title="一生为你感动">梦想天空分外蓝</a><span
														class="artist"> <span class="author_list"
														title="祁隆"> <a hidefocus="true"
															href="playMusic.do?id=27&type=1" target='_new'>陈奕迅</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"277389316","type":"song","moduleName":"newIcon","albumId":"256028619","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522767550\/f35e3b11b1a8b14afe8c02688e48502c\/522767550.jpg@s_0,w_90","songTitle":"\u4e00\u751f\u4e3a\u4f60\u611f\u52a8","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="mod mod-song-rank js-mod mod-hotsong"
							monkey="H_NI_billboard_hot"
							data-js-mod-name="new_index_billboard_hot">
							<div class="hd">
								<h2 class="title">热歌榜</h2>
								<span
									data-args='{"id":[276867440,266322598,277389316,242078437,265046969,266259728,267473025,523150864,269266591,274912664,524442825,490468,271896483,306608166,270882096,272952711,266942077,257535276,271665582,275350656,277058670,533402112,261813857,241838066,292390695,106125582,306603826,526077428,300771880,281625635,274334244,265047172,87967607,1175705,241606966,285100730,533308233,271832017,100575177,258475780,122674119,277135723,315749339,277580289,1523558,121353608,281625637,7926593,259727051,262574763,268591208,533357759,242194209,533245018,1044213,533445980,278860063,121889450,300895993,277878399,7317702,620023,267894474,533348890,533371311,291241,293431779,261704948,7320512,268249255,533327111,122913116,281625648,288355016,522767660,533252481,316006226,1183139,315705707,526155630],"moduleName":"dayhot"}'><a
									href="javascript:;" class="icon-play-all play-all js-play-song"></a></span>
							</div>
							<div class="bd">
								<ul class="song-list">

									<li class=" top1"><div class="index">01</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=6&type=1" target='_new' title="刚好遇见你">刚好遇见你</a><span
														class="artist"> <span class="author_list"
														title="李玉刚"> <a hidefocus="true"
															href="playMusic.do?id=6&type=1" target='_new'>李玉刚</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"276867440","type":"song","moduleName":"dayhotIcon","albumId":"276867491","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/46e568a3a6e226b660530c00a7c1e9ae\/276867494\/276867494.jpg@s_0,w_90","songTitle":"\u521a\u597d\u9047\u89c1\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top2"><div class="index">02</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=40&type=1" target='_new' title="告白气球">如果可以</a><span
														class="artist"> <span class="author_list"
														title="周杰伦"> <a hidefocus="true"
															href="playMusic.do?id=40&type=1" target='_new'>李健</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"266322598","type":"song","moduleName":"dayhotIcon","albumId":"266322553","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/ed58ab93ec08650f765bc40500ba47b1\/273945524\/273945524.jpg@s_0,w_90","songTitle":"\u544a\u767d\u6c14\u7403","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top3"><div class="index">03</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=37&type=1" target='_new' title="一生为你感动">特别的人 </a><span
														class="artist"> <span class="author_list"
														title="祁隆"> <a hidefocus="true"
															href="playMusic.do?id=37&type=1" target='_new'>方大同 </a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"277389316","type":"song","moduleName":"dayhotIcon","albumId":"256028619","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522767550\/f35e3b11b1a8b14afe8c02688e48502c\/522767550.jpg@s_0,w_90","songTitle":"\u4e00\u751f\u4e3a\u4f60\u611f\u52a8","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top4"><div class="index">04</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=86&type=1" target='_new' title="演员">绅士</a><span
														class="artist"> <span class="author_list"
														title="薛之谦"> <a hidefocus="true"
															href="playMusic.do?id=86&type=1" target='_new'>薛之谦</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"242078437","type":"song","moduleName":"dayhotIcon","albumId":"241838068","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/49e6161afb13e3eda9d1cb4e304561a2\/267709272\/267709272.jpg@s_0,w_90","songTitle":"\u6f14\u5458","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top5"><div class="index">05</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=87&type=1" target='_new' title="寂寞的人伤心的歌">成都 </a><span
														class="artist"> <span class="author_list"
														title="龙梅子,杨海彪"> <a hidefocus="true"
															href="playMusic.do?id=87&type=1" target='_new'>赵雷</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/88029082">赵雷</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"265046969","type":"song","moduleName":"dayhotIcon","albumId":"265047175","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/265046939\/265046939.jpg@s_0,w_90","songTitle":"\u5bc2\u5bde\u7684\u4eba\u4f24\u5fc3\u7684\u6b4c","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top6"><div class="index">06</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=83&type=1" target='_new' title="刚刚好">刚刚好</a><span
														class="artist"> <span class="author_list"
														title="薛之谦"> <a hidefocus="true"
															href="playMusic.do?id=83&type=1" target='_new'>薛之谦</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"266259728","type":"song","moduleName":"dayhotIcon","albumId":"241838068","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/49e6161afb13e3eda9d1cb4e304561a2\/267709272\/267709272.jpg@s_0,w_90","songTitle":"\u521a\u521a\u597d","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top7"><div class="index">07</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=16&type=1" target='_new' title="夜空中最亮的星">美人鱼</a><span
														class="artist"> <span class="author_list"
														title="G.E.M.邓紫棋"> <a hidefocus="true"
															href="playMusic.do?id=16&type=1" target='_new'>林俊杰 </a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"267473025","type":"song","moduleName":"dayhotIcon","albumId":"267472929","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/33f746759e8c0c258d6233456591800f\/267472930\/267472930.jpg@s_0,w_90","songTitle":"\u591c\u7a7a\u4e2d\u6700\u4eae\u7684\u661f","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top8"><div class="index">08</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=33&type=1" target='_new' title="一生所爱">南山南</a><span
														class="artist"> <span class="author_list"
														title="林更新,姚晨"> <a hidefocus="true"
															href="playMusic.do?id=33&type=1" target='_new' >马頔</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/5372">姚晨</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"523150864","type":"song","moduleName":"dayhotIcon","albumId":"523150825","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/b5cd80ef4daf696bf5f6a5fabf502ab9\/523150824\/523150824.jpg@s_0,w_90","songTitle":"\u4e00\u751f\u6240\u7231","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top9"><div class="index">09</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=36&type=1" target='_new' title="就是让你美">巴黎假期</a><span
														class="artist"> <span class="author_list"
														title="龙梅子"> <a hidefocus="true"
															href="playMusic.do?id=36&type=1" target='_new'>金志文</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"269266591","type":"song","moduleName":"dayhotIcon","albumId":"259100294","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522731230\/738fec6524aa0e55d620b8affd68b732\/522731230.jpg@s_0,w_90","songTitle":"\u5c31\u662f\u8ba9\u4f60\u7f8e","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top10"><div class="index">10</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=41&type=1" target='_new' title="我要你">老街 </a><span
														class="artist"> <span class="author_list"
														title="任素汐"> <a hidefocus="true"
															href="playMusic.do?id=41&type=1" target='_new'> 李荣浩</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"274912664","type":"song","moduleName":"dayhotIcon","albumId":"274912674","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/4ec237c5b66c8578bf2da9e083c98a32\/274912676\/274912676.jpg@s_0,w_90","songTitle":"\u6211\u8981\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
								</ul>
							</div>
						</div>



						<div class="mod mod-song-rank js-mod mod-artistsong"
							monkey="H_NI_billboard_artist"
							data-js-mod-name="new_index_billboard_artist">
							<div class="hd">
								<h2 class="title">歌手Top20榜</h2>
								<a href="/top/artist" class="icon-check-all"></a>
							</div>
							<div class="bd">
								<ul class="song-list song-list-left">
									<li class=" top1"><div class="index">01</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="薛之谦" href="playMusic.do?id=79&type=1" target='_new'>薛之谦</a>
										</div></li>
									<li class=" top2"><div class="index">02</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="邓丽君" href="playMusic.do?id=68&type=1" target='_new'>邓紫棋</a>
										</div></li>
									<li class=" top3"><div class="index">03</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="周杰伦" href="playMusic.do?id=64&type=1" target='_new'>五月天</a>
										</div></li>
									<li class=" top4"><div class="index">04</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="祁隆" href="playMusic.do?id=56&type=1" target='_new'>徐佳莹</a>
										</div></li>
									<li class=" top5"><div class="index">05</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="王菲" href="playMusic.do?id=76&type=1" target='_new'>王菲</a>
										</div></li>
									<li class=" top6"><div class="index">06</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="张学友" href="playMusic.do?id=72&type=1" target='_new'>陈学冬</a>
										</div></li>
									<li class=" top7"><div class="index">07</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="龙梅子"
												href="playMusic.do?id=62&type=1" target='_new'>杨宗纬</a>
										</div></li>
									<li class=" top8"><div class="index">08</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="李玉刚" href="playMusic.do?id=6&type=1" target='_new'>李玉刚</a>
										</div></li>
									<li class=" top9"><div class="index">09</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="许茹芸" href="playMusic.do?id=26&type=1" target='_new'>岑宁儿</a>
										</div></li>
									<li class=" top10"><div class="index">10</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="齐秦" href="playMusic.do?id=29&type=1" target='_new'>陈奕迅</a>
										</div></li>
								</ul>
								<ul class="song-list song-list-right">
									<li class=" top11"><div class="index">11</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="G.E.M.邓紫棋" href="playMusic.do?id=2&type=1" target='_new'>G.E.M.邓紫棋</a>
										</div></li>
									<li class=" top12"><div class="index">12</div>
										<div class="status status-up">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="Beyond" href="playMusic.do?id=4&type=1" target='_new'>Beyond</a>
										</div></li>
									<li class=" top13"><div class="index">13</div>
										<div class="status status-down">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="陈奕迅" href="playMusic.do?id=11&type=1" target='_new'>林俊杰</a>
										</div></li>
									<li class=" top14"><div class="index">14</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="Secret Garden" href="/artist/177878/?pst=shouyeTop">Secret
												Garden</a>
										</div></li>
									<li class=" top15"><div class="index">15</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="DJ小可" href="playMusic.do?id=1&type=1" target='_new'>周深</a>
										</div></li>
									<li class=" top16"><div class="index">16</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="张信哲" href="playMusic.do?id=34&type=1" target='_new'>范玮琪</a>
										</div></li>
									<li class=" top17"><div class="index">17</div>
										<div class="status status-up">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="乌兰图雅" href="playMusic.do?id=47&type=1" target='_new'>鹿晗</a>
										</div></li>
									<li class=" top18"><div class="index">18</div>
										<div class="status status-down">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="宋祖英" href="playMusic.do?id=3&type=1" target='_new'>GALA</a>
										</div></li>
									<li class=" top19"><div class="index">19</div>
										<div class="status status-steady">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="林俊杰" href="playMusic.do?id=33&type=1" target='_new'>马頔</a>
										</div></li>
									<li class=" top20"><div class="index">20</div>
										<div class="status status-up">
											<i class="icon-status"></i> <strong class="num"></strong>
										</div>
										<div class="song artist-rank">
											<a title="刀郎" href="playMusic.do?id=104&type=1" target='_new'>张靓颖</a>
										</div></li>
								</ul>
							</div>
						</div>
						<div class="adMainMiddle-box">
							<div id="adMainMiddle">
								<div monkey="hao123-index-top-ad" class="ad-banner">
									<!-- 广告位整体迁移2016.1.25 music.hao123_PC_网页_首页_通栏_960*90-->
								</div>
							</div>
						</div>
						<div class="mod mod-song-rank js-mod mod-oumei"
							monkey="H_NI_billboard_oumei"
							data-js-mod-name="new_index_billboard_oumei">
							<div class="hd">
								<h2 class="title">评论量榜</h2>
								<span
									data-args='{"id":[261813857,300771880,7926593,262574763,277878399,122913116,246946436,7926592,533446980,257613380,7926599,13844864,522932931,2158779,522896419,8572454,541244,40738462,92279724,277896926,256393709,135791969,120971131,122823665,123985644,1038192,9919296,271589612,8199438,273529921,120102174,8517151,1038302,277008589,98834442,14907195,13685391,268927500,277361366,13005396,120872314,10315816,440614,8061609,14919656,13676881,2164160,277350712,1973022,10284008,238564822,300941785,261812632,121291042,266179828,14827943,265306442,1273445,267905936,1037883,2191061,270898099,1328527,7384877,285168207,310871765,7926591,274422571,39628017,85736327,266069829,7532440,123107718,7567988,8199431,7386676,14707798,266102924,533366394,123969281],"moduleName":"oumei"}'><a
									href="javascript:;" class="icon-play-all play-all js-play-song"></a></span>
							</div>
							<div class="bd">
								<ul class="song-list">
                                    <c:forEach items="${kingList}" var="king" varStatus="index">
									<li class=" top1"><div class="index">${index.index+1}</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=98&type=1" target='_new' title="See You Again">${king.title}
														</a><span class="artist"> <span
														class="author_list" title="Wiz Khalifa,Charlie Puth">
															<a hidefocus="true" href="playMusic.do?id=98&type=1" target='_new'>${king.name}
																</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"261813857","type":"song","moduleName":"oumeiIcon","albumId":"261812620","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/e18b5d0931908d181b1c66bcdd794d6d\/261812621\/261812621.jpg@s_0,w_90","songTitle":"See You Again","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
										</c:forEach>
								</ul>
							</div>
						</div>





						<div class="mod mod-song-rank js-mod mod-oldsong"
							monkey="H_NI_billboard_old"
							data-js-mod-name="new_index_billboard_old">
							<div class="hd">
								<h2 class="title">经典老歌榜</h2>
								<span
									data-args='{"id":["490468","1175705","1523558","1044213","7317702","620023","7320512","291241","7317902","1967722","826361","276766","292712","2096466","2735413","7316911","13125209","937197","7336700","236348"],"moduleName":"oldsong"}'><a
									href="javascript:;" class="icon-play-all play-all js-play-song"></a></span>
							</div>
							<div class="bd">
								<ul class="song-list">

									<li class=" top1"><div class="index">01</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=68&type=1" target='_new' title="独角戏">喜欢你</a><span
														class="artist"> <span class="author_list"
														title="许茹芸"> <a hidefocus="true"
															href="playMusic.do?id=68&type=1" target='_new'>邓紫棋</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"490468","type":"song","moduleName":"oldsongIcon","albumId":"68316","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/124573989\/124573989.jpg@s_0,w_90","songTitle":"\u72ec\u89d2\u620f","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top2"><div class="index">02</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=71&type=1" target='_new' title="往事随风">坚持到底</a><span
														class="artist"> <span class="author_list"
														title="齐秦"> <a hidefocus="true" href="playMusic.do?id=71&type=1" target='_new'>阿杜</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"1175705","type":"song","moduleName":"oldsongIcon","albumId":"189288","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/music\/B7D9BEE964E7FDA87A9F7901B8FF3D6A\/252275563\/252275563.jpg@s_0,w_90","songTitle":"\u5f80\u4e8b\u968f\u98ce","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top3"><div class="index">03</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=73&type=1" target='_new' title="不再犹豫">有情世间</a><span
														class="artist"> <span class="author_list"
														title="Beyond"> <a hidefocus="true"
															href="playMusic.do?id=73&type=1" target='_new'>邓超</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"1523558","type":"song","moduleName":"oldsongIcon","albumId":"197988","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/72b3a5959eaf1d9f8875ae7d33be4c01\/261986130\/261986130.jpg@s_0,w_90","songTitle":"\u4e0d\u518d\u72b9\u8c6b","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top4"><div class="index">04</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=74&type=1" target='_new' title="但愿人长久">悟空</a><span
														class="artist"> <span class="author_list"
														title="王菲"> <a hidefocus="true"
															href="playMusic.do?id=74&type=1" target='_new'>戴荃</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"1044213","type":"song","moduleName":"oldsongIcon","albumId":"7315358","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/36917125\/36917125.jpg@s_0,w_90","songTitle":"\u4f46\u613f\u4eba\u957f\u4e45","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top5"><div class="index">05</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=75&type=1" target='_new' title="千千阙歌">同桌的你</a><span
														class="artist"> <span class="author_list"
														title="陈慧娴"> <a hidefocus="true"
															href="playMusic.do?id=75&type=1" target='_new'>胡夏</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"7317702","type":"song","moduleName":"oldsongIcon","albumId":"7311463","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/89836903\/89836903.jpg@s_0,w_90","songTitle":"\u5343\u5343\u9619\u6b4c","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top6"><div class="index">06</div>
										<div class="status status-down">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=78&type=1" target='_new' title="一路上有你">致青春</a><span
														class="artist"> <span class="author_list"
														title="张学友"> <a hidefocus="true"
															href="playMusic.do?id=78&type=1" target='_new'>王菲</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"620023","type":"song","moduleName":"oldsongIcon","albumId":"7325421","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/36924375\/36924375.jpg@s_0,w_90","songTitle":"\u4e00\u8def\u4e0a\u6709\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top7"><div class="index">07</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=86&type=1" target='_new' title="偏偏喜欢你">绅士</a><span
														class="artist"> <span class="author_list"
														title="陈百强"> <a hidefocus="true"
															href="playMusic.do?id=86&type=1" target='_new'>薛之谦</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"7320512","type":"song","moduleName":"oldsongIcon","albumId":"7311583","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/89840093\/89840093.jpg@s_0,w_90","songTitle":"\u504f\u504f\u559c\u6b22\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top8"><div class="index">08</div>
										<div class="status status-down">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=87&type=1" target='_new' title="甜蜜蜜">成都</a><span
														class="artist"> <span class="author_list"
														title="邓丽君"> <a hidefocus="true"
															href="playMusic.do?id=87&type=1" target='_new'>赵雷</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"291241","type":"song","moduleName":"oldsongIcon","albumId":"74021","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/88410419\/88410419.jpg@s_0,w_90","songTitle":"\u751c\u871c\u871c","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top9"><div class="index">09</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=88&type=1" target='_new' title="相思风雨中">岁月缝花</a><span
														class="artist"> <span class="author_list"
														title="张学友,汤宝如"> <a hidefocus="true"
															href="playMusic.do?id=88&type=1" target='_new'>陈学冬</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/7971">汤..</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"7317902","type":"song","moduleName":"oldsongIcon","albumId":"7311811","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/89844647\/89844647.jpg@s_0,w_90","songTitle":"\u76f8\u601d\u98ce\u96e8\u4e2d","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top10"><div class="index">10</div>
										<div class="status status-down">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=89&type=1" target='_new' title="好人一生平安">童话镇</a><span
														class="artist"> <span class="author_list"
														title="李娜"> <a hidefocus="true" href="playMusic.do?id=89&type=1" target='_new'>陈一发儿</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"1967722","type":"song","moduleName":"oldsongIcon","albumId":"1966039","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/7d55786338c682c111e0cc4876a40613\/261985169\/261985169.jpg@s_0,w_90","songTitle":"\u597d\u4eba\u4e00\u751f\u5e73\u5b89","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
								</ul>
							</div>
						</div>

						<div class="mod mod-song-rank js-mod mod-netsong"
							monkey="H_NI_billboard_net"
							data-js-mod-name="new_index_billboard_net">
							<div class="hd">
								<h2 class="title">网络歌曲榜</h2>
								<span
									data-args='{"id":["277389316","269266591","270882096","271896483","265046969","533308233","272952711","292390695","271665582","285100730","274334244","277580289","537792416","288355016","265047172","274851377","258475780","259727051","277191213","261704948"],"moduleName":"netsong"}'><a
									href="javascript:;" class="icon-play-all play-all js-play-song"></a></span>
							</div>
							<div class="bd">
								<ul class="song-list">

									<li class=" top1"><div class="index">01</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=90&type=1" target='_new' title="一生为你感动">温柔乡</a><span
														class="artist"> <span class="author_list"
														title="祁隆"> <a hidefocus="true"
															href="playMusic.do?id=90&type=1" target='_new'>陈雅森</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"277389316","type":"song","moduleName":"netsongIcon","albumId":"256028619","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522767550\/f35e3b11b1a8b14afe8c02688e48502c\/522767550.jpg@s_0,w_90","songTitle":"\u4e00\u751f\u4e3a\u4f60\u611f\u52a8","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top2"><div class="index">02</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=91&type=1" target='_new' title="就是让你美">七月上</a><span
														class="artist"> <span class="author_list"
														title="龙梅子"> <a hidefocus="true"
															href="playMusic.do?id=91&type=1" target='_new'>Jam</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"269266591","type":"song","moduleName":"netsongIcon","albumId":"259100294","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522731230\/738fec6524aa0e55d620b8affd68b732\/522731230.jpg@s_0,w_90","songTitle":"\u5c31\u662f\u8ba9\u4f60\u7f8e","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top3"><div class="index">03</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=92&type=1" target='_new' title="大叔不卖我香蕉">最美情侣</a><span
														class="artist"> <span class="author_list"
														title="龙梅子,老猫"> <a hidefocus="true"
															href="playMusic.do?id=92&type=1" target='_new'>白小白</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/1799">老猫</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"270882096","type":"song","moduleName":"netsongIcon","albumId":"259100294","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/522731230\/738fec6524aa0e55d620b8affd68b732\/522731230.jpg@s_0,w_90","songTitle":"\u5927\u53d4\u4e0d\u5356\u6211\u9999\u8549","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top4"><div class="index">04</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=94&type=1" target='_new' title="今生遇见你">痴心绝对</a><span
														class="artist"> <span class="author_list"
														title="祁隆,任妙音"> <a hidefocus="true"
															href="playMusic.do?id=94&type=1" target='_new'>李圣杰</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/209045495">任妙音</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"271896483","type":"song","moduleName":"netsongIcon","albumId":"271896489","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/7605eabd0fc003ae3f8670ab2ea14bd6\/271896491\/271896491.jpg@s_0,w_90","songTitle":"\u4eca\u751f\u9047\u89c1\u4f60","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top5"><div class="index">05</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=95&type=1" target='_new' title="寂寞的人伤心的歌">年少有你</a><span
														class="artist"> <span class="author_list"
														title="龙梅子,杨海彪"> <a hidefocus="true"
															href="playMusic.do?id=95&type=1" target='_new'>李易峰</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/88029082">杨..</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"265046969","type":"song","moduleName":"netsongIcon","albumId":"265047175","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/265046939\/265046939.jpg@s_0,w_90","songTitle":"\u5bc2\u5bde\u7684\u4eba\u4f24\u5fc3\u7684\u6b4c","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top6"><div class="index">06</div>
										<div class="status status-up">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=96&type=1" target='_new' title="逆流成河">拯救</a><span
														class="artist"> <span class="author_list"
														title="宇桐非"> <a hidefocus="true"
															href="playMusic.do?id=96&type=1" target='_new'>孙楠</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"533308233","type":"song","moduleName":"netsongIcon","albumId":"533306219","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/b73f32106852c7d9f80d29b93e87218c\/533306212\/533306212.jpeg@s_0,w_90","songTitle":"\u9006\u6d41\u6210\u6cb3","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top7"><div class="index">07</div>
										<div class="status status-down">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=97&type=1" target='_new' title="下完这场雨">假装</a><span
														class="artist"> <span class="author_list"
														title="后弦"> <a hidefocus="true" href="playMusic.do?id=98&type=1" target='_new'>陈雪凝</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"272952711","type":"song","moduleName":"netsongIcon","albumId":"272952776","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/c83372f97695bab0a4e21393099b22b3\/272952777\/272952777.jpg@s_0,w_90","songTitle":"\u4e0b\u5b8c\u8fd9\u573a\u96e8","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top8"><div class="index">08</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=100&type=1" target='_new' title="乌兰姑娘">盗心贼</a><span
														class="artist"> <span class="author_list"
														title="乌兰图雅"> <a hidefocus="true"
															href="playMusic.do?id=100&type=1" target='_new'>黑龙</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"292390695","type":"song","moduleName":"netsongIcon","albumId":"292402893","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/53a4b0a6b7b11f5e31d288e2ece1de2d\/292402904\/292402904.jpg@s_0,w_90","songTitle":"\u4e4c\u5170\u59d1\u5a18","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top9"><div class="index">09</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=102&type=1" target='_new' title="恋红尘">情缘思忆</a><span
														class="artist"> <span class="author_list"
														title="祁隆,彭丽嘉"> <a hidefocus="true"
															href="playMusic.do?id=102&type=1" target='_new'>DJ初雨</a><span class="artist-line">/</span><a
															hidefocus="true" href="/artist/92458641">彭丽嘉</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"271665582","type":"song","moduleName":"netsongIcon","albumId":"271665637","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/8d272caaf5cdb235efbf58142f10a653\/271665638\/271665638.jpg@s_0,w_90","songTitle":"\u604b\u7ea2\u5c18","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
									<li class=" top10"><div class="index">10</div>
										<div class="status status-steady">
											<i class="icon-status"></i>
										</div>
										<div class="song-info">
											<div class="info">
												<div class="song">
													<a href="playMusic.do?id=101&type=1" target='_new' title="远方的远方还是远方"> 岁月神偷</a><span
														class="artist"> <span class="author_list"
														title="凤凰传奇"> <a hidefocus="true"
															href="playMusic.do?id=101&type=1" target='_new'>金玟岐</a>
													</span>
													</span>
												</div>
											</div>
										</div>
										<div class="opera-icon"
											data-args='{"id":"285100730","type":"song","moduleName":"netsongIcon","albumId":"285108836","resourceTypeExt":"0","siPresaleFlag":null,"mediaType":1,"songPic":"http:\/\/musicdata.baidu.com\/data2\/pic\/681dfa084b5c35983e2c386ae490c8d4\/285108838\/285108838.jpg@s_0,w_90","songTitle":"\u8fdc\u65b9\u7684\u8fdc\u65b9\u8fd8\u662f\u8fdc\u65b9","songPublishTime":null}'>
											<a href="javascript:;"
												class="opera-icon-play icon icon-music-play js-play-song"></a><a
												href="javascript:;"
												class="opera-icon-add icon icon-music-collect js-add"></a>
										</div></li>
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
<!-- footer -->
          <footer class="footer" style="height:170px;width:100%;">
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