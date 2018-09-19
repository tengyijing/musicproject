<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>音乐圈</title>

  <link rel="shortcut icon" href="../../source/images/logo-b.png" />
  <link rel="stylesheet" href="../../source/css/reset.css">
  <link rel="stylesheet" href="../../source/css/index.css">
  <script src="../../source/js/jquery.js"></script>
  <script src="../../source/js/script.js"></script>
  <script src="/myjs/index.js"></script>
  <script src="source/mysong/js/main2.js"></script>
  <script src="/myjs/searcher.js"></script>
  <!-- 中部 -->
  <link href="../../source/css/common.css?v7.2" type="text/css" rel="stylesheet" />
  <link href="../../source/css/public.css?v1" type="text/css" rel="stylesheet" />
  <!-- 音乐人 -->
<link rel="stylesheet" type="text/css" href="../../source/singer/css/style2.css" />
<script type="text/javascript" src="../../source/singer/js/modernizr.js"></script>

<!-- 分页样式 -->
<link rel="stylesheet" type="text/css"
	href="../../source/SearchMusic/fenye/css/zxf_page.css" />

<!--提示框-->
<link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
	rel="stylesheet" />
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
<!-- 提示框 -->
<link href="../../source/SearchMusic/css/qikoo.css" type="text/css"
	rel="stylesheet" />
