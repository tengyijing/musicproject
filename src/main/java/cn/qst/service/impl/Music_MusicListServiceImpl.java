package cn.qst.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMusic_MusicListMapper;
import cn.qst.service.Music_MusicListService;

@Service
public class Music_MusicListServiceImpl implements Music_MusicListService {

	@Autowired
	private TbMusic_MusicListMapper music_muscilistDao;
	
	@Override
	public boolean save(int mlid, int mid) {
		return music_muscilistDao.save(mlid, mid)==1;
	}

	@Override
	public boolean del(int mlid, int mid) {
		return music_muscilistDao.delete(mlid, mid)==1;
	}

	@Override
	public int countByMlidAndMid(int mlid, int mid) {
		return music_muscilistDao.countByMlidAndMid(mlid, mid);
	}

	@Override
	public int delAll(int mlid) {
		// TODO Auto-generated method stub
		return  music_muscilistDao.delAll(mlid);
	}
}
