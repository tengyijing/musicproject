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

function choose(ab){
	alert(ab)
	alert("123")
}
