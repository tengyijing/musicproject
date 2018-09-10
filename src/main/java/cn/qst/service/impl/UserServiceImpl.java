package cn.qst.service.impl;

import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import cn.qst.pojo.TbUserExample;
import cn.qst.pojo.TbUserExample.Criteria;
import cn.qst.service.TbUserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

@Service
public class UserServiceImpl implements TbUserService {

	@Autowired
	private TbUserMapper tbUserMapper;

	/**
	 * 根据名字验证用户名是否重复
	 * 
	 * @param uname
	 *            用户名
	 * @return 查找到值即返回name，没有即返回null
	 */
	@Override
	public Boolean  selectByUname(String uname) {
		TbUserExample example = new TbUserExample();
		Criteria criteria = example.createCriteria();
		criteria.andUnameEqualTo(uname);
		// TODO Auto-generated method stub
		List<TbUser> list = tbUserMapper.selectByExample(example);
		return list!=null?true:false;
	}	
}
