<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查找好友</title>
<link rel="stylesheet" href="../../source/css/reset.css">
  <link rel="stylesheet" href="../../source/css/index.css">
  <script src="../../source/js/jquery.js"></script>
  <script src="../../source/js/script.js"></script>
  <!-- 主体 -->
  <link rel="stylesheet" href="../../source/mysong/css/main.css">
  <script src="../../source/mysong/js/main.js"></script>
    <script src="../../source/js/index.js"></script>
    <script src="../../source/mysong/js/addFriend.js"></script>
</head>
<body>
<!-- 列表 -->		
<div class="addfriend">
		<!-- 搜索框 -->
		<div class="header-search" style="margin-left:75px;margin-top:30px;background-color:#fff;">
		<form action="selectFriend.do" method="post" id="searchform1">
		<input type="text" class="text" placeholder="查找用户,可输入模糊用户、邮箱" name="user" id="user">
		<div class="btn" onclick="searchName();"><i class="icon-sprite"></i></div>
		</form>
		</div>

         <div class="collectOut">
						<div class="col" style="margin-left:75px; width:250px;">			
							<ul class="menuUL2" style="margin-top:10px;">
							<c:forEach items="${userNameList}" var="user" varStatus="index1">
							<li class="menuLi2 cur">		
							  <div  class="beijing hp">
							  <!-- 头像 -->
								<span id="nameicon" class="center_header2">
							    <c:choose>
                                <c:when test="${user.imgstr== null or user.imgstr==''}">
                                <a href="visitFriend.do?user=${user.username}"  target="_top"><img src="../../source/images/user.png" id="img1"/></a>
                                </c:when>
                                <c:otherwise>
                                <a href="visitFriend.do?user=${user.username}"  target="_top"><img src="${user.imgstr}" id="img2"/></a>
                                </c:otherwise>
                                </c:choose>
                                </span>
                              <!-- 结束 -->
								 <a href="getFriendSong.do?user=${user.username}"  target="_top"  style="color:black; background-color:transparent;">${user.username}</a>
								 </div>
							</li>
							</c:forEach>
							</ul>
						</div>
		</div>
		</div>
</body>
</html>