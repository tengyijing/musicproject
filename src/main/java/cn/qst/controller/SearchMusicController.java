package cn.qst.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.qst.pojo.TbMenu;
import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbMusic;
import cn.qst.service.MenuService;
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
	/**
	 * 针对搜索框的内容体现
	 * @param musicName
	 * @param request
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public Map<String,Object> searchMusic(String musicName,HttpServletRequest request){
		Map<String, Object> searcherByStr = null;
		if(!musicName.equals("")) {
			searcherByStr = seacherMusicService.searcherByStr(musicName);
		}else {
			List<TbMenuContent> list = (List<TbMenuContent>)request.getSession().getAttribute("hot");
			for(TbMenuContent tbMenuContent:list) {
				System.out.println(tbMenuContent);
			}
			searcherByStr = new HashMap<>();
			searcherByStr.put("song", list);
		}	
		return searcherByStr;
	}	
	
	
	@RequestMapping(value = "/seacher",method=RequestMethod.POST)
	public String serachMusic(String musicName,Map<String, Object>map) {
		List<TbMenu> queryByParent = menuService.queryByParent(12);
		map.put("TbMenu", queryByParent);
			Map<String, Object> map2 = seacherMusicService.searcherByStr(musicName);
			map.put("song", map2);	
		return "searchMusic";
		
	}
}
