package cn.qst.service;

import cn.qst.pojo.TbCity;
import cn.qst.pojo.TbProvince;
import cn.qst.pojo.TbUser;

import java.util.List;

/**
 * @author lk 2018/9/7 11:22
 * @description:
 */

public interface UserService {

	/**
	 * 根据传入的用户姓名信息进行效验，是否含有重复数据
	 *
	 * @param name 用户注册信息
	 * @return 查找到值即返回name，没有即返回null
	 */
	Boolean selectByName(String name);

	/**
	 * 根据传入的用户电话信息进行效验，是否含有重复数据
	 *
	 * @param Phone 用户注册信息
	 * @return 查找到值即返回name，没有即返回null
	 */
	Boolean selectByPhone(String Phone);

	/**
	 * 效验用户邮件是否重复
	 *
	 * @param email
	 * @return
	 */
	Boolean selectByEmail(String email);

	/**
	 * 注册用户，添加到用户表中
	 * @param tbUser
	 * @return
	 */
	Boolean regist(TbUser tbUser);

	/**
	 * 登陆用户
	 * @param userName
	 * @param passWord
	 * @return
	 */
	TbUser login(String userName, String passWord);

	/**
	 * 根据用户名查询个人信息
	 * @param uname
	 * @return
	 */
	TbUser selectPersonalInfo(String uname);

	/**
	 * 根据用户的地址id 查询用户所在地区
	 * @param addressId
	 * @return
	 */
	TbCity selectUserCity(String addressId);

	/**
	 * 查询所有的省信息
	 * @return
	 */
	List<TbProvince> selectProvince();

	/**
	 * 查询所有市的信息根据市id
	 * @param pid
	 * @return
	 */
	List<TbCity> selectCityByPid(Integer pid);
}
