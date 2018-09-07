<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>聚类分析推荐好友</title>
<link rel="stylesheet" href="../../source/css/reset.css">
  <link rel="stylesheet" href="../../source/css/index.css">
  <script src="../../source/js/jquery.js"></script>
  <script src="../../source/js/script.js"></script>
  <!-- 主体 -->
  <link rel="stylesheet" href="../../source/mysong/css/main.css">
  <script src="../../source/mysong/js/main.js"></script>
    <script src="../../source/js/index.js"></script>
</head>
<body>
<!-- 列表 -->		
<div class="addfriend">
		<!-- 搜索框 -->
         <div class="collectOut">
						<div class="col" style="margin-left:75px; width:250px;">			
							<ul class="menuUL2" style="margin-top:30px;">
							<c:forEach items="${friendListOfClustering}" var="user" varStatus="index1">
							<li class="menuLi2 cur">		
							  <div  class="beijing hp">
							  <!-- 头像 -->
								<span id="nameicon" class="center_header2">
								<a><img src="../../source/mysong/images/pic02.jpg" id="img1"/></a>
							    <%-- <c:choose>
                                <c:when test="${user.imgstr== null or user.imgstr==''}">
                                <a href="visitFriend.do?user=${user.username}"  target="_top"><img src="images/user.png" id="img1"/></a>
                                </c:when>
                                <c:otherwise>
                                <a href="visitFriend.do?user=${user.username}"  target="_top"><img src="${user.imgstr}" id="img2"/></a>
                                </c:otherwise>
                                </c:choose> --%>
                                </span>
                              <!-- 结束 -->
								 <a style="color:black; background-color:transparent;">${user}</a>
								 </div>
							</li>
							</c:forEach>
							</ul>
							<a href="getInfoOfUserClustering.do" class="toggle">换一批</a>
						</div>
		</div>
		</div>
</body>
</html>