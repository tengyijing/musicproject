package cn.qst.mapper;

import cn.qst.pojo.TbMusiclist;
import cn.qst.pojo.TbMusiclistExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMusiclistMapper {
    int countByExample(TbMusiclistExample example);

    int deleteByExample(TbMusiclistExample example);

    int deleteByPrimaryKey(Integer mlid);

    int insert(TbMusiclist record);

    int insertSelective(TbMusiclist record);

    List<TbMusiclist> selectByExample(TbMusiclistExample example);

    TbMusiclist selectByPrimaryKey(Integer mlid);

    int updateByExampleSelective(@Param("record") TbMusiclist record, @Param("example") TbMusiclistExample example);

    int updateByExample(@Param("record") TbMusiclist record, @Param("example") TbMusiclistExample example);

    int updateByPrimaryKeySelective(TbMusiclist record);

    int updateByPrimaryKey(TbMusiclist record);
}