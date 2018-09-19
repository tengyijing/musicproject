package cn.qst.service;


public interface AttentionService {

    /**
     * 用户关注用户插入到数据库中
     *
     * @param uid 关注用户
     * @param bid 关注用户
     * @return 插入成功即返回true，插入不成功即返回false
     */
    Boolean insert(String uid, String bid);
 
    /**
     * 用户关注的数量
     *
     * @param uid 用户id
     * @return 用户关注的数量
     */
    int selectAttention(String uid);
    
    /**
     * 用户的粉丝数
     * @param bid 用户id
     * @return 用户粉丝的数量
     */
    int selectFans(String bid);
    
    /**
     * 验证用户uid 是否 关注 了用户bid
     * @param uid 主动关注
     * @param bid 被关注
     * @return 关注了即返回true，没有即返回false
     */
    Boolean verfiyAttentioned(String uid, String bid);
    
    /**
     * 取消关注
     * @param uid 关注人id
     * @param bid 被关注人id
     * @return 取消成功即返回true，失败即返回false
     */
    Boolean cancelAttention(String uid, String bid);
}
