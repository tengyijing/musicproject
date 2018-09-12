<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/adminstyle/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemesearchForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>音乐名:</td>
	            <td><input class="easyui-textbox" type="text" name="mname"  style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>歌手:</td>
	            <td><input class="easyui-textbox" type="text" name="sname"  style="width: 280px;"></input></td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">	
	function submitForm(){
		$.post("/music/list",$("#itemesearchForm").serialize(), function(data){
				$("#itemList").datagrid("loadData",data);
				$("#itemsearchWindow").window('close');
		});
	}
</script>
