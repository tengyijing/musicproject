package cn.qst.service;

import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import org.springframework.stereotype.Service;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

public interface TbUserService {
	/**
	 * 效验注册用户的用户名
	 * 
	 * @param uname
	 * @return
	 */
	String selectByUname(String uname);

	/**
	 * 效验注册用户的邮箱
	 * 
	 * @param email
	 * @return
	 */
	String selectByEmail(String email);
	
	/**
	 * 效验注册用户电话号码
	 * 
	 * @param phone 电话号码
	 * @return 电话号码
	 */
	String selectByPhone(String phone);
}
