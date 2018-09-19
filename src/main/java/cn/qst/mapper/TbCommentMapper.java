package cn.qst.mapper;

import java.util.List;

import cn.qst.pojo.TbComment;

public interface TbCommentMapper {
    // 添加评论
	int save(TbComment comment);
	
	// 删除评论
	int delete(int cdid);
	
	// 根据mid查找对应的评论
	List<TbComment> selectByMid(int mid);
	
	// 统计总数
	int countAllByMid(int mid);
	
	// 精彩评论
	List<TbComment> top10Comment(int mid);
	
}