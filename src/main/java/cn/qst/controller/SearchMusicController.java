package cn.qst.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.qst.pojo.TbMusic;
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
	
	
	@ResponseBody
	@RequestMapping(value="/search",method=RequestMethod.POST)
	public Map<String,Object> searchMusic(String musicName){
		Map<String, Object> searcherByStr = seacherMusicService.searcherByStr(musicName);
		return searcherByStr;
	}	
}
