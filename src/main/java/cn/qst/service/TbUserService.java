package cn.qst.service;


import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import org.springframework.stereotype.Service;


/**
 * @author lk
 * 2018/9/7 11:22
 * @description:
 */

public interface TbUserService {

    String selectByUname(String uname);
}
