package cn.qst.mapper;


import cn.qst.pojo.TbAttention;

public interface TbAttentionMapper {
    /**
     * 用户关注用户
     *
     * @param tbAttention uid 关注其他用户id， bid 被关注
     * @return
     */
    int insert(TbAttention tbAttention);
}
