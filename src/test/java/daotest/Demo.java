package daotest;

import java.util.List;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbUser;
import cn.qst.pojo.TbUserExample;

public class Demo {
	
	@Test
	public void test() {
		ApplicationContext context = new ClassPathXmlApplicationContext("classpath:spring/applicationContext-*.xml");
		TbUserMapper userMapper = context.getBean(TbUserMapper.class);
		TbUserExample example = null;
		List<TbUser> selectByExample = userMapper.selectByExample(example);
		System.out.println(selectByExample);
	}
}
