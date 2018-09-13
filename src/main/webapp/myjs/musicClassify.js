$(function() {
	$.ajax({
		type : 'get',
		url : '/admin/queryMcategoryAll',
		success : function(data) {
			var str = "<h1 style='font-size:30px'>全部</h1>"
			for (var i = 0; i < data.length; i++) {
				str+="<dl class='mod-tags1' style='clear:both;'>";
				if (data[i].parentid == 0) {
					str += "<dt>" + data[i].cname + "</dt>";
					var j = i + 1;
					while (j < data.length) {
						if (data[j].parentid != 0) {
							str += "<dd><a href='javascript:choose("+data[j].cid+")'>" + data[j].cname + "</a></dd>";
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
			alert(data.pageNum)
			var str1 = "";
			var str = "<ul class='show'>";
			for(var i=0;i<data.list.length;i++){
				str+="<li class='albumBox'>";
				str+="<div class='album' style='background-color: #535B5E'><p>";
				str+="<a href='?menuid="+menuid+"'><img width='220' height='220' src='../../source/pic/album1-220x220.jpg' class='attachment-220x220 wp-post-image' alt='"+data.list[i].sname+"' /> " ;
				str+=		"<span><em>"+data.list[i].sname+"</em></span></a></p>";
				str+="<a style='background-color: #535B5E' href='?menuid="+menuid+"'><span>歌曲</span><strong>"+data.list[i].songs+"</strong></a>";
				str+="<a style='background-color: #535B5E' href='?menuid="+menuid+"'><span>试听</span><strong>"+data.list[i].tryListening+"<em>万</em></strong></a>";
				str+="</div></li>";
			}
			str+="</ul >";
			str1+="<a >上一页</a>";
			if(data.pageNum==data.firstPage){
				for(var i=data.firstPage;i<data.firstPage+5;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				if(data.pageNum+4<data.lastPage){
					str1+="<a>...</a>";
					str1+="<a>"+data.lastPage+"</a>";
				}
			}else if(data.pageNum-1==data.firstPage){
				for(var i=data.firstPage;i<data.pageNum;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				for(var i=data.pageNum;i<data.pageNum+4;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				if(data.pageNum+3<data.lastPage){
					str1+="<a>...</a>";
					str1+="<a>"+data.lastPage+"</a>";
				}
			}else if(data.pageNum-2==data.firstPage){
				for(var i=data.firstPage;i<data.pageNum;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				for(var i=data.pageNum;idata.pageNum+3;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				if(data.pageNum+3<data.lastPage){
					str1+="<a>...</a>";
					str1+="<a>"+data.lastPage+"</a>";
				}
			}else if(data.pageNum==data.lastPage){
				if(data.pageNum-4>data.firstPage){	
					str1+="<a>"+data.firstPage+"</a>";
					str1+="<a>...</a>";
				}
				for(var i=data.pageNum-4;i<=data.lastPage;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				
			}else if(data.pageNum==data.lastPage-1){
				if(data.pageNum-3>data.firstPage){
					
					str1+="<a>"+data.firstPage+"</a>";
					str1+="<a>...</a>";
				}
				for(var i=data.pageNum;i<=data.lastPage;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				for(var i=data.pageNum-3;i<data.pageNum;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				
				
			}else if(data.pageNum==data.lastPage-2){
				if(data.pageNum-2>data.firstPage){
					
					str1+="<a>"+data.firstPage+"</a>";
					str1+="<a>...</a>";
				}
				for(var i=data.pageNum-2;i<data.pageNum;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				for(var i=data.pageNum;i<=data.lastPage;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				
			}else{
				if(data.pageNum-2>data.firstPage){
					str1+="<a>"+data.firstPage+"</a>";
					str1+="<a>...</a>";
				}
				for(var i=data.pageNum-2;i<data.pageNum;i++){
					if(i>=data.firstPage){
						str1+="<a>"+i+"</a>";
					}
				}
				for(var i=data.pageNum;i<data.pageNum+2;i++){
					if(i<=data.lastPage){
						str1+="<a>"+i+"</a>";
					}
				}
				if(data.pageNum+2<data.lastPage){
					str1+="<a>...</a>";
					str1+="<a>"+data.lastPage+"</a>";
				}
			}
			str1+="<a>下一页</a>";
				$("#songer").html(str);
				$("#pageSonger").html(str1)
		}
	})
})
