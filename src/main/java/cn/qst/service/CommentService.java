package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbComment;

public interface CommentService {
	List<TbComment> selectByMid(int mid);
}
