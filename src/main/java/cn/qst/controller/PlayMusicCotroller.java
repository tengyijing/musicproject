package cn.qst.controller;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.qst.comman.utils.DownloadLyric;
import cn.qst.comman.utils.JsonUtils;
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
		
		/*--------删除开始-----------*/
		TbUser user = new TbUser();
		user.setUid("1");
		/*--------删除结束-----------*/
		
		// 查询用户歌单
		List<TbMusiclist> musiclists = musiclistService.selectByUid(user.getUid());
		map.addAttribute("musicList", musiclists);
		
		// 显示的歌曲列表
		List<TbMusic> musics = null;
		if( type == null || "now".equals(type) ) { // 默认正在播放
			musics = musicService.selectByMusicList(-1);
		} else if( "history".equals(type) ) { // 历史播放
			musics = historyList;
		} else if( "myLove".equals(type) ) { // 我喜欢的音乐
			musics = null;
		} else { // 根据歌单id查找对应的歌曲
			musics = musicService.selectByMusicList(Integer.parseInt(type));
		}
		map.addAttribute("songs", musics);
		
		return "playMusic";
	}

	// 音乐播放
	public String playMusic(ModelMap map, int mid) {
		/*
		 * 1、根据音乐id查找对应的音乐以及歌词
		 * 2、将音乐添加到播放历史歌单当中
		 * 3、返回json数据
		 */
		mid = 1;
		TbMusic music = musicService.selectByPrimaryKey(mid);
		map.addAttribute("music", music);
		
		// 将当前播放的音乐放入历史播放歌单当中
		if( historyList == null ) {
			historyList = new ArrayList<>();
		}
		historyList.add(music);
		return null;
	}

	// 歌词获取
	@RequestMapping(value = "/getLy", method = { RequestMethod.POST })
	@ResponseBody
	public String getLrc(String url, String songName, String singerName, String id) {
		/*
		 * 传入url，如果有url就直接获取url的内容
		 * 如果没有url，则从网络中抓取相关歌词
		 */
		if( url == null || "".equals(url.trim()) ) {// 没有url信息
			String lrc = DownloadLyric.startDownload(songName, singerName);
			Map<String, Object> res = new HashMap<String, Object>();
			res.put("lrc", lrc);
			return JsonUtils.objectToJson(res);
		} else { // 含有url地址
			// 读取url地址，返回字符串
			String lrc = "";
			Map<String, Object> res = new HashMap<String, Object>();
			res.put("lrc", lrc);
			return JsonUtils.objectToJson(res);
		}
	}
	
	// 歌单创建请求
	@RequestMapping(value = "/addMusicList", method = { RequestMethod.POST})
	@ResponseBody
	public String createList(String musicListName, HttpSession session, String s) {
		// 创建返回对象
		Map<String, Object> result = new HashMap<>();
		// 获取创建歌单的用户
		TbUser user = (TbUser) session.getAttribute("user");
		
		/*--------删除开始-----------*/
		if( user == null ) user = new TbUser();
		user.setUid("1");
		/*--------删除结束-----------*/
		
		if( "v".equalsIgnoreCase(s.trim()) ) { // 验证名字是否存在 falg=true为不存在
			boolean flag = musiclistService.selectByNameAndUid(musicListName, user.getUid())==null;
			String r = flag==true?"true":"false";
			result.put("flag", r);
		} else if( "w".equalsIgnoreCase(s.trim()) ){
			/*
			 * 创建歌单实体对象
			 * 	设置名称
			 * 	设置图片为默认图片
			 * 	设置创建时间
			 * 	设置创建人id
			 */
			TbMusiclist musiclist = new TbMusiclist();
			musiclist.setName(musicListName);
			musiclist.setUid(user.getUid());
			musiclist.setCreatedate(new Date());
			// 设置默认图片
			musiclist.setImage("1");
			
			// 保存歌单实体对象
			boolean flag = musiclistService.save(musiclist);
			if( flag ) {
				musiclist = musiclistService.selectByNameAndUid(musicListName, user.getUid());
				result.put("mlid", musiclist.getMlid());
			}
		}
		return JsonUtils.objectToJson(result);
	}
	
	// 歌单删除请求
	@RequestMapping(value = "deletMusicList", method = { RequestMethod.POST })
	@ResponseBody
	public String deletMusicList(String musicListId) {
		if( musicListId == null ) return null;
		int mlid = Integer.parseInt(musicListId);
		boolean flag = musiclistService.deleteById(mlid);
		if( !flag ) return null;
		return JsonUtils.objectToJson("1");
	}
	

	public void setHistoryList(List<TbMusic> historyList) {
		this.historyList = historyList;
	}
}
