package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbMcategory;

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
	public List<TbMcategory> mcategories(Integer pid);
	
}
