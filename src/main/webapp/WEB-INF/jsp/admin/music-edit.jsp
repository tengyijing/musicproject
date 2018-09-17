<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/adminstyle/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemeEditForm" class="itemForm" method="post">
		<input type="hidden" name="mid"/>
	    <table cellpadding="5">
	         <tr>
	            <td>音乐名:</td>
	            <td><input class="easyui-textbox" type="text" name="mname" data-options="required:true" style="width: 180px;"></input></td>
	        </tr>
	        <tr>
	            <td>歌手:</td>
	            <td><input class="easyui-textbox" type="text" name="sname" data-options="required:true" style="width: 180px;"></input></td>
	        </tr>
	         <tr>
	            <td>播放量:</td>
	            <td><input class="easyui-textbox" type="text" name="playsum" data-options="required:true" style="width: 180px;"></input></td>
	        </tr>
	        <tr>
	            <td>展示图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">更新图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
	        <tr>
	            <td>音乐文件:</td>
	            <td>
	               <a href="javascript:void(0)" class="easyui-linkbutton musicFileUpload">上传音乐资源文件</a>
	                 <input type="text" name="fileurl" id="fileurl"/>
	            </td>
	        </tr>
	         <tr>
	            <td>歌词文件:</td>
	            <td>
	               <a href="javascript:void(0)" class="easyui-linkbutton lyricsFileUpload">上传歌词资源文件</a>
	                 <input type="text" name="lyricsurl" id="lyricsurl"/>
	            </td>
	        </tr>
	    </table>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	</div>
</div>
<script type="text/javascript">
	function submitForm(){
		if(!$('#itemeEditForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		$.post("/music/update",$("#itemeEditForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','修改音乐成功!','info',function(){
					$("#itemEditWindow").window('close');
					$("#itemList").datagrid("reload");
				});
			}
		});
	}
</script>
