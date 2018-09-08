package cn.qst.service.impl;

import cn.qst.mapper.TbUserMapper;
import cn.qst.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

@Service
public class TbUserServiceImpl implements TbUserService {

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
	public String selectByUname(String uname) {
		// TODO Auto-generated method stub
		String name = tbUserMapper.selectByUname(uname);
		if (name == null) {
			return null;
		} else {
			return name;
		}
	}

	/**
	 * 效验邮箱是否重复
	 * 
	 * @param email
	 *            注册用户邮箱
	 * @return 邮箱被注册过即返回信息，没有即返回null
	 */
	@Override
	public String selectByEmail(String email) {
		// TODO Auto-generated method stub
		String email1 = tbUserMapper.selectByEmail(email);
		if (email1 == null) {
			return null;
		} else {
			return email1;
		}
	}

	@Override
	public String selectByPhone(String phone) {
		// TODO Auto-generated method stub
		String phone1 = tbUserMapper.selectByPhone(phone);
		if (phone1 == null) {
			return null;	
		} else {
			return phone1;
		}
	}

	
	
}
