package cn.qst.controller;

import cn.qst.comman.utils.MD5Utils;
import cn.qst.comman.utils.SendEmail;
import cn.qst.comman.utils.TimeUtils;
import cn.qst.pojo.TbCity;
import cn.qst.pojo.TbProvince;
import cn.qst.pojo.TbUser;
import cn.qst.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.UUID;

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
     * 将客户端空白输入传入""转为null
     *
     * @param binder 不知道
     */
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        binder.registerCustomEditor(String.class, new StringTrimmerEditor(true));
    }

    /**
     * 更新用户信息
     *
     * @param user 封装了用户的性别，vip，邮箱地址，电话，用户名,地址
     * @return 重定向到个人显示信息界面
     */
    @RequestMapping(value = "/changUserInfo", method = {RequestMethod.POST})
    public String changeUserInfo(TbUser user) {
        userService.changeUserInfo(user);
        return "redirect:personalInfo";
    }

    /**
     * 根据用户地址id 查询用户地址信息
     *
     * @param addressId
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/userCityInfo")
    public TbCity userCityInfo(String addressId) {
        return userService.selectUserCity(addressId);
    }

    /**
     * 查询所有省信息
     *
     * @return
     */
    @ResponseBody
    @RequestMapping("/allProvinceInfo")
    public List<TbProvince> allProvinceInfo() {
        return userService.selectProvince();
    }

    /**
     * 城市信息
     *
     * @param pid 省id
     * @return
     */
    @ResponseBody
    @RequestMapping("/CityInfoById")
    public List<TbCity> findCityInfo(Integer pid) {
        return userService.selectCityByPid(pid);
    }

    /**
     * 注销登陆
     *
     * @param session
     * @return
     */
    @RequestMapping("/exit")
    public String exitUser(HttpSession session) {
        session.removeAttribute("username");
        session.removeAttribute("imgstr");
        return "index";
    }

    /**
     * 查询用户个人信息，根据登陆时session中存储的“username”的用户名
     *
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
     * 登陆，检查账号密码时候正确，并将用户名 以及 图片的名称 存入session中 分别命名为 “usrename” “imgstr”
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/login")
    public Boolean login(String userName, String passWord, HttpSession session) {
        TbUser user = userService.login(userName, passWord);
        if (user != null) {
            session.setAttribute("username", user.getUname());
            session.setAttribute("imgstr", user.getImage());
            return true;
        } else {
            return false;
        }
    }

    /**
     * 注册写入数据库 uid, uname, password, email, phone, sex(0男，1女，2保密）,
     * image,status(0false:删除 ，1true存在), VIP（0 非，1是）
     *
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/regist", method = {RequestMethod.POST})
    public Boolean regist(TbUser user) {
        user.setUid(UUID.randomUUID().toString().replace("-", "").toLowerCase());
        user.setPassword(MD5Utils.md5(user.getPassword()));
        user.setVip((byte) 0);
        // /source/images/headPhoto/user.png 默认头像
        user.setImage("/images/headPhoto/user.png");
        user.setStatus(true);
        return userService.regist(user);
    }

    /**
     * 修改密码
     *
     * @param userName
     * @param passWord
     * @return
     */
    @ResponseBody
    @RequestMapping("/changePassword")
    public Boolean changePassword(String userName, String passWord) {
        return userService.changePassword(userName, MD5Utils.md5(passWord));
    }

    /**
     * 效验用户名是否为唯一
     *
     * @param uname
     * @return
     */
    @ResponseBody
    @RequestMapping(value = "/verifyUname")
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
    @RequestMapping(value = "/verifyEmail")
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
    @RequestMapping(value = "/verifyPhone")
    public Boolean verifyPhone(String phone) {
        return userService.selectByPhone(phone);
    }

    /**
     * 验证用户的邮箱地址是否正确
     *
     * @param uname 用户名
     * @param email 邮箱地址
     * @return
     */
    @ResponseBody
    @RequestMapping("/verifyUnameAndEmail")
    public Boolean verifyUnameAndEmail(String uname, String email) {
        return userService.selectByUnameAndEmail(uname, email);
    }

    /**
     * 发送验证码邮件,将验证码存储到session中 同时记录下验证码的超时时间，计算验证码超时
     *
     * @param email 收件箱地址
     * @return 确认是否发送成功
     */
    @ResponseBody
    @RequestMapping(value = "/sendEmail")
    public Boolean sendEmail(String email, HttpSession session, HttpServletRequest request) {
        boolean flag = false;
        String code = null;
        Date codeOverTime = (Date) request.getSession().getAttribute("codeOverTime");
        if (codeOverTime != null) {
            if (TimeUtils.compareTime(TimeUtils.getNowTime(), codeOverTime)) {
                code = (String) request.getSession().getAttribute("code");
            } else {
                code = SendEmail.sendEamilCode(email);
                if (code != null) {
                    session.setAttribute("code", code);
                    session.setAttribute("codeOverTime", TimeUtils.addMinuteTime(3));
                    flag = true;
                }
            }
        } else {
            code = SendEmail.sendEamilCode(email);
            if (code != null) {
                session.setAttribute("code", code);
                session.setAttribute("codeOverTime", TimeUtils.addMinuteTime(3));
                flag = true;
            }
        }
        System.out.println(code);
        return flag;
    }

    /**
     * 从sessino中获取验证码，效验邮件验证码是否正确, 同时取得验证码超时的时间 判断验证码是否超时 每次效验成功即销毁验证码对象
     *
     * @param verifyNo 用户输入验证码
     * @return 确认是否正确
     */
    @ResponseBody
    @RequestMapping(value = "/verifyCode")
    public Boolean verifyCode(String verifyNo, HttpServletRequest request) {
        boolean flag = false;
        HttpSession session = request.getSession();
        Date codeOverTime = (Date) session.getAttribute("codeOverTime");
        if (codeOverTime != null) {
            if (TimeUtils.compareTime(codeOverTime, TimeUtils.getNowTime())) {
                session.removeAttribute("code");
                session.removeAttribute("codeOverTime");
                return flag;
            }
        }
        String code = (String) session.getAttribute("code");
        if (code.equals(verifyNo)) {
            session.removeAttribute("codeOverTime");
            flag = true;
        }
        return flag;
    }

}