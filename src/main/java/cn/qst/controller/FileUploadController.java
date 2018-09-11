package cn.qst.controller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.qst.comman.fastdfs.FileUploadUtils;
import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.utils.JsonUtils;

@Controller
public class FileUploadController {
	
	//上传文件的url地址
	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;
	
	//文件上传
	@RequestMapping("/file/upload")
	@ResponseBody
	public String picUpload(MultipartFile uploadFile) {
		try {
			//上传文件获取服务器相对路径
			String path = FileUploadUtils.fileUpload(uploadFile);
			//拼接文件服务器的url(将ip地址带上得到一个完整的网络路径)
			String url = IMAGE_SERVER_URL + path;
			Map result = new HashMap();
			result.put("error", 0);
			result.put("url", url);
			return JsonUtils.objectToJson(result);
		} catch (Exception e) {
			e.printStackTrace();
			Map result = new HashMap();
			result.put("error", 1);
			result.put("massege", "上传失败");
			return JsonUtils.objectToJson(result);
		}
	}
}