<script src="../../myjs/qikoo.js"></script>
<script type="text/javascript">
var menuid=${menuid}
</script>
</head>
<body onload="getName('${username}');userLogin('${username}');">

  <header class="header">
    <div class="header-container"  style="width:1200px;">
            <div class="header-top">
        <a href="../../index.jsp" class="logo"></a>
        <nav class="header-nav">
          <ul id="topmusicCircle">
            
           
          </ul>
        </nav>
           <div class="header-search" style="margin-left:-20px;">
        <form action="searchMusic.do" method="post" id="searchform" onsubmit="return searchNull()">
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
        
         <div id="nameicon" class="center_header" style="margin-left:60px;margin-right:10px;float:left;display:none">
        <a href="/personal"><img src="${imgstr}" id="img2"/></a>
         </div>
         <div id="name" style="display:none;padding-top:35px;"><a href="/personal" style="cursor:pointer" ><i  onmouseover = "xianshi()"  onmouseout = "xiaoshi2()">${username}</i></a></div>
         <div id="xianshi">
         <p style="margin-left:5px;margin-top:3px;"><a href="/personal"><img src="/images/person.png"></a></p>
         <p style="margin-left:4px;margin-top:5px;"><a href="User/exit"><img src="/images/exit.png"></a></p>
         </div>
        <div class="header-login"style="margin-right:-10px;">
          <a href="/login" class="open-green" id="login">登录</a>
          <a href="/register" class="open-vip" id="reg">注册</a>
        </div>
      </div>
      <ul class="header-subNav" style="margin-top:20px;" id="topmusicCircleChild">
       
      </ul>
    </div>
  </header>
  
  <!-- 中部 -->
  <div class="pb-container"> 
   <div class="pb-container-main pb-after-clear"> 
   
    <div class="pb-main pb-mt20"> 
    
    <div class="header-login3">
          <a  href="getDynamic.do" class="open-green" id="quanbu" onclick="red2()">全部动态</a>
          <a  href="getPartDynamic.do" class="open-vip" id="haoyou" onclick="red()">好友动态</a>
    </div>
    
     <div class="commmain" style="margin-top:30px;"> 
        <a href="playMusic.do?id=${dynamic.musicId}&type=1" target='_new' class="mvList2" style="display: block;"> <img width="220" height="150" src="http://localhost:8080/images/${dynamic.musicId}.jpg" 
					 alt="" /> <strong>${dynamic.musicName}</strong>
				    <strong><font color="#FA3B4A">${dynamic.dynamicer}</font></strong>
				     <span> <font>${dynamic.musicName}&#8211; ${dynamic.dynamicer}</font>
				      <font><i></i></font> <font><i></i>1042425
				      <em>2pic4-12-31</em></font>
					</span>

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
					href="/register" class="open-vip" id="reg">注册</a>
			</div>
		</div>
		<ul class="header-subNav" style="margin-top: 20px;"
			id="topmusicCircleChild">

		</ul>
	</div>
	</header>

	<!-- 中部 -->
	<div class="pb-container">
		<div class="pb-container-main pb-after-clear">

			<div class="pb-main pb-mt20">

				<div class="header-login3">
					<a href="getDynamic.do" class="open-green" id="quanbu"
						onclick="red2()">全部动态</a> <a href="getPartDynamic.do"
						class="open-vip" id="haoyou" onclick="red()">好友动态</a>
				</div>

				<div class="commmain" style="margin-top: 30px;">
					<c:forEach items="${dynamicList}" var="dynamic" varStatus="index">
						<div class="one-atl" style="margin-top: 20px;">
							<span class="mvList2" style="display: block;"> <c:choose>
									<c:when test="${dynamic.id== null or dynamic.id=='0'}">
										<a class="mvList2" style="display: block;"> <img
											width="220" height="150"
											src="source/playmusic/images/${dynamic.id}.jpg" alt="" /></a>
									</c:when>
									<c:otherwise>
										<a href="playMusic.do?id=${dynamic.musicId}&type=1"
											target='_new' class="mvList2" style="display: block;"> <img
											width="220" height="150"
											src="http://localhost:8080/images/${dynamic.musicId}.jpg"
											alt="" /> <strong>${dynamic.musicName}</strong> <strong><font
												color="#FA3B4A">${dynamic.dynamicer}</font></strong> <span> <font>${dynamic.musicName}&#8211;
													${dynamic.dynamicer}</font> <font><i></i></font> <font><i></i>1042425
													<em>2pic4-12-31</em></font>
										</span>
										</a>
									</c:otherwise>
								</c:choose>

							</span>
							<div class="con f-r" style="margin-right: 50px;">
								<div id="nameicon" class="center_header4"
									style="margin-top: -10px; float: left;">
									<c:choose>
										<c:when test="${dynamic.imgstr== null or dynamic.imgstr==''}">
											<a href="getFriendSong.do?user=${dynamic.dynamicer}"><img
												src="../../source/images/user.png" id="img1" /></a>
										</c:when>
										<c:otherwise>
											<a href="getFriendSong.do?user=${dynamic.dynamicer}"><img
												src="${dynamic.imgstr}" id="img2" /></a>
										</c:otherwise>
									</c:choose>
								</div>
								<div
									style="margin-left: 50px; margin-top: 13px; font-size: 17px;">
									<a href="getFriendSong.do?user=${dynamic.dynamicer}"
										style="display: inline">${dynamic.dynamicer }</a>
								</div>
								<p class="f-l">${dynamic.dynamicContent }</p>
								<p>
									<a style="display: inline">详情</a>
								</p>
								<div class="date-dz">
									<span class="date-dz-left pull-left comment-time">${dynamic.dynamicDate }</span>
									<div class="date-dz-right pull-right comment-pl-block">
										<c:choose>
											<c:when test="${dynamic.dynamicer==username}">
												<a href="javascript:;" class="removeBlock"
													del="${dynamic.dynamicId}">删除</a>
											</c:when>
										</c:choose>

										<a class="date-dz-pl pl-hf hf-con-block pull-left" hp="0"
											onclick="hideTalk(this)">回复</a> <span
											class="pull-left date-dz-line">|</span> <a
											href="javascript:;" class="date-dz-z pull-left"><i
											class="date-dz-z-click-red"></i>赞 (<i class="z-num"
											good="${dynamic.dynamicId}">${dynamic.good}</i>)</a>
										<div class="hf-list-con"></div>
									</div>
								</div>

								<div class="commentAll" style="display: none;">
									<!--评论区域 begin-->
									<div class="reviewArea clearfix">
										<textarea class="content comment-input" placeholder="说点什么吧"
											onkeyup="keyUP(this)" hp2="${dynamic.dynamicId}"></textarea>
										<a class="plBtn" style="color: #fff">评论</a>
									</div>
									<!--评论区域 end-->
									<!--回复区域 begin-->
									<div class="comment-show">
										<c:forEach items="${dynamic.myReview}" var="myReview"
											varStatus="index2">
											<div class="comment-show-con clearfix">
												<div class="comment-show-con-img pull-left">
													<div id="nameicon" class="center_header4"
														style="margin-top: -10px; float: left;">
														<c:choose>
															<c:when
																test="${myReview.imgstr== null or myReview.imgstr==''}">
																<a href=""><img src="../../source/images/user.png"
																	id="img1" /></a>
															</c:when>
															<c:otherwise>
																<a href=""><img src="${myReview.imgstr}" id="img2" /></a>
															</c:otherwise>
														</c:choose>
													</div>
												</div>
												<div class="comment-show-con-list pull-left clearfix">
													<div class="pl-text clearfix">
														<a href="getFriendSong.do?user=${myReview.reviewer}"
															class="comment-size-name" p3="${myReview.reviewId}"
															p4="${dynamic.dynamicId}">${myReview.reviewer}</a> <span
															class="my-pl-con">&nbsp;${myReview.reviewContent}</span>
													</div>
													<div class="date-dz">
														<span class="date-dz-left pull-left comment-time">${myReview.reviewDate}</span>
														<div class="date-dz-right pull-right comment-pl-block">
															<a href="javascript:;"
																class="date-dz-pl pl-hf hf-con-block pull-left"
																style="margin-right: 40px;">回复</a>
														</div>
													</div>
													<c:forEach items="${myReview.myRevert}" var="myRevert"
														varStatus="index3">
														<div class="all-pl-con" style="background-color: #EAEAEC">
															<div class="pl-text hfpl-text clearfix">
																<a href="#" class="comment-size-name">${myRevert.reverter}</a>
																<span class="my-pl-con">回复<span
																	style="color: red">@<a
																		style="color: #fa3b4a; display: inline; font-size: 13px;"
																		href="getFriendSong.do?user=${myRevert.toReverter}">${myRevert.toReverter}</a></span>&nbsp;${myRevert.revertContent}
																</span>
															</div>
															<div class="date-dz">
																<span class="date-dz-left pull-left comment-time">${myRevert.revertDate}</span>
																<div class="date-dz-right pull-right comment-pl-block">
																	<a href="javascript:;"
																		class="date-dz-pl pl-hf hf-con-block pull-left"
																		style="margin-right: 32px;">回复</a>
																</div>
															</div>
														</div>
													</c:forEach>
													<div class="hf-list-con"></div>
												</div>
											</div>
										</c:forEach>
									</div>
									<!--回复区域 end-->
								</div>
							</div>
						</div>

					</c:forEach>
					<div class="zxf_pagediv" style="margin-top: 40px;"></div>
				</div>

				<div class="commside">
					<!--右侧我要投稿公共部分-->
					<div class="pb-iblock pb-fr pb-after-clear pb-main-side">
						<a><img class="pb-block"
							src="../../source/images/musicCircle.png" style="width: 295px" /></a>

						<h6 class="pb-mt15 pb-clr1 pb-size-big">当前擂主</h6>
						<div class="pb-line2 pb-mt5"></div>

						<c:forEach items="${registList}" var="registList"
							varStatus="index4">
							<div id="nameicon" class="center_header5"
								style="margin-bottom: 10px; float: left;">
								<c:choose>
									<c:when
										test="${registList.imgstr== null or registList.imgstr==''}">
										<a href="getFriendSong.do?user=${registList.username}"><img
											src="../../source/images/user.png" id="img1" /></a>
									</c:when>
									<c:otherwise>
										<a href="getFriendSong.do?user=${registList.username}"><img
											src="${registList.imgstr}" id="img2" /></a>
									</c:otherwise>
								</c:choose>
							</div>
							<a href="getFriendSong.do?user=${registList.username}"
								class="tle pb-mt5"
								style="margin-right: 20px; padding-top: 20px; font-size: 18px;">&nbsp;&nbsp;&nbsp;&nbsp;${registList.username}</a>


							<div class="pb-line2 pb-mt5"></div>
							<a href="getFriendSong.do?user=${registList.username}"
								class="but pb-clr1 pb-size-normal pb-mt15"
								style="background-color: #E3494B;">添加关注</a>
						</c:forEach>
					</div>
					<!--右侧我要投稿公共部分-->
					<div class="pb-main-side pb-iblock pb-after-clear pb-fr pb-mt40">
						<h6 class="pb-clr1 pb-size-big">精彩评论</h6>
						<div class="pb-line2 pb-mt5"></div>
						<ul class="pb-mt10 previous-term pb-size-normal">
							<li><a href="">有一种毕业，叫先走一步</a>
								<div class="pb-line2"></div></li>
							<li><a href="">用今生的修行 为你们的来生祈福</a>
								<div class="pb-line2"></div></li>
							<li><a href="">十年前你说生如夏花般绚烂，十年后你说平凡才是唯一的答案</a>
								<div class="pb-line2"></div></li>
							<li><a href="">每个人的裂痕，最后都会变成故事的花纹</a>
								<div class="pb-line2"></div></li>
							<li><a href="">我就在这里旅行，给你讲沿途的风景</a>
								<div class="pb-line2"></div></li>
							<li><a href="">理想就是离乡</a>
								<div class="pb-line2"></div></li>
							<li><a href="">在最没有能力的年纪，碰见了最想照顾一生的人</a>
								<div class="pb-line2"></div></li>
						</ul>
					</div>
					<div style="clear: both;"></div>
					<div class="sidewrap  pb-mt40">
						<h6 class="pb-clr1 pb-size-big">倾听世界</h6>
						<div class="pb-line2 pb-mt5"></div>
						<div style="height: 480px; overflow: hidden;" class="con pr">
							<div style="left: 150px; height: 150px; top: 15px;"
								class="single">
								<a title="清纯唯美写真合集" href=""><img alt="唯美写真"
									src="../../source/images/qing_10001_7b053ee001_310.jpg"
									style="width: 145px;" /></a>
							</div>
							<div style="left: 0px; height: 150px; top: 15px;" class="single">
								<a title="也许我就是一块老墨" href=""><img alt="也许我就是一块老墨"
									src="../../source/images/qing_10001_2278c48f96_310.jpg"
									style="width: 145px;" /></a>
							</div>
							<div style="left: 150px; height: 150px; top: 170px;"
								class="single">
								<a title="证件照" href=""><img alt=""
									src="../../source/images/qing_10001_3c506bc67d.jpg"
									style="width: 145px;" /></a>
							</div>
							<div style="left: 0px; height: 150px; top: 170px;" class="single">
								<a title="" href=""><img alt=""
									src="../../source/images/essay_10001_0ba5781188.jpg"
									style="width: 145px;" /></a>
							</div>
							<div style="left: 150px; height: 150px; top: 325px;"
								class="single">
								<a title="爱情就是一百多年的孤寂" href=""><img alt="爱情就是一百多年的孤寂"
									src="../../source/images/qing_10001_5502d62ca8_310.jpg"
									style="width: 145px;" /></a>
							</div>
							<div style="left: 0px; height: 150px; top: 325px;" class="single">
								<a title="深林幽静" href=""><img alt="深林幽静"
									src="../../source/images/qing_9999_578544d87f_310.jpg"
									style="width: 145px;" /></a>
							</div>
						</div>
					</div>
				</div>



				<div style="clear: both;"></div>
			</div>
			<div style="clear: both;"></div>
			<!-- end content-->
		</div>
		<!-- 公共尾部 -->
	</div>
	<!-- 中部结束 -->

	<!-- 评论部分 -->
	<script type="text/javascript" src="../../source/js/jquery.flexText.js"></script>
	<!--textarea高度自适应-->
	<script type="text/javascript">

    $(function () {
        $('.content').flexText();
    });
