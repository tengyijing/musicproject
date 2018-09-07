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

    @Override
    public TbUser selectByPrimaryKey() {
        return tbUserMapper.selectByPrimaryKey("100");
    }
}
