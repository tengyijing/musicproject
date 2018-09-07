package cn.qst.mapper;

import cn.qst.pojo.TbComment;
import cn.qst.pojo.TbCommentExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbCommentMapper {
    int countByExample(TbCommentExample example);

    int deleteByExample(TbCommentExample example);

    int deleteByPrimaryKey(Integer cdid);

    int insert(TbComment record);

    int insertSelective(TbComment record);

    List<TbComment> selectByExampleWithBLOBs(TbCommentExample example);

    List<TbComment> selectByExample(TbCommentExample example);

    TbComment selectByPrimaryKey(Integer cdid);

    int updateByExampleSelective(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExampleWithBLOBs(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByExample(@Param("record") TbComment record, @Param("example") TbCommentExample example);

    int updateByPrimaryKeySelective(TbComment record);

    int updateByPrimaryKeyWithBLOBs(TbComment record);

    int updateByPrimaryKey(TbComment record);
}