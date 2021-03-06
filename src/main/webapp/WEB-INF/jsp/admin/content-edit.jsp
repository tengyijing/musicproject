<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/adminstyle/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="contentEditForm" class="itemForm" method="post">
		<input type="hidden" name="id"/>
	    <table cellpadding="5">
	        <tr>
	            <td>音乐id:</td>
	            <td><input class="easyui-textbox" type="text" name="musicid"  style="width: 180px;"></input></td>
	        </tr>
	        <tr>
	            <td>内容标题:</td>
	            <td><input class="easyui-textbox" type="text" name="title"  style="width: 180px;"></input></td>
	        </tr>
	        <tr>
	            <td>歌手名:</td>
	            <td><input class="easyui-textbox" type="text" name="sname"  style="width: 180px;"></input></td>
	        </tr>
	        <tr>
	            <td>播放量:</td>
	            <td><input class="easyui-textbox" name="playsum"  style="width: 180px;"></input>
	            </td>
	        </tr>
	        <tr>
	            <td>展示图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">更新图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentEditPage.submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="contentEditPage.clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
$(function(){
	contentEditEditor = TAOTAO.createEditor("#contentEditForm [name=desc]");
});

var contentEditPage = {
		submitForm : function(){
			if(!$('#contentEditForm').form('validate')){
				$.messager.alert('提示','表单还未填写完成!');
				return ;
			}
			$.post("/content/edit",$("#contentEditForm").serialize(), function(data){
				if(data.status == 200){
					$.messager.alert('提示','修改内容成功!');
					$("#contentList").datagrid("reload");
					//TT.closeCurrentWindow();
				}
			});
		},
		clearForm : function(){
			
		}
};
</script>