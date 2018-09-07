package cn.qst.mapper;

import cn.qst.pojo.TbMcategory2;
import cn.qst.pojo.TbMcategory2Example;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMcategory2Mapper {
    int countByExample(TbMcategory2Example example);

    int deleteByExample(TbMcategory2Example example);

    int deleteByPrimaryKey(Integer c2id);

    int insert(TbMcategory2 record);

    int insertSelective(TbMcategory2 record);

    List<TbMcategory2> selectByExample(TbMcategory2Example example);

    TbMcategory2 selectByPrimaryKey(Integer c2id);

    int updateByExampleSelective(@Param("record") TbMcategory2 record, @Param("example") TbMcategory2Example example);

    int updateByExample(@Param("record") TbMcategory2 record, @Param("example") TbMcategory2Example example);

    int updateByPrimaryKeySelective(TbMcategory2 record);

    int updateByPrimaryKey(TbMcategory2 record);
}