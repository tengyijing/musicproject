<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<table class="easyui-datagrid" id="itemList" title="音乐列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/music/list',method:'get',pageSize:20,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'mid',width:60">音乐ID</th>
            <th data-options="field:'mname',width:200">音乐名</th>
            <th data-options="field:'sname',width:100">歌手</th>
            <th data-options="field:'uploaddate',width:130,align:'center',formatter:TAOTAO.formatDateTime">上传时间</th>
            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatItemStatus">状态</th>
        </tr>
    </thead>
</table>
<div id="itemEditWindow" class="easyui-window" title="编辑音乐" data-options="modal:true,closed:true,iconCls:'icon-save',href:'/admin/music-edit'" style="width:80%;height:80%;padding:10px;">
</div>
<div id="itemsearchWindow" class="easyui-window" title="搜索音乐" data-options="modal:true,closed:true,iconCls:'icon-search',href:'/admin/music-search'" style="width:40%;height:40%;padding:5px;">
</div>
<script>

    function getSelectionsIds(){
    	var itemList = $("#itemList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].mid);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'新增',
        iconCls:'icon-add',
        handler:function(){
        	$(".tree-title:contains('新增音乐')").parent().click();
        }
    },{
        text:'编辑',
        iconCls:'icon-edit',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','必须选择一首音乐才能编辑!');
        		return ;
        	}
        	if(ids.indexOf(',') > 0){
        		$.messager.alert('提示','只能选择一首商品!');
        		return ;
        	}
        	
        	$("#itemEditWindow").window({
        		onLoad :function(){
        			//回显数据
        			var data = $("#itemList").datagrid("getSelections")[0];
        			$("#itemeEditForm").form("load",data);
        			TAOTAO.init({
        				"image" : data.image,
        				"mid" : data.mid,
        			});
        		}
        	}).window("open");
        }
    },{
        text:'删除',
        iconCls:'icon-cancel',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中音乐!');
        		return ;
        	}
        	$.messager.confirm('确认','确定删除ID为 '+ids+' 的音乐吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/music/delete",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','删除音乐成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },'-',{
        text:'下线',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中音乐!');
        		return ;
        	}
        	$.messager.confirm('确认','确定下线ID为 '+ids+' 的音乐吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/item/instock",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','下线音乐成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },{
        text:'上线',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中音乐!');
        		return ;
        	}
        	$.messager.confirm('确认','确定上线ID为 '+ids+' 的音乐吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids};
                	$.post("/music/reshelf",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','上线成功!',undefined,function(){
            					$("#itemList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },'-',{
    	 id:'search', 
         text:'搜索', 
         iconCls:'icon-search',
         handler:function(){
        	 $("#itemsearchWindow").window({
          		onLoad :function(){
          			
          		}
          	}).window("open")
         }
    }];
</script>