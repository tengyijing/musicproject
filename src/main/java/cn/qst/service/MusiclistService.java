package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbMusiclist;

/**
 * 
 * @author Asimple
 * @date 2018年9月8日
 * @Description 歌单服务层
 */

public interface MusiclistService {
	List<TbMusiclist> selectByUid(String uid);
}
