package cn.qst.service.impl;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.mapper.AlbumResultMapper;
import cn.qst.mapper.TbMcategoryMapper;
import cn.qst.pojo.AlbumResult;
import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMcategoryExample;
import cn.qst.pojo.TbMcategoryExample.Criteria;
import cn.qst.service.MusicClassifyService;


@Service
public class MusicClassifyServiceImpl implements MusicClassifyService{

	@Autowired
	private TbMcategoryMapper mcategoryMapper;	
	
	@Autowired
	private AlbumResultMapper albumResult;
	
	
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
		List<AlbumResult> queryAll = albumResult.queryAll();
		PageInfo<AlbumResult> info = new PageInfo<>(queryAll);
		/*EasyUiDataGridResult result = new EasyUiDataGridResult();
		result.setTotal(info.getTotal());
		result.setPageInfo(info);
		result.setRows(queryAll);*/
		return info;
	}

}
