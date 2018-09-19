<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="UTF-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>话题</title>
    <link rel="shortcut icon" href="../../source/images/logo-b.png"/>
    <link rel="stylesheet" href="../../source/css/reset.css">
    <link rel="stylesheet" href="../../source/css/index.css">
    <script src="../../source/js/jquery.min.js"></script>
    <script src="../../source/js/script.js"></script>
    <script src="/myjs/index.js"></script>
    <script src="/myjs/searcher.js"></script>
    <link href="../../source/huati/css/bootstrap.min.css" type="text/css" rel="stylesheet">
    <link href="../../source/huati/css/style.css" type="text/css" rel="stylesheet">
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
    <link href="../../source/SearchMusic/css/qikoo.css" type="text/css" rel="stylesheet"/>
    <script src="../../myjs/qikoo.js"></script>
    <script type="text/javascript">
        var menuid =
        ${menuid}
    </script>
</head>

<body onload="getName('${username}');">
<header class="header">
    <div class="header-container" style="width:1200px;">
        <div class="header-top">
            <a href="../../index.jsp" class="logo"></a>
            <nav class="header-nav">
                <ul id="tophuati">
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
                <p style="margin-left:4px;margin-top:5px;"><a href="User/exit"><img src="/images/exit.png"></a></p>
            </div>
            <div class="header-login" style="margin-right:-10px;">
                <a href="/login" class="open-green" id="login">登录</a>
                <a href="/register" class="open-vip" id="reg">注册</a>
            </div>
        </div>
        <ul class="header-subNav" style="margin-top:20px;" id="tophuatiChild">


        </ul>
    </div>
