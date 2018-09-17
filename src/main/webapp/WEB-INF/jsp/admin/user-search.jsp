<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/adminstyle/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="usersearchForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>用户名:</td>
	            <td><input class="easyui-textbox" type="text" name="uname"  style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>性别:</td>
	            <td>男<input type="radio" name="sex" value="0"/>
	            	女<input type="radio" name="sex" value="1"/>
	            	其他<input type="radio" name="sex" value="2"/>
	            </td>
	        </tr>
	        <tr>
	            <td>email:</td>
	            <td><input class="easyui-textbox" type="text" name="email"  style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>phone:</td>
	            <td><input class="easyui-textbox" type="text" name="phone"  style="width: 280px;"></input></td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">	
	function submitForm(){
		$.post("/user/list",$("#usersearchForm").serialize(), function(data){
				$("#userList").datagrid("loadData",data);
				$("#usersearchWindow").window('close');
		});
	}
</script>
