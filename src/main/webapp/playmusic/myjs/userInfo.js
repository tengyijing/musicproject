//进入页面即触发
// 根据用户地址信息显示，用户有地址即显示地址以及修改按钮
//没有即显示添加按钮
function getAddress(address) {
    if (address != null && address != "") {
        userCityInfo(address);
    }
}

//显示用户所在城市信息
function userCityInfo(address) {
    $.ajax({
        url: "/User/userCityInfo",
        type: "post",
        async: false,
        contentType: "application/x-www-form-urlencoded",
        data: {addressId: address},
        success: function (data) {
            var str = "";
            str += "        " + data.pname + "   " + data.name;
            str += "&nbsp;&nbsp;&nbsp;&nbsp;";
            $("#province").html(str);
        }
    })
}


//验证登陆用户，是否关注了点击头像显示信息的用户
//没有即显示关注按钮，有则显示取消关注按钮
function verfiyAttentioned(bid) {
	$.ajax({
		url:"/attention/verfiyAttentioned",
		type:"post",
		async:false,
		contentType: "application/x-www-form-urlencoded",
		data:{bid:bid},
		success : function(data){
			var str = "";
		    if (data == true) {
		        str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
		        str += "class=\"public_m3\" onclick=\"cancelAttention('" +bid+ "');\">取消关注</a>";
		    } else {
                str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
                str += "class=\"public_m3\" onclick=\"attention('" +bid+ "');\">关注</a>";
		    }
		    $('#attention').html(str);
		}
	})
}
//关注用户
function attention(bid) {
	$.ajax({
        url:"/attention/addAttention",
        type:"post",
        async:false,
        contentType:"application/x-www-form-urlencoded",
        data:{bid:bid},
        success : function (data) {
        	var str = "";
		    if (data == true) {
		        str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
		        str += "class=\"public_m3\" onclick=\"cancelAttention('" +bid+ "');\">取消关注</a>";
		    } else {
                str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
                str += "class=\"public_m3\" onclick=\"attention('" +bid+ "');\">关注</a>";
		    }
		    $('#attention').html(str);
        }
    })
}
//取消关注
function cancelAttention(bid) {
    $.ajax({
        url:"/attention/cancelAttentioned",
        type:"post",
        async:false,
        contentType:"application/x-www-form-urlencoded",
        data:{bid:bid},
        success : function (data) {
        	var str = "";
		    if (data == false) {
		        str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
		        str += "class=\"public_m3\" onclick=\"cancelAttention('" +bid+ "');\">取消关注</a>";
		    } else {
                str += "<a style=\"text-decoration: none; cursor: pointer; width: 265px; margin-right: 313px; background-color: #FA3B4A;\"";
                str += "class=\"public_m3\" onclick=\"attention('" +bid+ "');\">关注</a>";
		    }
		    $('#attention').html(str);
        }
    })
}

//显示粉丝及用户的关注人  进入页面即开始执行
function showFansAndAttention(uid) {
    $.ajax({
        url:"/attention/showFansAndAttention",
        type:"post",
        async:false,
        contentType:"application/x-www-form-urlencoded",
        data:{uid:uid},
        success:function (data) {
            var str = "";
            for (var i = 0; i < data[0].length; i++) {
                str += "<li class=\"item\">";
                str += "<a href=\"/User/personalInfo?uid="+ data[0][i].user.uid +"\" target='_new' class=\"img\">";
                str += "<img style=\"width: 100px;height: 100px\" src=\""+ data[0][i].user.image +"\" alt=\"#\">";
                str += "<i class=\"icon-play\"></i>\n" +
                    "                            </a>";
                str += "<div class=\"info\">";
                str += "<a href=\"/User/personalInfo?uid="+ data[0][i].user.uid +"\" target='_new'\n" +
                    "                                   class=\"author\">"+ data[0][i].user.uname +"</a>";
                str += "</div>\n" +
                    "                        </li>";
            }
            $('#fansUser').html(str);
            str = "";
            for (var i = 0; i < data[1].length; i++) {
                str += "<li class=\"item\">";
                str += "<a href=\"/User/personalInfo?uid="+ data[1][i].user.uid +"\" target='_new' class=\"img\">";
                str += "<img style=\"width: 100px;height: 100px\" src=\""+ data[1][i].user.image +"\" alt=\"#\">";
                str += "<i class=\"icon-play\"></i>\n" +
                    "                            </a>";
                str += "<div class=\"info\">";
                str += "<a href=\"/User/personalInfo?uid="+ data[1][i].user.uid +"\" target='_new'\n" +
                    "                                   class=\"author\">"+ data[1][i].user.uname +"</a>";
                str += "</div>\n" +
                    "                        </li>";
            }
            $('#attentionUser').html(str);
        }
    })
}