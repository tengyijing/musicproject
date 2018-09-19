package cn.qst.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.mapper.AlbumResultMapper;
import cn.qst.mapper.TbMcategoryMapper;
import cn.qst.mapper.TbMenuContentMapper;
import cn.qst.mapper.TbMenuMapper;
import cn.qst.mapper.TbMusicMapper;
import cn.qst.pojo.AlbumResult;
import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMcategoryExample;
import cn.qst.pojo.TbMcategoryExample.Criteria;
import cn.qst.pojo.TbMenu;
import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbMenuContentExample;
import cn.qst.pojo.TbMenuExample;
import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusicExample;
import cn.qst.service.MusicClassifyService;

/**
 * 音乐分类
 * @author daihong
 *
 */
@Service
public class MusicClassifyServiceImpl implements MusicClassifyService{

	@Autowired
	private TbMcategoryMapper mcategoryMapper;	
	
	@Autowired
	private AlbumResultMapper albumResult;
	
	@Autowired
	private TbMusicMapper musicMapper;
	
	@Autowired
	private TbMenuMapper menuMapper;
	
	@Autowired
	private TbMenuContentMapper menuContentMapper;
	
	@Override
	public List<TbMcategory> mcategories(Integer pid) {
		// TODO Auto-generated method stub
		TbMcategoryExample example = new TbMcategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentidEqualTo(pid);
		return mcategoryMapper.selectByExample(example);
	}



	@Override
	public PageInfo<AlbumResult> fundSnameAll(int page, int rows) {
		// TODO Auto-generated method stub
		PageHelper.startPage(page, rows);
		//将查询到的歌手都封装到一个集合中
		List<AlbumResult> queryAll = albumResult.queryAll();
		PageInfo<AlbumResult> info = new PageInfo<>(queryAll,5);
		return info;
	}



	@Override
	public PageInfo<TbMusic> fundQuery(Integer page,Integer rows,Integer cid) {
		// TODO Auto-generated method stub
		List<Integer> query = musicMapper.selectByCid(cid);
		PageHelper.startPage(page,rows);	
		TbMusicExample example = new TbMusicExample();
		cn.qst.pojo.TbMusicExample.Criteria criteria = example.createCriteria();
		criteria.andMidIn(query);
		List<TbMusic> tbMusics = musicMapper.selectByExample(example);
			PageInfo<TbMusic> info = new PageInfo<>(tbMusics,5);
			return info;	
	}



	@Override
	public List<TbMenuContent> queryRank(Integer mid) {
		// TODO Auto-generated method stub
			TbMenuContentExample tbMenuContentExample = new TbMenuContentExample();
			cn.qst.pojo.TbMenuContentExample.Criteria criteria = tbMenuContentExample.createCriteria();
			criteria.andMidEqualTo(mid);
			List<TbMenuContent> selectByExample = menuContentMapper.selectByExample(tbMenuContentExample);
			return selectByExample;				
	}



	@Override
	public List<TbMusic> queryBySname(String sname) {
		
		// TODO Auto-generated method stub
		TbMusicExample example = new TbMusicExample();
		cn.qst.pojo.TbMusicExample.Criteria criteria = example.createCriteria();
		criteria.andSnameEqualTo(sname);
		List<TbMusic> selectByExample = musicMapper.selectByExample(example);
		return selectByExample;
	}

}
