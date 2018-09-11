package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMcategoryMapper;
import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMcategoryExample;
import cn.qst.pojo.TbMcategoryExample.Criteria;
import cn.qst.service.MusicClassifyService;

@Service
public class MusicClassifyServiceImpl implements MusicClassifyService{

	@Autowired
	private TbMcategoryMapper mcategoryMapper;
	@Override
	public List<TbMcategory> mcategories(Integer pid) {
		// TODO Auto-generated method stub
		TbMcategoryExample example = new TbMcategoryExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentidEqualTo(pid);
		return mcategoryMapper.selectByExample(example);
	}

}
