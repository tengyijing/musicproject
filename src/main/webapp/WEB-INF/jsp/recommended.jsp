<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>推荐</title>
</head>
<body>
	<ul class="song-list">
		<c:forEach items="${recommendedSongsList}" var="recommended"
			varStatus="index">
			<li><div class="index">${index.index+1}---${recommended.musicName}---${recommended.singer}</div></li>
		</c:forEach>
	</ul>
</body>
</html>