</header>
<section class="container user-select" style="margin-left:-7px;">
    <!--/超小屏幕可见-->
    <div class="content-wrap"><!--内容-->
        <div class="content">
            <div id="carousel-example-generic" class="carousel slide" data-ride="carousel"> <!--banner-->
                <ol class="carousel-indicators">
                    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                </ol>
                <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> <span
                        class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span> <span class="sr-only">Previous</span>
                </a> <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
                    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span> <span class="sr-only">Next</span>
                </a></div>
            <!--/banner-->
            <div class="content-block hot-content hidden-xs">
                <h2 class="title"><strong style="color: red;font-weight: bold;">本周话题</strong></h2>
                <ul>
                    <li class="large"><a href="javascript:scroll('list1');" target="_self"><img
                            src="../../source/huati/images/list1.jpg" alt="">
                        <h3> 在那个平静时刻的奇妙:Cigarettes After Sex </h3>
                    </a></li>
                    <li><a href="javascript:scroll('list2');"><img src="../../source/huati/images/list2.jpg" alt="">
                        <h3> “认真地老去”的张希</h3>
                    </a></li>
                    <li><a href="javascript:scroll('list3');"><img src="../../source/huati/images/list3.jpg" alt="">
                        <h3> 唱得再多，也没办法在爱面前装年轻！</h3>
                    </a></li>
                    <li><a href="javascript:scroll('list4');"><img src="../../source/huati/images/list4.jpg" alt="">
                        <h3> 给相识及未曾相识的人 </h3>
                    </a></li>
                    <li><a href="javascript:scroll('list5');"><img src="../../source/huati/images/list5.jpg" alt="">
                        <h3> 探索嘻哈先锋派之旅！ </h3>
                    </a></li>
                </ul>
            </div>
            <div class="content-block new-content">
                <h2 class="title"><strong style="color: red;font-weight: bold;">音乐专栏</strong></h2>
                <div class="row">
                    <div class="news-list" id="list1">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4" style="margin-top:50px ;"><img
                                src="../../source/huati/images/rank1.jpg" alt="" width="220px" height="220px"></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt style="font-size: 20px;"> 在那个平静时刻的奇妙:Cigarettes After Sex</dt>
                                <dd class="text" style="line-height:30px">早在2008年，唱作人 Greg Gonzales 就已经在得克萨斯的家乡组建了
                                    Cigarettes After Sex，并在2012年推出了乐队第一张作品，饱含浪漫情怀的四首歌EP《I》。此后不久 Greg Gonzales
                                    便移居纽约，重组了乐队，并在过去两年间录制了这张在世界各地重新掀起 dream pop 热潮的《Cigarettes After
                                    Sex》。今年6月，随着这张同名专辑的发行，Cigarettes After Sex 成为了今年独立音乐圈炙手可热的最大惊喜。

                                    伴着简约、舒缓却又充满画面感的配器编曲，主唱 Greg Gonzales
                                    雌雄莫辨的阴柔嗓音，通过苦甜交织的低吟浅唱，讲述了一个个值得追忆的往日时光，乐队的音乐仿如他们队名一样，让听者感到惬意、温暖而平静。
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="news-list" id="list2">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4" style="margin-top:50px ;"><img
                                src="../../source/huati/images/rank2.jpg" alt=""></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt style="font-size: 20px;"> “认真地老去”的张希</dt>
                                <dd class="text" style="line-height:30px">
                                    通过与曹方合唱的单曲《认真地老去》，许多听众第一次认识了张希（豆瓣音乐人小站）。质朴走心路线的创作与演绎透露出这位民谣唱作人对音乐的虔诚态度。但在此之前，张希就师从著名音乐人小柯，后者许多作品都由他完成编曲，随后张希更为多位大牌流行音乐人的作品贡献了幕后的演奏与制作工作。今年7月，张希终于从幕后走到台前，他的首张个人专辑《认真地老去》在经过三年的悉心打磨之后终于浮出水面，新专辑的巡演也随即开始。8月12日，这个周六，第一波巡演即将迎来北京站的演出，音乐人好友曹方、满江等人也将作为嘉宾助阵。在现场见到他之前，来看看张希是如何回忆自己与音乐结缘的故事的。
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="news-list" id="list3">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4" style="margin-top:50px ;"><img
                                src="../../source/huati/images/list3.jpg" alt=""></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt style="font-size: 20px;"> 唱得再多，也没办法在爱面前装年轻！</dt>
                                <dd class="text" style="line-height:30px">
                                    1910年，当Leo Friedman和Beth Slater
                                    Whitson为舞会创作的这首华尔兹歌曲时，可没有想到这首歌会被用在ITV的王牌聚集《唐顿庄园》的一个重要场景中：为了挽救陷入危机的庄园，一场精心准备的晚宴和聚会被寄予厚望，却因为各种各样的乌龙而快要分崩离析。没人想到最终挽救这场“不体面”，“极为失礼”的晚宴的，是一首漫不经心的情歌。

                                    已经无法考证谁是首唱这首歌的歌手了，甚至很可能没有留下初版的录音。一直到1930年代的大乐队时代，唱过的歌手应该无数，但最终留下记录的只有寥寥。翻遍手头的资料，只有一张大乐队时代的皇后Patti
                                    Page的录音。
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="news-list" id="list4">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4" style="width:250px;height: 210px;"><img
                                src="../../source/huati/images/rank4.jpg" alt="" style="margin-top:50px ;"></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt style="font-size: 20px;"> 给相识及未曾相识的人:</dt>
                                <dd class="text" style="line-height:30px">
                                    这两年，从对自己反复多次失望的状态中，写出了我这六七年最满意的曲子；从对现实失望的老人马中，和仍对未来有憧憬的新人马里，拉起一支队伍；从对我还有信心的那些还在坚持经营这行业的兄弟那得到了支持；甚至把身边做其它行业的那些＂无辜＂朋友那里，也找到了后盾。于是便有了这次即将完成的唱片，和即将开始的巡回演唱会。
                                    人皆不惑，却撒娇耍赖，很多人不明：李泉想干嘛！无他，心有不舍，也有不甘，为音乐，为好伙伴，为自己。人应该还需要音乐吧？如果有需要，就要有人好好地做，真心实意地做。
                                    雨停了，该去棚里了。瑞士现在很清冷，我的心热着，相信还有很多人热着，也相信老去前应该做些热的事情。期待用音乐跟你见面的那天！
                                </dd>
                            </dl>
                        </div>
                    </div>
                    <div class="news-list" id="list5">
                        <div class="news-img col-xs-5 col-sm-5 col-md-4" style="margin-top: 60px;"><img
                                src="../../source/huati/images/list5.jpg" alt=""></div>
                        <div class="news-info col-xs-7 col-sm-7 col-md-8">
                            <dl>
                                <dt style="font-size: 20px;"> 探索嘻哈先锋派之旅！</dt>
                                <dd class="text" style="line-height:30px">
                                    1994 年，在《闲谈》杂志（Mixmag）引入了「神游舞曲」（Trip Hop）这一概念后，许多音乐被自动地归入其中。兴盛一时的「酸性爵士」（Acid
                                    Jazz）已经日薄西山。其中英国厂牌 Mo Wax' 早期在「酸性爵士」风格上的尝试说不上成功。DJ Shadow 在前一年用一曲「In/Flux」拯救了 Mo
                                    Wax' 老板詹姆斯·拉维勒（James Lavalle）。当然，后者为完成 Mo Wax' 的复兴，除了积极地联系 DJ
                                    Shadow，还通过爵士杂志《无人可及》（Straight No Chaser）的编辑，保罗·布拉德肖（Paul Bradshaw）与远在日本的制作人 DJ Krush
                                    取得了联系。『Krush』是 DJ Krush
                                    个人第一张正式专辑，有饶舌艺人和女歌手在其中献声。「日式调酒」（Mixology）从九十年代开始在霓虹各地的小型俱乐部兴盛起来，『Krush』也正是如此，有着明显的「酸性爵士」的印记（因此由
                                    Shadow Records 引入美国市场）。
                                </dd>
                            </dl>
                        </div>
                    </div>
                </div>
                <!--<div class="news-more" id="pagination">
                    <a href="javascript:;">查看更多</a>
                </div>-->
            </div>
        </div>
    </div>
    <!--/内容-->
    <aside class="sidebar visible-lg" style="margin-top:50px;padding-left:100px;width:400px;"><!--右侧>992px显示-->
        <div class="sentence"><strong style="font-weight: bold;">每日放送</strong>
            <h2 style="font-size: 15px;font-weight: bold;">周杰伦：晴天</h2>
            <p style="font-weight: bold;color: #EB6E72;">你是我人生中唯一的主角，我却只能是你故事中的一晃而过得路人甲。</p>
        </div>

        <div class="sidebar-block recommend" style="margin-top: 40px;">
            <h2 class="title"><strong style="border-bottom: 2px solid red;color: red;font-weight: bold;">热门推荐</strong>
            </h2>
            <ul>
                <li><a target="_blank" href="javascript:;"> <span class="thumb"><img
                        src="../../source/huati/images/icon/icon.png" alt=""></span> <span class="text"
                                                                                           style="font-weight: bold;margin-left:20px ;">陈奕迅：单车</span>
                    <span class="text-muted" style="font-weight: bold;margin-left:20px ;">出自专辑：《Get a Life 》</span></a>
                </li>
                <li><a target="_blank" href="javascript:;"> <span class="thumb"><img
                        src="../../source/huati/images/icon/icon.png" alt=""></span> <span class="text"
                                                                                           style="font-weight: bold;margin-left:20px ;">李健：风吹麦浪</span>
                    <span class="text-muted" style="font-weight: bold;margin-left:20px ;">出自专辑：《想念你 》</span></a></li>
                <li><a target="_blank" href="javascript:;"> <span class="thumb"><img
                        src="../../source/huati/images/icon/icon.png" alt=""></span> <span class="text"
                                                                                           style="font-weight: bold;margin-left:20px ;">张国荣：似水流年</span>
                    <span class="text-muted" style="font-weight: bold;margin-left:20px ;">出自专辑：《Salute 》</span></a></li>
                <li><a target="_blank" href="javascript:;"> <span class="thumb"><img
                        src="../../source/huati/images/icon/icon.png" alt=""></span> <span class="text"
                                                                                           style="font-weight: bold;margin-left:20px ;">金志文：远走高飞</span>
                    <span class="text-muted" style="font-weight: bold;margin-left:20px ;">出自专辑：《Hello 1 》</span></a>
                </li>
                <li><a target="_blank" href="javascript:;"> <span class="thumb"><img
                        src="../../source/huati/images/icon/icon.png" alt=""></span> <span class="text"
                                                                                           style="font-weight: bold;margin-left:20px ;">蔡健雅：双栖动物</span>
                    <span class="text-muted" style="font-weight: bold;margin-left:20px ;">出自专辑：《双栖动物 》</span></a></li>
            </ul>
        </div>
        <div class="sidebar-block comment">
            <h2 class="title"><strong style="border-bottom: 2px solid red;color: red;font-weight: bold;">下期预告</strong>
            </h2>
            <ul>
                <li data-toggle="tooltip" data-placement="top"><a target="_blank" href="javascript:;"><span
                        class="face"><img src="../../source/huati/images/icon/icon.png" alt=""></span> <span
                        class="text" style="margin-top: 20px;">被凝视的肉体与歌唱中的魂灵：海青专访</span></a></li>
                <li data-toggle="tooltip" data-placement="top"><a target="_blank" href="javascript:;"><span
                        class="face"><img src="../../source/huati/images/icon/icon.png" alt=""></span> <span
                        class="text" style="margin-top: 20px;">回顾 Liam Gallagher 的故事，会映出你的青春</span></a></li>
                <li data-toggle="tooltip" data-placement="top"><a target="_blank" href="javascript:;"><span
                        class="face"><img src="../../source/huati/images/icon/icon.png" alt=""></span> <span
                        class="text" style="margin-top: 20px;">华晨宇谈《齐天》：心中爱着你的美丽，又怎能嘴上装四大皆空</span></a></li>
                <li data-toggle="tooltip" data-placement="top"><a target="_blank" href="javascript:;"><span
                        class="face"><img src="../../source/huati/images/icon/icon.png" alt=""></span> <span
                        class="text" style="margin-top: 20px;">周笔畅专访：做音乐的时候需要有强迫症</span></a></li>
                <li data-toggle="tooltip" data-placement="top"><a target="_blank" href="javascript:;"><span
                        class="face"><img src="../../source/huati/images/icon/icon.png" alt=""></span> <span
                        class="text" style="margin-top: 20px;">一个励志故事：从资深邪典文艺老青年到宅系Hip Hop票友</span></a></li>
            </ul>
        </div>
    </aside>
    <!--/右侧>992px显示-->