</script>
	<!--textarea限制字数-->
	<script type="text/javascript">
    function keyUP(t){
        var len = $(t).val().length;
        if(len > 139){
            $(t).val($(t).val().substring(0,140));
        }
    }
    
</script>
	<!--点击评论创建评论条-->
	<script type="text/javascript">
    $('.commentAll').on('click','.plBtn',function(){
    	var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oSize = $(this).siblings('.flex-text-wrap').find('.comment-input').val();
        var dynamicId = $(this).siblings('.flex-text-wrap').find('.comment-input').attr("hp2");
        console.log(oSize);
        var user = '${username}';
        //动态创建评论模块
        oHtml = '<div class="comment-show-con clearfix"><div class="comment-show-con-img pull-left"><div id="nameicon" class="center_header4" style="margin-top:-10px;float:left;"><c:choose><c:when test="${imgstr== null or imgstr==''}"><a href=""><img src="source/images/user.png" id="img1"/></a></c:when><c:otherwise><a href=""><img src="${imgstr}" id="img2"/></a></c:otherwise></c:choose></div></div><div class="comment-show-con-list pull-left clearfix"><div class="pl-text clearfix"> <a href="#" class="comment-size-name">'+ user +'</a> <span class="my-pl-con">&nbsp;'+ oSize +'</span> </div> <div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"><a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" style="margin-right:40px;">回复</a> </div> </div><div class="hf-list-con"></div></div> </div>';
        if(oSize.replace(/(^\s*)|(\s*$)/g, "") != ''){
            $(this).parents('.reviewArea ').siblings('.comment-show').prepend(oHtml);
            $(this).siblings('.flex-text-wrap').find('.comment-input').prop('value','').siblings('pre').find('span').text('');
            //保存评论到数据库
            $.ajax({
    	    url : "saveReview.do", //(默认: 当前页地址) 发送请求的地址
    		type: "post", //(默认: "get") 请求方式 ("post" 或 "get")， 默认为 "get"。注意：其它 http请求方法，如 put和 delete也可以使用，但仅部分浏览器支持。
    		async:false,//(默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
    		contentType:"application/x-www-form-urlencoded",//(默认: "application/x-www-form-urlencoded") 发送信息至服务器时内容编码类型。默认值适合大多数应用场合。
    		data:{content:oSize,
    			  dynamicId:dynamicId,
    			},
    		dataType:'json',
    		success: function(json, textStatus){

    		},
    	    });
        }
    });
