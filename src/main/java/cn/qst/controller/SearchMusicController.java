package cn.qst.controller;

import java.io.UnsupportedEncodingException;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.servlet.http.HttpServletRequest;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import org.springframework.web.bind.annotation.ResponseBody;


import cn.qst.pojo.TbMenu;
import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusiclist;
import cn.qst.pojo.TbUser;
import cn.qst.service.MenuService;
import cn.qst.service.MusicClassifyService;
import cn.qst.service.MusiclistService;
import cn.qst.service.SeacherMusicService;

/**
 * 音乐搜索
 * @author daihong
 *
 */
@Controller
public class SearchMusicController {
	
	@Autowired
	private SeacherMusicService seacherMusicService;
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MusiclistService musiclistService;
	
	@Autowired
	private MusicClassifyService musicClassifyService;
	
	//搜索历史
	private Set<String> historyList;
	/**
	 * 针对搜索框的内容体现	
	 * @param musicName 前台搜索内容
	 * @param request 读取session中的信息
	 */
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public Map<String,Object> searchMusic(String musicName,HttpServletRequest request){
		Map<String, Object> searcherByStr = null;
		if(!musicName.equals("")) {
			searcherByStr = seacherMusicService.searcherByStr(musicName);
		}else {
			@SuppressWarnings("unchecked")
			List<TbMenuContent> list = (List<TbMenuContent>) request.getSession().getAttribute("hot");
			for(TbMenuContent tbMenuContent:list) {
				System.out.println(tbMenuContent);
			}
			searcherByStr = new HashMap<>();
			searcherByStr.put("song", list);
		}
		searcherByStr.put("history", historyList);
		return searcherByStr;
	}	
	
	/**
	 * post提交方式跳到查询页面
	 * @param musicName 前台传回查询数据
	 * @param map 封装数据供前台读取
	 * @param request 读取session中的信息
	 * @return
	 */
	@RequestMapping(value = "/seacher",method=RequestMethod.POST)
	public String serachMusic(String musicName,ModelMap map,HttpServletRequest request) {
		System.out.println(musicName);
		//将查询结果保存成历史记录
		if(historyList==null) {
			historyList = new HashSet<>();
		}
		historyList.add(musicName);
		/**
		 * 获取菜单信息
		 */

		List<TbMenu> queryByParent = menuService.queryByParent(12);
		map.put("TbMenu", queryByParent);
			Map<String, Object> map2 = seacherMusicService.searcherByStr(musicName);
			map.put("song", map2);	
			TbUser user = (TbUser)request.getSession().getAttribute("user");
			// 查询用户歌单
			if( user != null ) {
				List<TbMusiclist> musiclists = musiclistService.selectByUid(user.getUid());
				map.put("musicList", musiclists);
			}
		return "searchMusic";
		
	}
	
	
	/**
	 * get方式跳到查询页面
	 * @param musicName 前台传回查询数据
	 * @param map 封装数据供前台读取
	 * @param request 读取session中的信息
	 * @throws UnsupportedEncodingException 转换字符编码抛出异常
	 */
	@RequestMapping( "/seacher")
	public String serachMusic1(String musicName,ModelMap map,HttpServletRequest request) throws UnsupportedEncodingException {
		String name = java.net.URLDecoder.decode(musicName,"UTF-8");
		/**
		 * 获取菜单信息
		 */
		List<TbMenu> queryByParent = menuService.queryByParent(12);
		map.put("TbMenu", queryByParent);
			Map<String, Object> map2 = seacherMusicService.searcherByStr(name);
			map.put("song", map2);	
			TbUser user = (TbUser)request.getSession().getAttribute("user");
			// 查询用户歌单
			if( user != null ) {
				List<TbMusiclist> musiclists = musiclistService.selectByUid(user.getUid());
				map.put("musicList", musiclists);
			}
		return "searchMusic";
		
	}
	
	
	/**
	 * 添加歌曲到歌单中
	 * @param mlid 读取前台歌单id
	 * @param mid 读取前台歌曲id
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/serachAdd")
	public Boolean serachAdd(Integer mid,Integer mlid) {
		Boolean addMusic = seacherMusicService.addMusic(mlid, mid);
		return addMusic;
	}
	
	/**
	 * 查询歌手的歌
	 * @throws UnsupportedEncodingException 
	 */
	@RequestMapping("/searchBySname")
	public String searchMusicBySname(String sname,ModelMap map) throws UnsupportedEncodingException {
		  String name = java.net.URLDecoder.decode(sname,"UTF-8");
		List<TbMenu> queryByParent = menuService.queryByParent(12);
		map.put("TbMenu", queryByParent);
		List<TbMusic> queryBySname = musicClassifyService.queryBySname(name);
		Map<String, Object> map2 = new HashMap<>();
		map2.put("song", queryBySname);
		map.put("song", map2);
		return "searchMusic";
	}

	public Set<String> getHistoryList() {
		return historyList;
	}

	public void setHistoryList(Set<String> historyList) {
		this.historyList = historyList;
	}
	
}
