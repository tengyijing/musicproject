<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>站外播放器</title>
<link rel="shortcut icon" href="../../source/images/logo-b.png" />
<meta name="viewport" content="width=440,user-scalable=no">
<style>
body {
	overflow-x: hidden;
	overflow-y: hidden;
	font-family: Arial, Helvetica, sans-serif;
	color: #6A6B6F;
	text-align: center;
	width: 470px;
	margin: 0 auto;
}

h1 {
	font-size: 36px;
}

h2 {
	font-size: 24px;
}

p {
	font-size: 18px;
}

#skPlayer {
	margin: 27px auto 0;
}

.container {
	margin-top: 200px;
}

.doc {
	text-align: left;
}

pre {
	padding-left: 2em;
	font-size: 16px;
	line-height: 24px;
	color: #fff;
	background-color: #272822;
	border-radius: 3px;
}

@media screen and (max-width:768px) {
	body {
		width: 100%;
	}
	.doc {
		display: none;
	}
}
</style>
</head>
<body>
	<iframe style="position: absolute; margin-left: -683px;" frameborder=0
		width=100% height=700 marginheight=0 marginwidth=0 scrolling=no
		src="otherPlay.html"></iframe>
	<div id="skPlayer" style="position:absolute;margin-top: 500px; margin-left: 45px;"></div>
	<script src="../../source/otherPlay/dist/skPlayer.min.js"></script>
	<script>
		var player = new skPlayer({
			autoplay : true,
			//可选项配置同上
			music : {
				//必需项,音乐配置
				type : 'file',
				//必需项,自配置文件方式指定填'file'
				source : [
				//必需项,音乐文件数组
				{
					name : "${musicNameOfPlay}",
					//必需项,歌名
					author : "${singerOfPlay}",
					//必需项,歌手
					src : "${musicStrOfPlay}",
					//必需项,音乐文件
					cover : "${singerImgStrOfPlay}"
				}, ]
			}
		});
	</script>
</body>
</html>