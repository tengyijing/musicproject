package cn.qst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import cn.qst.pojo.TbMenu;
import cn.qst.service.MenuService;

import java.util.ArrayList;
import java.util.List;


/**
 * 管理员针对页面调整
 * 
 * @author daihong
 *
 */
@Controller
@RequestMapping("admin")
public class AdminController {

	@Autowired
	private MenuService menuService;

	
	/**
	 * 根据不同的页面返回相应的菜单
	 * @param id 通过id来得到当前跳转页面的菜单属性
	 * @return 返回一个json数据到前台页面
	 */
	@ResponseBody
	@RequestMapping("/queryAll")
	public List<Object> queryAll(Integer id) {
		List<TbMenu> tbMenus = menuService.queryAll();
		List<TbMenu> mPList = new ArrayList<>();
		// 查询所有一级菜单
		for (TbMenu tbMenu : tbMenus) {
			if (tbMenu.getParentmid().equals(0)) {
				mPList.add(tbMenu);
			}
		}
		List<Object> list = new ArrayList<>();
		TbMenu tbMenu = menuService.query(id);
		List<TbMenu> mCList = new ArrayList<>();
		Integer parent;
		Integer child;
		String name;
		//判断传回的值的菜单属性是否是父菜单
		if (tbMenu.getParentmid() == 0) {
			parent = tbMenu.getMid();
			mCList = menuService.queryByParent(tbMenu.getMid());
			child = mCList.get(0).getMid();
			name = mCList.get(0).getEname();
		} else {
			parent = tbMenu.getParentmid();
			mCList = menuService.queryByParent(parent);
			child = tbMenu.getMid();
			name = tbMenu.getEname();
		}
		list.add(parent);
		list.add(child);
		list.add(name);
		mPList.addAll(mCList);
		list.add(mPList);
		return list;
	}
}