</section>
<div><a href="javascript:;" class="gotop" style="display:none;"></a></div>
<!--/返回顶部-->
<script src="../../source/huati/js/nprogress.js" type="text/javascript"></script>
<script src="../../source/huati/js/bootstrap.min.js" type="text/javascript"></script>
<script type="text/javascript">
    //返回顶部按钮
    $(function () {
        $(window).scroll(function () {
            if ($(window).scrollTop() > 100) {
                $(".gotop").fadeIn();
            }
            else {
                $(".gotop").hide();
            }
        });
        $(".gotop").click(function () {
            $('html,body').animate({'scrollTop': 0}, 500);
        });
    });
    //内容覆盖与隐藏
    $(function () {
        $(".hot-content ul li").hover(function () {
            $(this).find("h3").show();
        }, function () {
            $(this).find("h3").hide();
        });
    });
</script>
<script src="../../source/huati/js/hovertreescroll.js"></script>
<script type="text/javascript">
    function scroll(id) {
        $("#" + id).HoverTreeScroll(1000);
    }
</script>
<!-- footer -->
<footer class="footer" style="height:170px;">
    <div class="footer-inner">
        <div class="footer-copyright" style="padding-top:30px;">
            <p><a href="#">关于我们</a><span>|</span><a href="#">帮助中心</a><span>|</span><a href="#">意见反馈</a><span>|</span><a
                    href="#">独立音乐人合作</a><span>|</span><a href="#">音乐专栏</a><span>|</span><a href="#">校园小助手</a></p>
            <p>© 2018 Qingdao University of Technology| LPJ</p>
            <p><a href="http://www.miitbeian.gov.cn">鲁ICP备18010745号</a></p>
        </div>
    </div>
</footer>
</body>
</html>
