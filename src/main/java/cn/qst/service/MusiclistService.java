package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbMusiclist;

public interface MusiclistService {
	List<TbMusiclist> selectByUid(String uid);
}
