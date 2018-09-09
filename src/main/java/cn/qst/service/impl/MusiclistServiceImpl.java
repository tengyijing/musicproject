package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMusiclistMapper;
import cn.qst.pojo.TbMusiclist;
import cn.qst.service.MusiclistService;

@Service
public class MusiclistServiceImpl implements MusiclistService {
	
	@Autowired
	private TbMusiclistMapper musicListDao;
	
	// 根据用户id查找器创建的歌单
	@Override
	public List<TbMusiclist> selectByUid(String uid) {
		return musicListDao.selectByUid(uid);
	}

	
	
	public void setMusicListDao(TbMusiclistMapper musicListDao) {
		this.musicListDao = musicListDao;
	}

}
