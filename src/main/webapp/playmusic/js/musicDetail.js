function submit(user, id, rid) {
	if( user == null ) {
		alert("请先登录..");
		return ;
	}
	console.log(user);
	var context = $("#content").val();
	if( context == null || context.trim()=='') return ;
	$.ajax({
		url : "/music/comment", 
		type: "post", 
		async:false,//(默认: true) 默认设置下，所有请求均为异步请求。如果需要发送同步请求，请将此选项设置为 false。注意，同步请求将锁住浏览器，用户其它操作必须等待请求完成才可以执行。
		contentType:"application/x-www-form-urlencoded",
		data: {
			uid:user,
			mid:id,
			content:context,
			cid:rid,
        },
        dataType:'json',
        success: function(json, textStatus){//如果调用servlet成功，响应200。请求成功后回调函数。这个方法有两个参数：服务器返回数据，返回状态(可以缺省)。
			alert(json);
		},
		error:function (XMLHttpRequest, textStatus, errorThrown) {//如果调用servlet出现问题，响应非200（这里响应405）。通常情况下textStatus和errorThown只有其中一个有值 。(默认: 自动判断 (xml 或 html)) 请求失败时将调用此方法。这个方法有三个参数：XMLHttpRequest 对象，错误信息，（可能）捕获的错误对象。
	         alert("评论出错！");
	    }
	});
}