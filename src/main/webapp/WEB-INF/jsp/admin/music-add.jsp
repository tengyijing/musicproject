<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<link href="/js/kindeditor-4.1.10/themes/default/default.css" type="text/css" rel="stylesheet">
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/kindeditor-all-min.js"></script>
<script type="text/javascript" charset="utf-8" src="/adminstyle/js/kindeditor-4.1.10/lang/zh_CN.js"></script>
<div style="padding:10px 10px 10px 10px">
	<form id="itemAddForm" class="itemForm" method="post">
	    <table cellpadding="5">
	        <tr>
	            <td>音乐名:</td>
	            <td><input class="easyui-textbox" type="text" name="mname" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>歌手:</td>
	            <td><input class="easyui-textbox" type="text" name="sname" data-options="required:true" style="width: 280px;"></input></td>
	        </tr>
	        <tr>
	            <td>展示图片:</td>
	            <td>
	            	 <a href="javascript:void(0)" class="easyui-linkbutton picFileUpload">上传图片</a>
	                 <input type="hidden" name="image"/>
	            </td>
	        </tr>
	        <tr>
	            <td>音乐文件:</td>
	            <td>
	               <a href="javascript:void(0)" class="easyui-linkbutton musicFileUpload">上传资源文件</a>
	                 <input type="text"  name="fileurl" id="fileurl"/>
	            </td>
	        </tr>
	        
	        <tr>
	            <td>歌词文件:</td>
	            <td>
	               <a href="javascript:void(0)" class="easyui-linkbutton lyricsFileUpload">上传资源文件</a>
	                 <input type="text"  name="lyricsurl" id="lyricsurl"/>
	            </td>
	        </tr>
	    </table>
	    <input type="hidden" name="itemParams"/>
	</form>
	<div style="padding:5px">
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="submitForm()">提交</a>
	    <a href="javascript:void(0)" class="easyui-linkbutton" onclick="clearForm()">重置</a>
	</div>
</div>
<script type="text/javascript">
	var itemAddEditor ;
	//页面初始化完毕后执行此方法
	$(function(){
		//创建富文本编辑器
		itemAddEditor = TAOTAO.createEditor();
		//初始化类目选择和图片上传器
		TAOTAO.init({fun:function(node){

		}});
	});
	//提交表单
	function submitForm(){
		//有效性验证
		if(!$('#itemAddForm').form('validate')){
			$.messager.alert('提示','表单还未填写完成!');
			return ;
		}
		//ajax的post方式提交表单
		//$("#itemAddForm").serialize()将表单序列号为key-value形式的字符串
		$.post("/music/addmusic",$("#itemAddForm").serialize(), function(data){
			if(data.status == 200){
				$.messager.alert('提示','新增音乐成功!!!');
			}else{
				$.messager.alert('提示','新增音乐失败!!!');
			}
		});
	}
	
	function clearForm(){
		$('#itemAddForm').form('reset');
		itemAddEditor.html('');
	}
</script>
