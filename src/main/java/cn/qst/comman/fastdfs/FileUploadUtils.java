package cn.qst.comman.fastdfs;

import org.springframework.web.multipart.MultipartFile;

public class FileUploadUtils {
	//上传图片的url地址
	
	public static String fileUpload(MultipartFile uploadFile) throws Exception {
		//通过图片服务器的配置文件初始化文件上传客户端
		FastDFSClient fastDFSClient = new FastDFSClient("classpath:fastdfs/client.conf");
		//获取文件名
		String originalFilename = uploadFile.getOriginalFilename();
		//截取后缀
		String extName = originalFilename.substring(originalFilename.lastIndexOf(".")+1);
		//上传文件 返回一个图片路径(不带服务器的ip地址)
		String path = fastDFSClient.uploadFile(uploadFile.getBytes(), extName);
		return path;
	}
}
