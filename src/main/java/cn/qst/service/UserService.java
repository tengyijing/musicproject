package cn.qst.service;

import cn.qst.pojo.TbUser;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

public interface UserService {
	/**
	 * 效验注册用户姓名是否重复
	 * 
	 * @param uname
	 * @return
	 */
	Boolean selectByName(String name);

	/**
	 * 效验注册用户邮箱是否重复（）
	 * 
	 * @param email
	 * @return
	 */
	Boolean selectByEmail(String email);
	
	/**
	 * 效验注册用户电话号码是否重复
	 * 
	 * @param phone 
	 * @return
	 */
	Boolean selectByPhone(String phone);
	
	/**
	 * 注册写入数据库 uid, uname, password, email, phone, sex, image,status(0:删除 ，1存在), VIP
	 * （0 非，1是）
	 * 
	 * @param tbUser
	 * @return
	 */
	Boolean regist(TbUser tbUser);
	
	/**
	 * 登陆，通过用户名
	 * @param uname
	 * @return
	 */
	TbUser login(String userName, String passWord);
	
	/**
	 * 查找登陆用户的个人信息，通过用户名
	 * @param uname
	 * @return
	 */
	TbUser selectPersonalInfo(String uname);
}
