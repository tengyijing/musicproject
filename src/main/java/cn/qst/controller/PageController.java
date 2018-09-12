package cn.qst.controller;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 处理jsp页面请求
 * @author Administrator
 *
 */
@Controller
public class PageController {
	
	//主页跳转
	@RequestMapping("/")
	public String indexJsp() {
		return "index";
	}
	
	//页面跳转
	@RequestMapping("/{page}")
	public String pageJsp(String page,Integer menuid,Map<String, Object>map) {
		map.put("menuid", menuid);
		return page;
	}
	
	//后台主页跳转
	@RequestMapping("/admin")
	public String adminIndexJsp() {
			return "admin/index";
	}
		
	//后台其他页面
	//页面跳转
	@RequestMapping("/admin/{page}")
	public String pageJsp(@PathVariable String page) {
			return "admin/"+page;
	}
}