package cn.qst.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	// 跳转到音乐详情
	@RequestMapping("/music/detail")
	public String musicDetailPage(String mid) {
		return null;
	}
	
	//添加音乐
	@RequestMapping("/music/addmusic")
	@ResponseBody
	public AdminResult addMusic(TbMusic music) {
			return musicService.addMusic(music);
	}
	
	//查询音乐分页显示
	@RequestMapping("/music/list")
	@ResponseBody
	public EasyUiDataGridResult fundMusicAll( Integer page , Integer rows , TbMusic music) {
		if(page==null) {
			page=1;
		}
		if(rows==null) {
			rows=20;
		}
		EasyUiDataGridResult result = musicService.fundMusicAll(page , rows, music);
		return result;
	}
	
	//修改音乐
	@RequestMapping("/music/update")
	@ResponseBody
	public AdminResult updateMusic(TbMusic music) {
		AdminResult result = musicService.updateMusic(music);
		return result;
	}
	
	//删除音乐
	@RequestMapping("/music/delete")
	@ResponseBody
	public AdminResult deleteMusic(String ids) {
		//转换id类型
		List<Integer> idList = this.strIdtoInt(ids);
		AdminResult result = musicService.deleteMusic(idList);
		return result;
	}
	
	//下线音乐
	@RequestMapping("/item/instock")
	@ResponseBody
	public AdminResult musicInstock(String ids) {
		//转换id
		List<Integer> idList = this.strIdtoInt(ids);
		AdminResult result = musicService.updateMusicStatus(idList, false);
		return result;
	}
	
	//上线音乐
	@RequestMapping("/music/reshelf")
	@ResponseBody
	public AdminResult musicReshelf(String ids) {
		//转换id
		List<Integer> idList = this.strIdtoInt(ids);
		AdminResult result = musicService.updateMusicStatus(idList, true);
		return result;
	}
	
	//id转换器
	private List<Integer> strIdtoInt(String ids){
		//使用,进行分割
		String[] str = ids.split(",");
		List<Integer> idList = new ArrayList<>();
		for (String id : str) {
			idList.add(Integer.parseInt(id));
		}
		return idList;
	}
}