</script>
	<!--点击回复动态创建回复块-->
	<script type="text/javascript">
    $('.comment-show').on('click','.pl-hf',function(){
        //获取回复人的名字
        var fhName = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var reviewId = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("p3");
        var dynamicId = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').attr("p4");
        //回复@
        var fhN = '回复@'+fhName+':';
        //var oInput = $(this).parents('.date-dz-right').parents('.date-dz').siblings('.hf-con');
        var fhHtml = '<div class="hf-con pull-left"><textarea class="content comment-input hf-input" placeholder="" onkeyup="keyUP(this)"></textarea> <a class="hp3" style="display:none">'+reviewId+'</a> <a class="hp4" style="display:none">'+dynamicId+'</a><a href="javascript:;" class="hf-pl"style="color:#fff" >评论</a></div>';
        //显示回复
        if($(this).is('.hf-con-block')){
            $(this).parents('.date-dz-right').parents('.date-dz').append(fhHtml);
            $(this).removeClass('hf-con-block');
            $('.content').flexText();
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.pre').css('padding','6px 15px');
            //console.log($(this).parents('.date-dz-right').siblings('.hf-con').find('.pre'))
            //input框自动聚焦
            $(this).parents('.date-dz-right').siblings('.hf-con').find('.hf-input').val('').focus().val(fhN);
        }else {
            $(this).addClass('hf-con-block');
            $(this).parents('.date-dz-right').siblings('.hf-con').remove();
        }
    });
