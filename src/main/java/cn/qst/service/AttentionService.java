package cn.qst.service;


public interface AttentionService {

    /**
     * 用户关注用户插入到数据库中
     *
     * @param uid 关注用户
     * @param did 关注用户
     * @return 插入成功即返回true，插入不成功即返回false
     */
    Boolean insert(String uid, String did);
}
