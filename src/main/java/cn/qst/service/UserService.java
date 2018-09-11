package cn.qst.service;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

public interface UserService {
	/**
	 * 效验注册用户的用户名
	 * 
	 * @param uname
	 * @return
	 */
	Boolean selectByUname(String uname);
}
