package cn.qst.controller;

import cn.qst.comman.utils.MD5Utils;
import cn.qst.comman.utils.SendEmail;
import cn.qst.pojo.TbUser;
import cn.qst.service.UserService;

import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author lk 2018/9/7 11:23
 * @description:
 */

@Controller
@RequestMapping("/User")
public class UserController {

	@Autowired
	private UserService userService;
	
	/**
	 * 查询用户个人信息，根据登陆时session中存储的“username”的用户名
	 * @param request 获取session对象
	 * @return 跳转到个人信息页面
	 */
	@RequestMapping("/personalInfo")
	public String personalInfo(HttpServletRequest request) {
		String uname = (String) request.getSession().getAttribute("username");
		TbUser user = userService.selectPersonalInfo(uname);
		request.setAttribute("user", user);
		return "personal";
	}
	
	/**
	 * 登陆，检查账号密码时候正确，并将用户名 以及 图片的名称 存入session中
	 * 分别命名为 “usrename” “imgstr”
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/login", method = { RequestMethod.POST })
	public Boolean login(String userName, String passWord, HttpSession session) {
		TbUser user = userService.login(userName, passWord);
		if (user != null) {
			StringBuilder builder = new StringBuilder("/source/images/headPhoto/");
			builder.append("user.png");
			session.setAttribute("username", user.getUname());
			session.setAttribute("imgstr", builder);
			return true;
		} else {
			return false;
		}
	}

	/**
	 * 注册写入数据库 uid, uname, password, email, phone, sex(0男，1女，2保密）,
	 *  image,status(0false:删除 ，1true存在), VIP（0 非，1是）
	 *
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/regist", method = { RequestMethod.POST })
	public Boolean regist(TbUser user) {
		user.setUid(UUID.randomUUID().toString().replace("-", "").toLowerCase());
		user.setPassword(MD5Utils.md5(user.getPassword()));
		user.setVip((byte) 0);
		// /source/images/headPhoto/user.png  默认头像
		user.setImage("user.png");
		user.setStatus(true);
		return userService.regist(user);
	}

	/**
	 * 效验用户名是否为唯一
	 * 
	 * @param uname
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyUname", method = { RequestMethod.POST })
	public Boolean verifyUname(String uname) {
		return userService.selectByName(uname);
	}

	/**
	 * 效验邮箱是否唯一
	 *
	 * @param email
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyEmail", method = { RequestMethod.POST })
	public Boolean verifyEmail(String email) {
		return userService.selectByEmail(email);
	}

	/**
	 * 效验电话是否唯一
	 *
	 * @param phone
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyPhone", method = { RequestMethod.POST })
	public Boolean verifyPhone(String phone) {
		return userService.selectByPhone(phone);
	}
	
	/**
	 * 发送验证码邮件,将验证码存储到session中
	 *
	 * @param email 收件箱地址
	 * @return 确认是否发送成功
	 */
	@ResponseBody
	@RequestMapping(value = "/sendEmail", method = { RequestMethod.POST })
	public Boolean sendEmail(String email, HttpSession session) {
		boolean flag = false;
	 	String code = SendEmail.sendEamilCode(email);
		if (code != null) {
			session.setAttribute("code", code);
			flag = true;
		}
		System.out.println(code);
		return flag;
	}

	/**
	 * 从sessino中获取验证码，效验邮件验证码是否正确
	 *
	 * @param verifyNo 用户输入验证码
	 * @return 确认是否正确
	 */
	@ResponseBody
	@RequestMapping(value = "/verifyCode", method = { RequestMethod.POST })
	public Boolean verifyCode(String verifyNo, HttpServletRequest request) {
		boolean flag = false;
		String code = (String) request.getSession().getAttribute("code");
		if (code.equals(verifyNo)) {
			flag = true;
		}
		return flag;
	}
	
	
	
}