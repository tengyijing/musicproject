package cn.qst.controller;

import cn.qst.pojo.TbUser;
import cn.qst.service.TbUserService;

import org.omg.CORBA.PUBLIC_MEMBER;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * @author lk 2018/9/7 11:23
 * @description:
 */

@Controller
@RequestMapping("/User")
public class TbUserController {

	@Autowired
	private TbUserService tbUserService;

	@RequestMapping(value = "/login", method = { RequestMethod.GET })
	public String login() {
		return "login";
	}
	
	@RequestMapping(value="/login", method = {RequestMethod.POST})
	public String login(TbUser tbUser) {
		
		return "redirect:index.jsp";
	}
	
	@RequestMapping(value="/regist", method = {RequestMethod.GET})
	public String regist() {
		return "regist";
	}
	
	@RequestMapping(value="/regist", method = {RequestMethod.POST})
	public String regist(TbUser tbUser) {
		
		return "login";
	}
}
