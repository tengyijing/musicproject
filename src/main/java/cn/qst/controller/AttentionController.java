package cn.qst.controller;

import cn.qst.pojo.TbUser;
import cn.qst.service.AttentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author lk
 * 2018/9/17 20:31
 * @description:
 */
@Controller
@RequestMapping("/attention")
public class AttentionController {

    @Autowired
    private AttentionService attentionService;

    /**
     * 用户uid关注用户did
     * @param did 被关注用户id
     */
    @ResponseBody
    @RequestMapping("/addAttention")
    public Boolean addAttention(String did, HttpServletRequest request) {
        return attentionService.insert(
                ((TbUser) (request.getSession().getAttribute("user"))).getUid(), did);
    }


}
