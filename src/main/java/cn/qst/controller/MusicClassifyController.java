package cn.qst.controller;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.config.ListFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.pojo.TbMusic;
import cn.qst.service.MusicClassifyService;
import cn.qst.service.MusicService;

/**
 * 对音乐进行详细分类
 * 
 * @author daihong
 *
 */
@Controller
public class MusicClassifyController {
	@Autowired
	private MusicClassifyService musicClassifyService;

	@Autowired
	private MusicService musicService;

	/**
	 * 把歌曲按照歌手分类
	 * 
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/musicClassify/queryAll")
	public EasyUiDataGridResult queryAll() {
		EasyUiDataGridResult fundSnameAll = musicClassifyService.fundSnameAll(1, 1);
		return fundSnameAll;
	}
}
