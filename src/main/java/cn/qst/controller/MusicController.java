package cn.qst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cn.qst.comman.fastdfs.FileUploadUtils;
import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.pojo.TbMusic;
import cn.qst.service.MusicService;

@Controller
public class MusicController {
	
	@Autowired
	private MusicService musicService;
	
	//上传文件urlip地址
	@Value("${IMAGE_SERVER_URL}")
	private String IMAGE_SERVER_URL;
	
	
	//添加音乐
	@RequestMapping("/music/addmusic")
	@ResponseBody
	public AdminResult addMusic(TbMusic music) {
			return musicService.addMusic(music);
	}
	
	//查询所有音乐分页显示
	@RequestMapping("/music/list")
	@ResponseBody
	public EasyUiDataGridResult fundMusicAll(int page , int rows) {	
		EasyUiDataGridResult result = musicService.fundMusicAll(page , rows);
		return result;
	}
}
