package cn.qst.mapper;

import cn.qst.pojo.TbMcategory1;
import cn.qst.pojo.TbMcategory1Example;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMcategory1Mapper {
    int countByExample(TbMcategory1Example example);

    int deleteByExample(TbMcategory1Example example);

    int deleteByPrimaryKey(Integer c1id);

    int insert(TbMcategory1 record);

    int insertSelective(TbMcategory1 record);

    List<TbMcategory1> selectByExample(TbMcategory1Example example);

    TbMcategory1 selectByPrimaryKey(Integer c1id);

    int updateByExampleSelective(@Param("record") TbMcategory1 record, @Param("example") TbMcategory1Example example);

    int updateByExample(@Param("record") TbMcategory1 record, @Param("example") TbMcategory1Example example);

    int updateByPrimaryKeySelective(TbMcategory1 record);

    int updateByPrimaryKey(TbMcategory1 record);
}