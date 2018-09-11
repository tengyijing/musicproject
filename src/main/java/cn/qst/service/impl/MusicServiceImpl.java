package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMusicMapper;
import cn.qst.mapper.TbMusic_MusicListMapper;
import cn.qst.pojo.TbMusic;
import cn.qst.service.MusicService;

@Service
public class MusicServiceImpl implements MusicService {
	
	@Autowired
	private TbMusicMapper tbMusicMapper;
	
	private TbMusic_MusicListMapper tbMusic_MusicListMapper;
	
	@Override
	public List<TbMusic> selectByMusicList(int id) {
		return tbMusicMapper.selectByLid(id);
	}

	@Override
	public TbMusic selectByPrimaryKey(int mid) {
		return tbMusicMapper.selectByPrimaryKey(mid);
	}

	@Override
	public boolean addMusicToMusicList(int mlid, int mid) {
		return tbMusic_MusicListMapper.save(mlid, mid)==1;
	}

	@Override
	public boolean deleteMusicFromMusicList(int mlid, int mid) {
		return tbMusic_MusicListMapper.delete(mlid, mid)==1;
	}
	
}
