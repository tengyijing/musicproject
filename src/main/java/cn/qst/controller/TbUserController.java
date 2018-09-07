package cn.qst.controller;

import cn.qst.service.TbUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * @author lk
 * 2018/9/7 11:23
 * @description:
 */

@Controller
@RequestMapping("/User")
public class TbUserController {

    @Autowired
    private TbUserService tbUserService;

    @RequestMapping("/login")
    public String selectByPrimaryKey() {
        tbUserService.selectByPrimaryKey();
        return "redirect:/index.jsp";
    }

}
