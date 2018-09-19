package cn.qst.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.mapper.TbMusicMapper;
import cn.qst.mapper.TbMusic_MusicListMapper;
import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusicExample;
import cn.qst.pojo.TbMusicExample.Criteria;
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
	
	//添加音乐
	@Override
	public AdminResult addMusic(TbMusic music) {
		//补全属性
		Date date = new Date();
		music.setUploaddate(date);
		tbMusicMapper.insertSelective(music);
		return AdminResult.ok();
	}

	//查询音乐并分页显示page 当前页面 rows页面显示多少数据
	@Override  
	public EasyUiDataGridResult fundMusicAll(int page , int rows , TbMusic music) {
		//初始化分页插件
		PageHelper.startPage(page, rows);
		//查询数据
		TbMusicExample example = new TbMusicExample();
		Criteria criteria = example.createCriteria();
		if(music.getMname()!=null&&!music.getMname().isEmpty()) {
			criteria.andMnameLike("%"+music.getMname()+"%");
		}
		if(music.getSname()!=null&&!music.getSname().isEmpty()) {
			criteria.andSnameLike("%"+music.getSname()+"%");
		}
		List<TbMusic> list = tbMusicMapper.selectByExample(example );
		//获取分页信息
		PageInfo<TbMusic> info = new PageInfo<>(list); 
		//创建返回结果对象
		EasyUiDataGridResult result = new EasyUiDataGridResult();
		result.setRows(list);
		result.setTotal(info.getTotal());
		return result;
	}
	//修改音乐
	public AdminResult updateMusic(TbMusic music) {
		tbMusicMapper.updateByPrimaryKeySelective(music);
		return AdminResult.ok();
	}
	
	//删除音乐
	@Override
	public AdminResult deleteMusic(List<Integer> idList) {
		//删除选择的音乐
		for (Integer id : idList) {
			tbMusicMapper.deleteByPrimaryKey(id);
		}
		return AdminResult.ok();
	}
	
	//修改音乐的上线下线状态
	@Override
	public AdminResult updateMusicStatus(List<Integer> idList , boolean status) {
		for (Integer id : idList) {
			TbMusic music = new TbMusic();
			music.setMid(id);
			music.setStatus(status);
			tbMusicMapper.updateByPrimaryKeySelective(music);
		}
		return AdminResult.ok();
	}	
}
