<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<table class="easyui-datagrid" id="userList" title="音乐列表" 
       data-options="singleSelect:false,collapsible:true,pagination:true,url:'/user/list',method:'get',pageSize:20,toolbar:toolbar">
    <thead>
        <tr>
        	<th data-options="field:'ck',checkbox:true"></th>
        	<th data-options="field:'uid',width:60">用户ID</th>
            <th data-options="field:'uname',width:200">用户名</th>
            <th data-options="field:'sex',width:60,align:'center',formatter:TAOTAO.formatUserSex">性别</th>
            <th data-options="field:'email',width:100">email</th>
            <th data-options="field:'phone',width:100">phone</th>
            <th data-options="field:'address',width:100">地址</th>
            <th data-options="field:'status',width:60,align:'center',formatter:TAOTAO.formatUserStatus">状态</th>
        </tr>
    </thead>
</table>
<div id="usersearchWindow" class="easyui-window" title="搜索用户" data-options="modal:true,closed:true,iconCls:'icon-search',href:'/admin/user-search'" style="width:40%;height:40%;padding:5px;">
</div>
<script>

    function getSelectionsIds(){
    	var itemList = $("#userList");
    	var sels = itemList.datagrid("getSelections");
    	var ids = [];
    	for(var i in sels){
    		ids.push(sels[i].uid);
    	}
    	ids = ids.join(",");
    	return ids;
    }
    
    var toolbar = [{
        text:'解冻',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中用户!');
        		return ;
        	}
        	$.messager.confirm('确认','确定恢复ID为 '+ids+' 的用户吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"status":"1"};
                	$.post("/user/status",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','解冻成功!',undefined,function(){
            					$("#userList").datagrid("reload");
            				});
            			}
            		});
        	    }
        	});
        }
    },{
        text:'冻结',
        iconCls:'icon-remove',
        handler:function(){
        	var ids = getSelectionsIds();
        	if(ids.length == 0){
        		$.messager.alert('提示','未选中用户!');
        		return ;
        	}
        	$.messager.confirm('确认','确定冻结ID为 '+ids+' 的用户吗？',function(r){
        	    if (r){
        	    	var params = {"ids":ids,"status":"0"};
                	$.post("/user/status",params, function(data){
            			if(data.status == 200){
            				$.messager.alert('提示','用户已冻结!',undefined,function(){
            					$("#userList").datagrid("reload");
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
        	 $("#usersearchWindow").window({
        		width:"35%",
         		height:"60%",
          		onLoad :function(){
          			
          		}
          	}).window("open")
         }
    }];
</script>