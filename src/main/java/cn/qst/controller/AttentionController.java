package cn.qst.controller;

import cn.qst.pojo.TbAttention;
import cn.qst.pojo.TbUser;
import cn.qst.service.AttentionService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

/**
 * @author lk 2018/9/17 20:31
 * @description:
 */
@Controller
@RequestMapping("/attention")
public class AttentionController {

	/*
	 * Tbattention 中 uid 是主动关注用户的id bid 是被关注用户的id 所有粉丝数量就是查bid有几个 我关注过几个人就是查uid有几个
	 */

	@Autowired
	private AttentionService attentionService;

	/**
	 * 用户uid关注用户did
	 * 
	 * @param bid
	 *            被关注用户id
	 */
	@ResponseBody
	@RequestMapping("/addAttention")
	public Boolean addAttention(String bid, HttpServletRequest request) {
		String uid = ((TbUser) (request.getSession().getAttribute("user"))).getUid();
		return attentionService.insert(uid, bid);
	}

	/**
	 * 显示用户的关注人数，以及用户的粉丝数量
	 * 
	 * @param uid
	 *            前台传入的uid
	 * @return 封装了关注的人数，以及自己的粉丝数量
	 */
	@ResponseBody
	@RequestMapping("/selectAttentionAndFans")
	public List<Integer> selectAttentionAndFans(String uid) {
		Integer attention = attentionService.selectAttention(uid);// uid
		Integer fans = attentionService.selectFans(uid);// bid
		List<Integer> list = new ArrayList<>();
		list.add(attention);
		list.add(fans);
		return list;
	}

    /**
     * 根据传入的用户id 查询用户的关注信息
     * @param uid 用户id
     * @return
     */
    @ResponseBody
    @RequestMapping("/showFansAndAttention")
	public List<List<TbAttention>> showFansAndAttention(String uid) {
        List<TbAttention> attentionList = attentionService.showAttention(uid);
        List<TbAttention> fansList = attentionService.showFans(uid);
        List<List<TbAttention>> list = Arrays.asList(attentionList, fansList);
	    return list;
    }

	/**
	 * 判断登陆的用户是否关注了从页面传入的uid的用户 是否关注
	 * 
	 * @param request
	 *            获取session中的“user” 信息
	 * @param bid
	 *            页面传入的用户id
	 * @return 关注了即返回true ，没有即返回false
	 */
	@ResponseBody
	@RequestMapping("/verfiyAttentioned")
	public Boolean verfiyAttentioned(HttpServletRequest request, String bid) {
		TbUser user = (TbUser) request.getSession().getAttribute("user");
		return attentionService.verfiyAttentioned(user.getUid(), bid);
	}

	/**
	 * 取消关注
	 * 
	 * @param request
	 *            获取session中的登陆用户id
	 * @param bid
	 *            取消关注的用户id
	 * @return 取消成功即返回true，反false
	 */
	@ResponseBody
	@RequestMapping("/cancelAttentioned")
	public Boolean cancelAttentioned(HttpServletRequest request, String bid) {
		TbUser user = (TbUser) request.getSession().getAttribute("user");
		return attentionService.cancelAttention(user.getUid(), bid);
	}
    
    @ResponseBody
    @RequestMapping("/queryAttentioned")
    public  List<TbUser> queryAttentioned(String id){
    	List<TbUser> queryAttention = attentionService.queryAttention(id);
    	return queryAttention;
    }
    
    @ResponseBody
    @RequestMapping("/queryFans")
    public  List<TbUser> queryFans(String id){
    	List<TbUser> queryAttention = attentionService.queryFans(id);
    	return queryAttention;
    }

}
