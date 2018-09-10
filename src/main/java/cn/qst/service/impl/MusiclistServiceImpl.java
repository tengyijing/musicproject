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
		return null;
	}

	
	
	public void setMusicListDao(TbMusiclistMapper musicListDao) {
		this.musicListDao = musicListDao;
	}



	@Override
	public boolean deleteById(int mlid) {
		return musicListDao.deleteByPrimaryKey(mlid)==1;
	}



	@Override
	public boolean update(TbMusiclist musiclist) {
		// TODO Auto-generated method stub
		return false;
	}



	@Override
	public boolean save(TbMusiclist musiclist) {
		// TODO Auto-generated method stub
		return false;
	}

}