</script>
	<!--评论回复块创建-->
	<script type="text/javascript">
    $('.comment-show').on('click','.hf-pl',function(){
        var oThis = $(this);
        var myDate = new Date();
        //获取当前年
        var year=myDate.getFullYear();
        //获取当前月
        var month=myDate.getMonth()+1;
        //获取当前日
        var date=myDate.getDate();
        var h=myDate.getHours();       //获取当前小时数(0-23)
        var m=myDate.getMinutes();     //获取当前分钟数(0-59)
        if(m<10) m = '0' + m;
        var s=myDate.getSeconds();
        if(s<10) s = '0' + s;
        var now=year+'-'+month+"-"+date+" "+h+':'+m+":"+s;
        //获取输入内容
        var oHfVal = $(this).siblings('.flex-text-wrap').find('.hf-input').val();
        var reviewId = $(this).parents().parents().siblings('.pl-text').find('.comment-size-name').attr("p3");
        var dynamicId = $(this).parents().parents().siblings('.pl-text').find('.comment-size-name').attr("p4");
        //var reviewId = $(this).siblings('.flex-text-wrap').find('.hp3').html();
        //var dynamicId = $(this).siblings('.flex-text-wrap').find('.hp4').html();
        console.log(oHfVal)
        var oHfName = $(this).parents('.hf-con').parents('.date-dz').siblings('.pl-text').find('.comment-size-name').html();
        var oAllVal = '回复@'+oHfName+':';
        if(oHfVal.replace(/^ +| +$/g,'') == '' || oHfVal == oAllVal){

        }else {
            $.getJSON("source/json/pl.json",function(data){
                var oAt = '';
                var oAt2 = '';
                var oHf = '';
                $.each(data,function(n,v){
                    delete v.hfContent;
                    delete v.atName;
                    var arr;
                    var ohfNameArr;
                    if(oHfVal.indexOf("@") == -1){
                        data['atName'] = '';
                        data['hfContent'] = oHfVal;
                    }else {
                        arr = oHfVal.split(':');
                        ohfNameArr = arr[0].split('@');
                        data['hfContent'] = arr[1];
                        data['atName'] = ohfNameArr[1];
                    }

                    if(data.atName == ''){
                        oAt = data.hfContent;
                    }else {
                        oAt = '回复<a href="#" class="atName">@'+data.atName+'</a> : '+data.hfContent;
                    }
                    oHf = data.hfName;
                    oAt2 = data.hfContent;
                }); 
                var oHtml = '<div class="all-pl-con"><div class="pl-text hfpl-text clearfix"><a href="#" class="comment-size-name">'+'${username}'+'</a><span class="my-pl-con">'+oAt+'</span></div><div class="date-dz"> <span class="date-dz-left pull-left comment-time">'+now+'</span> <div class="date-dz-right pull-right comment-pl-block"> <a href="javascript:;" class="date-dz-pl pl-hf hf-con-block pull-left" style="margin-right:32px;">回复</a> </div> </div></div>';
                oThis.parents('.hf-con').parents('.comment-show-con-list').find('.hf-list-con').css('display','block').prepend(oHtml) && oThis.parents('.hf-con').siblings('.date-dz-right').find('.pl-hf').addClass('hf-con-block') && oThis.parents('.hf-con').remove();
              //保存回复到数据库
              $.ajax({
              url : "saveRevert.do", //(默认: 当前页地址) 发送请求的地址
              type: "post", //(默认: "get") 请求方式 ("post" 或 "get")， 默认为 "get"。注意：其它 http请求方法，如 put和 delete也可以使用，但仅部分浏览器支持。
              async:false,//(默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
              contentType:"application/x-www-form-urlencoded",//(默认: "application/x-www-form-urlencoded") 发送信息至服务器时内容编码类型。默认值适合大多数应用场合。
              data:{content:oAt2,
              	  reviewId:reviewId,
              	  dynamicId:dynamicId,
              	  toReverter:oHfName,
              	},
              success: function(json, textStatus){
              
              },
              });
            });
        }
    });
