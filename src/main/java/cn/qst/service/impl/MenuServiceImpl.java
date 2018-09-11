package cn.qst.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.qst.mapper.TbMenuMapper;
import cn.qst.pojo.TbMenu;
import cn.qst.pojo.TbMenuExample;
import cn.qst.pojo.TbMenuExample.Criteria;
import cn.qst.service.MenuService;

/**
 * 
 * @author daihong
 *
 */
@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	private TbMenuMapper menuMapper;

	@Override
	public List<TbMenu> queryAll() {
		// TODO Auto-generated method stub
		return menuMapper.selectByExample(null);
	}

	@Override
	public int addMenu(TbMenu tbMenu) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<TbMenu> queryByParent(Integer mid) {
		TbMenuExample example = new TbMenuExample();
		// TODO Auto-generated method stub
		Criteria criteria = example.createCriteria();
		criteria.andParentmidEqualTo(mid);
		return menuMapper.selectByExample(example );
	}

	@Override
	public TbMenu query(Integer mid) {
		// TODO Auto-generated method stub
		return menuMapper.selectByPrimaryKey(mid);
	}

}
