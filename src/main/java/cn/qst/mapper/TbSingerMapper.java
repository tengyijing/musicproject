package cn.qst.mapper;

import cn.qst.pojo.TbSinger;
import cn.qst.pojo.TbSingerExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbSingerMapper {
    int countByExample(TbSingerExample example);

    int deleteByExample(TbSingerExample example);

    int deleteByPrimaryKey(Integer sid);

    int insert(TbSinger record);

    int insertSelective(TbSinger record);

    List<TbSinger> selectByExample(TbSingerExample example);

    TbSinger selectByPrimaryKey(Integer sid);

    int updateByExampleSelective(@Param("record") TbSinger record, @Param("example") TbSingerExample example);

    int updateByExample(@Param("record") TbSinger record, @Param("example") TbSingerExample example);

    int updateByPrimaryKeySelective(TbSinger record);

    int updateByPrimaryKey(TbSinger record);
}