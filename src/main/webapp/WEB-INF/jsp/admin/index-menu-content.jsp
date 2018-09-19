<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="easyui-panel" title="Nested Panel" data-options="width:'100%',minHeight:500,noheader:true,border:false" style="padding:10px;">
    <div class="easyui-layout" data-options="fit:true">
        <div data-options="region:'west',split:false" style="width:250px;padding:5px">
            <ul id="contentCategoryTree" class="easyui-tree" data-options="url:'/menu/list',animate: true,method : 'GET'">
            </ul>
        </div>
        <div data-options="region:'center'" style="padding:5px">
	        <table class="easyui-datagrid" id="contentList" data-options="toolbar:contentListToolbar,singleSelect:false,collapsible:true,pagination:true,url:'/menu/content',method:'get',pageSize:10,queryParams:{mid:0}">
			    <thead>
			        <tr>
			        	<th data-options="field:'ck',checkbox:true"></th>
			        	 <th data-options="field:'id',width:40">内容id</th>
			            <th data-options="field:'musicid',width:40">音乐id</th>
			            <th data-options="field:'title',width:120">内容标题</th>
			            <th data-options="field:'playsum',width:120">播放数</th>
			            <th data-options="field:'sname',width:120">歌手名</th>
			            <th data-options="field:'image',width:50,align:'center',formatter:TAOTAO.formatUrl">图片</th>
			        </tr>
			    </thead>
			</table>
        </div>
    </div>
</div>
<script type="text/javascript">
$(function(){
	var tree = $("#contentCategoryTree");
	var datagrid = $("#contentList");
	tree.tree({
		onClick : function(node){
			if(tree.tree("isLeaf",node.target)){
				datagrid.datagrid('reload',{
					mid:node.id
		        });
			}
		}
	});
});
var contentListToolbar = [{
    text:'编辑',
    iconCls:'icon-edit',
    handler:function(){
    	var ids = TT.getSelectionsIds("#contentList");
    	if(ids.length == 0){
    		$.messager.alert('提示','必须选择一个内容才能编辑!');
    		return ;
    	}
    	if(ids.indexOf(',') > 0){
    		$.messager.alert('提示','只能选择一个内容!');
    		return ;
    	}
		TT.createWindow({
			width:"40%",
    		height:"60%",
			url : "/admin/content-edit",
			onLoad : function(){
				var data = $("#contentList").datagrid("getSelections")[0];
				$("#contentEditForm").form("load",data);
				TAOTAO.init({
    				"image" : data.image,
    				"id" : data.id,
    			});
				contentEditEditor.html(data.content);
			}
		});    	
    }
}];
</script>