</script>
	<!--删除评论块-->
	<script type="text/javascript">
    $('.one-atl').on('click','.removeBlock',function(){
        var oT = $(this).parents('.date-dz-right').parents('.date-dz').parents('.one-atl');
        var del = $(this).attr("del");
        qikoo.dialog2.confirm('确定要删除此动态吗？',function(){
        	oT.remove();
            $.ajax({
                url : "deleteDynamic.do",
                type: "post", 
                async:false,
                contentType:"application/x-www-form-urlencoded",
                data:{
                	dynamicId:del,
                	},
                success: function(json, textStatus){
                 window.location.reload();
                },
                });
			window.location.reload();
		    },function(){	
			});
        
    })
</script>
	<!--点赞-->
	<script type="text/javascript">
    $('.one-atl').on('click','.date-dz-z',function(){
        var zNum = $(this).find('.z-num').html();
        var dynamicId = $(this).find('.z-num').attr("good");
        //alert(dynamicId);
        if($(this).is('.date-dz-z-click')){
            zNum--;
            $(this).removeClass('date-dz-z-click red');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').removeClass('red');
            //点赞减一
            $.ajax({
                url : "dynamicToGood.do", //(默认: 当前页地址) 发送请求的地址
                type: "post", //(默认: "get") 请求方式 ("post" 或 "get")， 默认为 "get"。注意：其它 http请求方法，如 put和 delete也可以使用，但仅部分浏览器支持。
                async:false,//(默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
                contentType:"application/x-www-form-urlencoded",//(默认: "application/x-www-form-urlencoded") 发送信息至服务器时内容编码类型。默认值适合大多数应用场合。
                data:{
                	dynamicId:dynamicId,
                	type:2,
                	},
                success: function(json, textStatus){
                
                },
                });
        }else {
            zNum++;
            $(this).addClass('date-dz-z-click');
            $(this).find('.z-num').html(zNum);
            $(this).find('.date-dz-z-click-red').addClass('red');
            //点赞加一
            $.ajax({
                url : "dynamicToGood.do",
                type: "post", 
                async:false,
                contentType:"application/x-www-form-urlencoded",
                data:{
                	dynamicId:dynamicId,
                	type:1,
                	},
                success: function(json, textStatus){
                
                },
                });
        }
    })
</script>
	<script src="../../source/SearchMusic/fenye/js/zxf_page.js"
		type="text/javascript"></script>


	<!-- footer -->
	<footer class="footer" style="height:170px;width:100%;">
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