package cn.qst.service.impl;

import cn.qst.mapper.TbAttentionMapper;
import cn.qst.pojo.TbAttention;
import cn.qst.service.AttentionService;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

/**
 * @author lk
 * 2018/9/17 20:13
 * @description:
 */
@Service
public class AttentionServiceImpl implements AttentionService {

    @Resource
    private TbAttentionMapper tbAttentionMapper;

    /**
     * 关注用户
     *
     * @param uid 关注用户
     * @param did 被关注用户
     * @return 写入成功即返回true，失败即返回false
     */
    @Override
    public Boolean insert(String uid, String did) {
        TbAttention attention = new TbAttention();
        attention.setUid("uid");
        attention.setBid("did");
        return tbAttentionMapper.insert(attention) == 1 ? true : false;
    }
}
