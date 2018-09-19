<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<title>音乐详情</title>
		<meta charset="utf-8">
		<script type="text/javascript" async="" src="//wr.da.netease.com/ga.js"></script>
		<link rel="shortcut icon" href="/source/images/logo-b.png" />
		<link rel="stylesheet" type="text/css" href="/playmusic/css/playMusic.css">
		<link href="//s2.music.126.net/web/s/core_10d64aacd2e7ecff5b84bc1a4f0d256f.css?10d64aacd2e7ecff5b84bc1a4f0d256f" type="text/css" rel="stylesheet">
		<link href="//s2.music.126.net/web/s/pt_frame_cb90df5deb9e71bf7f9a7f1d407d3d32.css?cb90df5deb9e71bf7f9a7f1d407d3d32" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="/playmusic/js/jquery-1.10.2.js"></script>
		<script type="text/javascript" charset="UTF-8" src="/playmusic/js/musicDetail.js"></script>
		<style>
			a:hover{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
		<div class="top">
			<a style="display: inline-block;cursor: pointer;margin-top: 5px;margin-left: 20px;font-size: 32px;color: #FFF;" href="/index">爱唱音乐</a>
			<div class="mainNav" style="margin-top: 0px;">
				<div id="nameicon" class="center_header" style="margin-left:60px;margin-right:10px;float:left;">
        			<a href="User/personalInfo" target="_blank">
        				<c:choose>
                           <c:when test="${sessionScope.user==null or sessionScope.user.image==null}">
                           	<img src="/images/headPhoto/user.png"/>
                           </c:when>
                           <c:otherwise>
                           	<img src="${sessionScope.user.image}"/>
                           </c:otherwise>
                        </c:choose>
        			</a>
        		</div>
		         <div id="name" style="padding-top:21px;">
		         	<a href="User/personalInfo" style="cursor:pointer;color:#fff" target="_blank" >${username}</a>
		         </div>
			</div>
		</div>
		<div class="g-bd4 f-cb" style="margin-top: 56px;">
			<div class="g-mn4">
				<div class="g-mn4c">
					<div class="g-wrap6">
						<div class="m-lycifo">
							<div class="f-cb">
								<div class="cvrwrap f-cb f-pr">
									<div class="u-cover u-cover-6 f-fl">
										<!-- 歌曲图片 -->
										<img src="${music.image }" class="j-img">
										<span class="msk f-alpha"></span>
									</div>
								</div>
								<div class="cnt">
									<div class="hd">
										<i class="lab u-icn u-icn-37"></i>
										<div class="tit">
											<!-- 歌曲名 -->
											<em class="f-ff2">${music.mname }</em>
										</div>
									</div>
									<p class="des s-fc4">歌手：<span >${music.sname }</span></p>
									<div class="m-info">
										<div id="content-operation" class="btns f-cb">
											<a href="javascript:;" class="u-btn2 u-btn2-2 u-btni-addply f-fl"  title="播放"><i><em class="ply"></em>播放</i></a>
											<a class="u-btni u-btni-fav " href="javascript:;">
												<i>收藏</i>
											</a>
											<a class="u-btni u-btni-share " href="javascript:;"><i>分享</i></a>
											<a class="u-btni u-btni-dl " href="javascript:;"><i>下载</i></a>
											<a href="javascript:;" class="u-btni u-btni-cmmt "><i>(<span id="cnt_comment_count">6159</span>)</i></a>
										</div>
									</div>
									<div id="lyric-content" class="bd bd-open f-brk f-ib" >${lrc}</div>
								</div>
							</div>
						</div>
						
						<!--评论块-->
						<div class="n-cmt" id="comment-box" >
							<div id="auto-id-U98sFDT6iBe13DBo">
								<div class="u-title u-title-1">
									<h3><span class="f-ff2">评论</span></h3><span class="sub s-fc3">共<span class="j-flag">6159</span>条评论</span>
								</div>
								<div class="m-cmmt">
									<div class="iptarea">
										<!--用户头像，没有的话使用默认头像-->
										<div class="head">
											<c:choose>
	                                            <c:when test="${sessionScope.user==null or sessionScope.user.image==null}">
	                                            	<img src="/images/headPhoto/user.png"/>
	                                            </c:when>
	                                            <c:otherwise>
	                                            	<img src="${sessionScope.user.image}"/>
	                                            </c:otherwise>
                                            </c:choose>
										</div>
										<div class="j-flag">
											<div>
												<div class="m-cmmtipt f-cb f-pr">
													<div class="u-txtwrap holder-parent f-pr" style="display: block;">
															<textarea class="u-txt area j-flag"  placeholder="评论" id="content"></textarea>
													</div>
													<div class="btns f-cb f-pr">
														<c:choose>
				                                            <c:when test="${sessionScope.user==null}">
				                                            	<a class="btn u-btn u-btn-1 j-flag" id="comment" onclick="submit(null, ${music.mid})">评论</a>
				                                            </c:when>
				                                            <c:otherwise>
				                                            	<a class="btn u-btn u-btn-1 j-flag" id="comment" onclick="submit(${sessionScope.user.uid}, ${music.mid})">评论</a>
				                                            </c:otherwise>
			                                            </c:choose>
													</div>
												</div>
											</div>
										</div>
									</div>
									<div class="cmmts j-flag" >
										<h3 class="u-hd4">精彩评论</h3>
										<div  class="itm" >
											<div class="head">
												<a href="/user/home?id=20686351"><img src="http://p1.music.126.net/DYgPoURrbWh1B7Dp_qODNw==/19045740416754223.jpg?param=50y50"></a>
											</div>
											<div class="cntwrap">
												<div class="">
													<div class="cnt f-brk"><a href="/user/home?id=20686351" class="s-fc7">音痴音痴怪我咯丶</a>：很想知道这歌是先有英文版还是中文版。</div>
												</div>
												<div class="rp">
													<div class="time s-fc4">2014年12月11日</div>
													<a data-id="6963159" data-type="like" href="javascript:void(0)">
														<i class="zan u-icn2 u-icn2-12"></i> (14428)
													</a>
													<span class="sep">|</span>
													<a href="" class="s-fc3" >回复</a></div>
											</div>
										</div>
									</div>
									<!--分页插件-->
									<div class="j-flag auto-1536890855062-parent">
										<div class="auto-1536890855062 u-page">
											<a href="#" class="zbtn zprv js-p-1536890855062 js-disabled" id="auto-id-KgJ8NsEkR2lUugPG">上一页</a>
											<a href="#" class="zpgi zpg1 js-i-1536890855062 js-selected" id="auto-id-HpTBl10MvebbESFx">1</a>
											<span class="zdot">...</span>
											<a href="#" class="zpgi zpg9 js-i-1536890855062" id="auto-id-8WLhbE0zLCV1SLDm">308</a>
											<a href="#" class="zbtn znxt js-n-1536890855062" id="auto-id-sDbQW74NGydVKca4">下一页</a></div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>