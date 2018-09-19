package cn.qst.service;

import java.util.List;

import com.github.pagehelper.PageInfo;

import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.pojo.AlbumResult;
import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMenuContent;
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
	PageInfo<AlbumResult> fundSnameAll(int page , int rows);
	
	
	/**
	 * 对音乐进行分类
	 */
	PageInfo<TbMusic> fundQuery(Integer page,Integer rows,Integer cid);
	
	
	/**
	 * 对音乐进行排行
	 * @param mid
	 * @return
	 */
	List<TbMenuContent> queryRank(Integer mid);
	
	/**
	 * 根据歌手查找音乐
	 * @return
	 */
	List<TbMusic> queryBySname(String sname);
}
