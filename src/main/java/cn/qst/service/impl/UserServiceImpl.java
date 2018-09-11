package cn.qst.service.impl;

import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import cn.qst.pojo.TbUserExample;
import cn.qst.pojo.TbUserExample.Criteria;
import cn.qst.service.UserService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

@Service
public class UserServiceImpl implements UserService {

	@Autowired
	private TbUserMapper tbUserMapper;
	
	/**
	 * 根据传入的用户姓名信息进行效验，是否含有重复数据
	 * 
	 * @param name 用户注册信息
	 * @return 查找到值即返回name，没有即返回null
	 */
	@Override
	public Boolean selectByName(String name) {
		// TODO Auto-generated method stub
		String returnName = tbUserMapper.selectByUname(name);
		return returnName != null ? false : true;
	}

	@Override
	public Boolean selectByPhone(String Phone) {
		// TODO Auto-generated method stub
		String returnPhone = tbUserMapper.selectByPhone(Phone);
		return returnPhone != null ? false : true;
	}
	
	@Override
	public Boolean selectByEmail(String email) {
		// TODO Auto-generated method stub
		String returnEmail = tbUserMapper.selectByEmail(email);
		return returnEmail != null ? false : true;
	}
	
	/**
	 * 注册写入数据库 uid, uname, password, email, phone, sex, image,status(0:删除 ，1存在), VIP
	 * （0 非，1是）
	 * 
	 * @param tbUser
	 *            封装了插入用户的信息
	 * @return 插入是否成功
	 */
	@Override
	public Boolean regist(TbUser tbUser) {
		// TODO Auto-generated method stub
		int flag = tbUserMapper.insertSelective(tbUser);
		if (flag != 1) {
			return false;
		}
		return true;
	}
}
