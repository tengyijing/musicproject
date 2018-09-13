package cn.qst.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;


import cn.qst.pojo.AlbumResult;
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
	public PageInfo<AlbumResult> queryAll() {
		/*EasyUiDataGridResult fundSnameAll = musicClassifyService.fundSnameAll(1, 4);*/
		PageInfo<AlbumResult> pageInfo = musicClassifyService.fundSnameAll(7,1);
		return pageInfo;
	}
}
