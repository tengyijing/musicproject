package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbCommentMapper;
import cn.qst.pojo.TbComment;
import cn.qst.pojo.TbCommentExample;
import cn.qst.pojo.TbCommentExample.Criteria;
import cn.qst.service.CommentService;

/**
 * 
 * @author Asimple
 * @date 2018年9月17日
 * @Description 评论服务实现类
 */

@Service
public class CommentServiceImpl implements CommentService {

	@Autowired
	private TbCommentMapper commentDao;
	
	@Override
	public List<TbComment> selectByMid(int mid) {
		TbCommentExample example = new TbCommentExample();
		Criteria criteria = example.createCriteria();
		criteria.andMidEqualTo(mid);
		return commentDao.selectByExample(example);
	}

}
