package cn.qst.mapper;

import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusicExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMusicMapper {
    int countByExample(TbMusicExample example);

    int deleteByExample(TbMusicExample example);

    int deleteByPrimaryKey(Integer mid);

    int insert(TbMusic record);

    int insertSelective(TbMusic record);

    List<TbMusic> selectByExample(TbMusicExample example);

    TbMusic selectByPrimaryKey(Integer mid);

    int updateByExampleSelective(@Param("record") TbMusic record, @Param("example") TbMusicExample example);

    int updateByExample(@Param("record") TbMusic record, @Param("example") TbMusicExample example);

    int updateByPrimaryKeySelective(TbMusic record);

    int updateByPrimaryKey(TbMusic record);
    
    List<TbMusic> selectByLid(int lid);
}