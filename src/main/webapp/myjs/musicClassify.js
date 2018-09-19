$(function() {
	$.ajax({
		type : 'get',
		url : '/admin/queryMcategoryAll',
		success : function(data) {
			var str = "<h1 style='font-size:30px'><a href='javascript:void(0)' onclick='location.reload()'>全部</a></h1>"
			for (var i = 0; i < data.length; i++) {
				str+="<dl class='mod-tags1' style='clear:both;'>";
				if (data[i].parentid == 0) {
					str += "<dt>" + data[i].cname + "</dt>";
					var j = i + 1;
					while (j < data.length) {
						if (data[j].parentid != 0) {
							str += "<dd><a href='javascript:choose("+data[j].cid+",1)'>" + data[j].cname + "</a></dd>";
						} else {
							break;
						}
						j++;
					}
					i=j-1;
				}
				str+="</dl>";
			}
				$("#musicmcategory").html(str);
		}
	})
})

$(function (){
	$.ajax({
		type:'get',
		url : '/musicClassify/queryAll',
		success:function(data){
			var str1 = "";
			var sum = 0;
			var str = "";		
			sum = Math.ceil(data.list.length/4) ;
			for(var j=0;j<sum;j++){
				if(j!=0){
					str+="<div class='new_songs new_common' style='margin-top:-20px;'>";	
				}else {
					str+="<div class='new_songs new_common'>";
				}
				 str += "<ul class='show'>";
				var s = ((j+1)*4>data.list.length)?data.list.length:(j+1)*4;
				 for(var i=j*4;i<s;i++){
						str+="<li class='albumBox'>";
						str+="<div class='album' style='background-color: #535B5E'><p>";
						str+="<a href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><img width='220' height='220' src='../../source/pic/album1-220x220.jpg' class='attachment-220x220 wp-post-image' alt='"+data.list[i].sname+"' /> " ;
						str+=		"<span><em>"+data.list[i].sname+"</em></span></a></p>";
						str+="<a style='background-color: #535B5E' href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><span>歌曲</span><strong>"+data.list[i].songs+"</strong></a>";
						str+="<a style='background-color: #535B5E' href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><span>试听</span><strong>"+data.list[i].tryListening+"<em>万</em></strong></a>";
						str+="</div></li>";
					}
					str+="</ul >";
					str+="</div>";
			}
			str1+="<a>当前页为"+data.pageNum+"</a>"
			str1+="<a href='javascript:page("+(data.hasPreviousPage?data.prePage:data.pageNum)+")'>上一页</a>";
			if(data.navigatepageNums[0]>1){
				str1+="<a href='javascript:page(1)'>1</a>";
				str1+="<a>...</a>";
			}
			for(var i=0;i<data.navigatepageNums.length;i++){
				str1+="<a href='javascript:page("+data.navigatepageNums[i]+")'>"+data.navigatepageNums[i]+"</a>"
			}
			if(data.navigatepageNums[4]<data.pages){
				str1+="<a>...</a>";
				str1+="<a href='javascript:page("+data.pages+")'>"+data.pages+"</a>"
			}
			str1+="<a href='javascript:page("+(data.hasNextPage?data.nextPage:data.pageNum)+")'>下一页</a>";
				$("#songer").html(str);
				$("#pageSonger").html(str1)
		}
	})
})
function page(pageIndex){
	$.ajax({
		type:'get',
		url:'/musicClassify/queryAll',
		data:{pageIndex:pageIndex},
		success:function(data){
			var str1 = "";
			var sum = 0;
			var str = "";		
			sum = Math.ceil(data.list.length/4) ;
			for(var j=0;j<sum;j++){
				if(j!=0){
					str+="<div class='new_songs new_common' style='margin-top:-20px;'>";	
				}else {
					str+="<div class='new_songs new_common'>";
				}
				 str += "<ul class='show'>";
				var s = ((j+1)*4>data.list.length)?data.list.length:(j+1)*4;
				 for(var i=j*4;i<s;i++){
						str+="<li class='albumBox'>";
						str+="<div class='album' style='background-color: #535B5E'><p>";
						str+="<a href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><img width='220' height='220' src='../../source/pic/album1-220x220.jpg' class='attachment-220x220 wp-post-image' alt='"+data.list[i].sname+"' /> " ;
						str+=		"<span><em>"+data.list[i].sname+"</em></span></a></p>";
						str+="<a style='background-color: #535B5E' href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><span>歌曲</span><strong>"+data.list[i].songs+"</strong></a>";
						str+="<a style='background-color: #535B5E' href='/searchBySname?sname="+encodeURI(encodeURI(data.list[i].sname))+"'><span>试听</span><strong>"+data.list[i].tryListening+"<em>万</em></strong></a>";
						str+="</div></li>";
					}
					str+="</ul >";
					str+="</div>";
			}
			str1+="<a>当前页为"+data.pageNum+"</a>"
			str1+="<a href='javascript:page("+(data.hasPreviousPage?data.prePage:data.pageNum)+")'>上一页</a>";
			if(data.navigatepageNums[0]>1){
				str1+="<a href='javascript:page(1)'>1</a>";
				str1+="<a>...</a>";
			}
			for(var i=0;i<data.navigatepageNums.length;i++){
				str1+="<a href='javascript:page("+data.navigatepageNums[i]+")'>"+data.navigatepageNums[i]+"</a>"
			}
			if(data.navigatepageNums[4]<data.pages){
				str1+="<a>...</a>";
				str1+="<a href='javascript:page("+data.pages+")'>"+data.pages+"</a>"
			}
			str1+="<a href='javascript:page("+(data.hasNextPage?data.nextPage:data.pageNum)+")'>下一页</a>";
				$("#songer").html(str);
				$("#pageSonger").html(str1)
			
		}
	})	
}
function choose(cid,pageIndex){
	$.ajax({
		type:'get',
		url:'/musicClassify/queryByCid',
		data:{cid:cid,pageIndex:pageIndex},
		success:function(data){
			var str1 = "";
			var sum = 0;
			var str = "";		
			sum = Math.ceil(data.list.length/4) ;
			for(var j=0;j<sum;j++){
				if(j!=0){
					str+="<div class='new_songs new_common' style='margin-top:-20px;'>";	
				}else {
					str+="<div class='new_songs new_common'>";
				}
				 str += "<ul class='show'>";
				var s = ((j+1)*4>data.list.length)?data.list.length:(j+1)*4;
				 for(var i=j*4;i<s;i++){
						str+="<li class='albumBox'>";
						str+="<div class='album' style='background-color: #535B5E'><p>";
						str+="<a href='/play?id="+data.list[i].mid+"'><img width='220' height='220' src='"+data.list[i].image+"' class='attachment-220x220 wp-post-image' alt='"+data.list[i].sname+"' /> " ;
						str+=		"<span><em>"+data.list[i].mname+"</em></span></a></p>";
						str+="<a style='background-color: #535B5E' href='?menuid="+menuid+"'><span>歌曲</span><strong>"+data.list[i].sname+"</strong></a>";
						str+="<a style='background-color: #535B5E' href='/play?id="+data.list[i].mid+"'><span>试听</span><strong>"+data.list[i].playsum+"<em>万</em></strong></a>";
						str+="</div></li>";
					}
					str+="</ul >";
					str+="</div>";
			}
				
			str1+="<a>当前页为"+data.pageNum+"</a>"
			str1+="<a href='javascript:choose("+cid+","+(data.hasPreviousPage?data.prePage:data.pageNum)+")'>上一页</a>";
			if(data.navigatepageNums[0]>1){
				str1+="<a href='javascript:choose("+cid+",1)'>1</a>";
				str1+="<a>...</a>";
			}
			for(var i=0;i<data.navigatepageNums.length;i++){
				str1+="<a href='javascript:choose("+cid+","+data.navigatepageNums[i]+")'>"+data.navigatepageNums[i]+"</a>"
			}
			if(data.navigatepageNums[4]<data.pages){
				str1+="<a>...</a>";
				str1+="<a href='javascript:choose("+cid+","+data.pages+")'>"+data.pages+"</a>"
			}
			str1+="<a href='javascript:choose("+cid+","+(data.hasNextPage?data.nextPage:data.pageNum)+")'>下一页</a>";
				$("#songer").html(str);
				$("#pageSonger").html(str1)
			
		}
	})
}

