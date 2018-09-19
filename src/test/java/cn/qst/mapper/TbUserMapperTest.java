package cn.qst.mapper;

import cn.qst.comman.jedis.JedisClient;
import cn.qst.comman.utils.JsonUtils;
import cn.qst.pojo.TbMenuContent;
import cn.qst.service.MenuService;
import cn.qst.service.impl.MenuServiceImpl;

import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;


import java.util.List;

/**
 * @author lk
 * 2018/9/13 10:31
 * @description:
 */
public class TbUserMapperTest {

    @Autowired
    TbUserMapper tbUserMapper;
	private ApplicationContext applicationContext;

    
    @Test
    public void jedisTest() {
    	applicationContext = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
    	//获取jedisClient对象
    	JedisClient jedisClient = applicationContext.getBean(JedisClient.class);
    	MenuService menuService = new MenuServiceImpl();
    	List<TbMenuContent> queryByName;
		String jsonName = jedisClient.hget("CONTENT","huadong");
		if(jsonName!=null && !"".equals(jsonName.trim())) {
			queryByName = JsonUtils.jsonToList(jsonName, TbMenuContent.class);
		}else {
			queryByName = menuService.queryByName();
			//存入缓存
			jedisClient.hset("CONTENT", "huadong", JsonUtils.objectToJson(queryByName));
		}
    }
}

