package cn.qst.service.impl;

import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import cn.qst.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * @author lk
 * 2018/9/7 11:22
 * @description:
 */

@Service
public class TbUserServiceImpl implements TbUserService {

    @Autowired
    private TbUserMapper tbUserMapper;

    /**
     * 根据名字验证用户名是否重复
     * @param uname 用户名
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

    
}
