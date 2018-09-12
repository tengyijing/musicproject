package cn.qst.service;

import java.util.List;


import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.pojo.AlbumResult;
import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMusic;

/**
 * 音乐分类
 * @author daihong
 *
 */

public interface MusicClassifyService {

	/**
	 * 
	 * 各级的分类音乐情况
	 * @return 每层的分类
	 */
	 List<TbMcategory> mcategories(Integer pid);
	
	 

	 
	
	/**
	 * 对所有歌手进行分页处理
	 */
	EasyUiDataGridResult fundSnameAll(int page , int rows);
}
