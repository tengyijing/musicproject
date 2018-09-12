package cn.qst.service;

import java.util.List;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.pojo.TbMusic;

/**
 * 
 * @author Asimple
 * @date 2018年9月8日
 * @Description 歌曲服务层
 */

public interface MusicService {
	List<TbMusic> selectByMusicList(int id);
	
	TbMusic selectByPrimaryKey(int mid);
	
	//添加音乐
	AdminResult addMusic(TbMusic music);
	
	// 添加音乐到歌单
	boolean addMusicToMusicList(int mlid, int mid);
	// 从歌单中删除音乐
	boolean deleteMusicFromMusicList(int mlid, int mid);
	//查询所有音乐并分页显示
	EasyUiDataGridResult fundMusicAll(int page , int rows , TbMusic music);
	//修改音乐
	AdminResult updateMusic(TbMusic music);
	//删除音乐
	AdminResult deleteMusic(List<Integer> idList);
	//修改音乐的上线下线状态
	AdminResult updateMusicStatus(List<Integer> idList , boolean status);
}
