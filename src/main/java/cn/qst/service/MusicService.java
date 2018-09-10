package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbMusic;

/**
 * 
 * @author Asimple
 * @date 2018年9月8日
 * @Description 歌曲服务层
 */

public interface MusicService {
	List<TbMusic> selectByMusicList(int id);
}
