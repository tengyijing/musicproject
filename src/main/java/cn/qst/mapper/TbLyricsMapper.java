package cn.qst.mapper;

import cn.qst.pojo.TbLyrics;
import cn.qst.pojo.TbLyricsExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface TbLyricsMapper {
    int countByExample(TbLyricsExample example);

    int deleteByExample(TbLyricsExample example);

    int deleteByPrimaryKey(Integer lid);

    int insert(TbLyrics record);

    int insertSelective(TbLyrics record);

    List<TbLyrics> selectByExample(TbLyricsExample example);

    TbLyrics selectByPrimaryKey(Integer lid);

    int updateByExampleSelective(@Param("record") TbLyrics record, @Param("example") TbLyricsExample example);

    int updateByExample(@Param("record") TbLyrics record, @Param("example") TbLyricsExample example);

    int updateByPrimaryKeySelective(TbLyrics record);

    int updateByPrimaryKey(TbLyrics record);
}