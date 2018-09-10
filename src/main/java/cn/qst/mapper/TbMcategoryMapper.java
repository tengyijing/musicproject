package cn.qst.mapper;

import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMcategoryExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbMcategoryMapper {
    int countByExample(TbMcategoryExample example);

    int deleteByExample(TbMcategoryExample example);

    int deleteByPrimaryKey(Integer cid);

    int insert(TbMcategory record);

    int insertSelective(TbMcategory record);

    List<TbMcategory> selectByExample(TbMcategoryExample example);

    TbMcategory selectByPrimaryKey(Integer cid);

    int updateByExampleSelective(@Param("record") TbMcategory record, @Param("example") TbMcategoryExample example);

    int updateByExample(@Param("record") TbMcategory record, @Param("example") TbMcategoryExample example);

    int updateByPrimaryKeySelective(TbMcategory record);

    int updateByPrimaryKey(TbMcategory record);
}