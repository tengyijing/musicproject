<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<title>个人主页</title>
<link rel="stylesheet" type="text/css"
	href="../../source/person/css/jiazaitoubu.css">
<link rel="stylesheet" type="text/css"
	href="../../source/person/css/css.css">
<script src="../../source/person/js/jquery-1.8.3.min.js"></script>
<script src="../../myjs/index2.js"></script>
<link rel="stylesheet" type="text/css"
	href="../../source/person/css/center.css">

<!--城市联动-->
<link rel="stylesheet" type="text/css"
	href="../../source/person/city/city.css">
<script src="../../source/person/city/Popt.js"></script>
<script src="../../source/person/city/cityJson.js"></script>
<script src="../../myjs/userInfoCityset.js"></script>
<!-- 上传头像 -->
<script src="../../source/person/headImage/head/jquery.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="../../source/person/headImage/css/bootstrap.min.css">
<link href="../../source/person/headImage/head/cropper.min.css"
	rel="stylesheet">
<link href="../../source/person/headImage/head/sitelogo.css"
	rel="stylesheet">
<link rel="stylesheet" type="text/css"
	href="../../source/person/headImage/css/font-awesome.min.css">

<script src="../../source/person/headImage/head/bootstrap.min.js"></script>
<script src="../../source/person/headImage/head/cropper.js"></script>
<script src="../../source/person/headImage/head/sitelogo.js"></script>
<script src="../../source/person/headImage/head/html2canvas.js"></script>
<!-- 生日插件 -->
<script type="text/javascript"
	src="../../source/person/birthday/jedate/jedate.js"></script>
<style>
.datainp {
	width: 200px;
	height: 30px;
	border: 1px #ccc solid;
	text-align: center;
}
</style>
<!--页脚 -->
<link rel="stylesheet" type="text/css"
	href="../../source/person/footer/index.css">
</head>
<%
	request.setCharacterEncoding("utf-8");
	String name = (String) request.getAttribute("name");
	String zname = (String) request.getAttribute("zname");
	String email = (String) request.getAttribute("email");
	String tel = (String) request.getAttribute("tel");
	String birthday = (String) request.getAttribute("birthday");
	String date = (String) request.getAttribute("date");
	String imgstr = (String) request.getAttribute("imgstr");
	if (name == null) {
		name = "";
	}
	if (zname == null) {
		zname = "";
	}
	if (email == null) {
		email = "";
	}
	if (tel == null) {
		tel = "";
	}
	if (birthday == null) {
		birthday = "";
	}
	if (date == null) {
		date = "";
	}
%>

<body onload="getAddress('${userInfo.address}');verfiyAttentioned('${userInfo.uid}');">
	<!--top-->
	<div class="centers_m">
		<!--清除浮动-->
		<div class="clear_sm"></div>
		<!--left-->
		<div class="centers_ml">
			<!--头像-->
			<div class="center_header">
			</div>
			<script type="text/javascript">
				$(
						function() {//第一步都得写这个
							$(".centers_listm_one_in").click(
									function() {
										$(this).next(".gjszmdm").slideToggle()
												.siblings("gjszmdm").slideUp()
									});
						})
			</script>
		</div>
		<!--right-->
		<div class="centers_mr">
			<h1 class="welcom_tm">
				爱唱
				<c:choose>
					<c:when test="${userInfo.vip == 1}">
						<span style="color: red">会员</span>
					</c:when>
					<c:otherwise>
                    用户
                </c:otherwise>
				</c:choose>
				<font>${userInfo.uname}</font>！
			</h1>
			<!--一条开始-->
			<div class="public_m1">
				<div class="public_m2">用户资料</div>
				<!--照片和内容-->
				<div class="zp_nrm">
					<!--left-->
					<div class="zp_nrm_l">

						<img src="${imgstr}" id="img4" />
		
						<div class="loading" aria-label="Loading" role="img" tabindex="-1"></div>
						
						<!-- 更换头像结束 -->
					</div>
					<!--right-->
					<div class="zp_nrm_r">
						<form action="/User/changUserInfo" method="post" id="form1">
							<span> <input value="${userInfo.uname}" style="display: none"
								name="uname">
							</span>
							<p id="userEmail">
								<em>邮箱：</em><i>${userInfo.email}</i> 
							</p>
							<p id="userPhone">
								<em>手机号：</em><i>${userInfo.phone}</i> 
							</p>

							<p>
								<em>VIP：</em>

								<c:choose>
									<c:when test="${userInfo.vip == 0 }">
										<!-- 充值会员 暂时不做-->
                                    非会员
									</c:when>
									<c:otherwise>
                                    会员
									</c:otherwise>
								</c:choose>
							</p>
							<p>
								<em>性别：</em>
								<c:if test = "${userInfo.sex==0}">
									男
								</c:if>
								<c:if test = "${userInfo.sex==1}">
									女
								</c:if>
								<c:if test = "${userInfo.sex==2}">
									保密
								</c:if>
							</p>
							<p>
								<em>居住城市：</em> <span> <span id="province">
									

								</span> <span id="cityInfo"> </span>
								</span>

							</p>
							<span id="attention">
							<%--js修改代码--%>
							<a style="text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;"
								class="public_m3" onclick="attention('0fc1df322d394a6c9853e8a31f1680c3');">保存修改</a>

							</span>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
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
			<p>© 2017 Qingdao University of Technology| LPJ</p>
			<p>我们公司 版权所有 我们网络文化经营许可证</p>
		</div>
	</div>
	</footer>
</body>
</html>
