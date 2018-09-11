package cn.qst.mapper;

import cn.qst.pojo.TbUser;
import cn.qst.pojo.TbUserExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbUserMapper {
    int countByExample(TbUserExample example);

    int deleteByExample(TbUserExample example);

    int deleteByPrimaryKey(String uid);

    int insert(TbUser record);

    int insertSelective(TbUser record);

    List<TbUser> selectByExample(TbUserExample example);

    TbUser selectByPrimaryKey(String uid);

    int updateByExampleSelective(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByExample(@Param("record") TbUser record, @Param("example") TbUserExample example);

    int updateByPrimaryKeySelective(TbUser record);

    int updateByPrimaryKey(TbUser record);
    
    /**
     * 效验用户名是否重复
     * 根据用户名直接查找是否有该用户名
     * @param uname 用户名
     * @return 数据库中的用户名
     */
    String selectByUname(String uname);
    
    /**
     * 效验用户邮箱是否重复
     * 根据邮箱直接查找
     * @param email 邮箱
     * @return 邮箱
     */
    String selectByEmail(String email);
    
    /**
     * 效验用户注册手机号是否重复
     * 根据电话号码直接查找
     * @param phone 电话号码
     * @return 电话号码
     */
    String selectByPhone(String phone);
}