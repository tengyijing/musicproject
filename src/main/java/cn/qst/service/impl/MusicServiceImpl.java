package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMusicMapper;
import cn.qst.pojo.TbMusic;
import cn.qst.service.MusicService;

@Service
public class MusicServiceImpl implements MusicService {
	
	@Autowired
	private TbMusicMapper tbMusicMapper;
	
	@Override
	public List<TbMusic> selectByMusicList(String id) {
		return null;
	}

}
