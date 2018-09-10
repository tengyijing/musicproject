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
import cn.qst.service.MusicService;
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
	@Autowired
	private MusicService musicService;
	private List<TbMusic> historyList;
	
	// 跳转到音乐播放
	@RequestMapping("/play")
	public String playPage(ModelMap map, HttpSession session, String type) {
		// TbUser user = (TbUser) session.getAttribute("user");
		TbUser user = new TbUser();
		user.setUid("1");
		
		// 查询用户歌单
		List<TbMusiclist> musiclists = musiclistService.selectByUid(user.getUid());
		map.addAttribute("musicList", musiclists);
		
		// 显示的歌曲列表
		List<TbMusic> musics = null;
		if( type == null || "now".equals(type) ) { // 默认正在播放
			musics = musicService.selectByMusicList("");
		} else if( "history".equals(type) ) { // 历史播放
			musics = historyList;
		} else if( "myLove".equals(type) ) { // 我喜欢的音乐
			musics = null;
		} else { // 根据歌单id查找对应的歌曲
			musics = musicService.selectByMusicList(type);
		}
		map.addAttribute("songs", musics);
		
		return "playMusic";
	}
	
	
	// 音乐播放
	public String playMusic(ModelMap map) {
		/*
		 * 1、根据音乐id查找对应的音乐以及歌词
		 * 2、将音乐添加到播放历史歌单当中
		 */
		return null;
	}
	
	// 歌单创建请求
	
	// 歌单删除请求
	
	// 歌单修改请求
	

	public void setHistoryList(List<TbMusic> historyList) {
		this.historyList = historyList;
	}
}
