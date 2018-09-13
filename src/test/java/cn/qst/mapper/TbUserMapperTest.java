package cn.qst.mapper;

import cn.qst.pojo.TbUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * @author lk
 * 2018/9/13 10:31
 * @description:
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath*:spring/applicationContext-*.xml"})
public class TbUserMapperTest {

    @Autowired
    TbUserMapper tbUserMapper;

    @Test
    public void selectByUname() {
        String user =tbUserMapper.selectByUname("lkk123");
        System.out.println(user);
    }
}