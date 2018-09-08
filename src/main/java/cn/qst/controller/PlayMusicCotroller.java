package cn.qst.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusiclist;
import cn.qst.pojo.TbUser;
import cn.qst.service.MusiclistService;

/**
 * 
 * @author Asimple
 * @date 2018年9月8日
 * @Description 播放音乐请求控制器
 */

@Controller
public class PlayMusicCotroller {
	
	@Autowired
	private MusiclistService musiclistService;
	
//	@Autowired
//	private MusicService musicService;
	
	// 跳转到音乐播放
	@RequestMapping("/play")
	public String playPage(ModelMap map, HttpSession session) {
		// TbUser user = (TbUser) session.getAttribute("user");
		TbUser user = new TbUser();
		user.setUid("1");
		// 查询用户歌单
		List<TbMusiclist> musiclists = musiclistService.selectByUid(user.getUid());
		map.addAttribute("musicList", musiclists);
		
		// 显示音乐列表
		List<TbMusic> musics = null;
		map.addAttribute("songs", null);
		
		return "playMusic";
	}
	
}
