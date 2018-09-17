package cn.qst.mapper;

import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbMenuContentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMenuContentMapper {
    int countByExample(TbMenuContentExample example);

    int deleteByExample(TbMenuContentExample example);

    int deleteByPrimaryKey(Integer id);

    int insert(TbMenuContent record);

    int insertSelective(TbMenuContent record);

    List<TbMenuContent> selectByExample(TbMenuContentExample example);

    TbMenuContent selectByPrimaryKey(Integer id);

    int updateByExampleSelective(@Param("record") TbMenuContent record, @Param("example") TbMenuContentExample example);

    int updateByExample(@Param("record") TbMenuContent record, @Param("example") TbMenuContentExample example);

    int updateByPrimaryKeySelective(TbMenuContent record);

    int updateByPrimaryKey(TbMenuContent record);
}