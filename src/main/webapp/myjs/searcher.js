function searchStr(str) {
	if(str!=""){
		$.ajax({
			type:'post',
			url:'/search',
			data:{musicName:str},
			success:function(data){
				var str = "<p style=' font-size:18px'>歌曲</p>";
				  for(var item in data["歌曲"]){
					  str+="<a href='/play?id="+data["歌曲"][item].mid+"' target='_new' class='result-item'>";
					  str+="<span class='rank'>"+(parseInt(item)+1)+"</span><span class='title'>"+data["歌曲"][item].mname+"</span>";
					  str+="<span class='num'>"+data["歌曲"][item].playsum+"万</span></a>";
				  }
				  str += "<p style=' font-size:18px' >歌手</p>";
				for(var item in data["歌手"]){
					 str+="<a href='/play?id="+data["歌手"][item]+"' target='_new' class='result-item'>";
					  str+="<span class='rank'>"+(parseInt(item)+1)+"</span><span class='title'>"+data["歌手"][item]+"</span>";
					  str+="</a>";
				}  
				$("#searchBox").html(str);
			}
		})
	}
	
	
}