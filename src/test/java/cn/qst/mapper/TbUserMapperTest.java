package cn.qst.mapper;

import cn.qst.comman.jedis.JedisClient;
import cn.qst.pojo.TbUser;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import static org.junit.Assert.*;

/**
 * @author lk
 * 2018/9/13 10:31
 * @description:
 */
public class TbUserMapperTest {

    @Autowired
    TbUserMapper tbUserMapper;

    @Test
    public void selectByUname() {
        String user =tbUserMapper.selectByUname("lkk123");
        System.out.println(user);
    }
    
    @Test
    public void jedisTest() {
    	ApplicationContext applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
    	//获取jedisClient对象
    	JedisClient jedisClient = applicationContext.getBean(JedisClient.class);
    	jedisClient.set("first", "100");
		String result = jedisClient.get("first");
		System.out.println(result);
    }
}

