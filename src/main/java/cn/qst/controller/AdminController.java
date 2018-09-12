package cn.qst.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.qst.pojo.TbMcategory;
import cn.qst.pojo.TbMenu;
import cn.qst.service.MenuService;
import cn.qst.service.MusicClassifyService;

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

	@Autowired
	private MusicClassifyService musicClassifyService;
	
	/**
	 * 根据不同的页面返回相应的菜单
	 * @param id 通过id来得到当前跳转页面的菜单属性
	 * @return 返回一个json数据到前台页面
	 */
	@ResponseBody
	@RequestMapping("/queryMenuAll")
	public List<Object> queryMenuAll(Integer menuid) {
		List<TbMenu> tbMenus = menuService.queryAll();
		List<TbMenu> mPList = new ArrayList<>();
		// 查询所有一级菜单
		for (TbMenu tbMenu : tbMenus) {
			if (tbMenu.getParentmid().equals(0)) {
				mPList.add(tbMenu);
			}
		}
		List<Object> list = new ArrayList<>();
		TbMenu tbMenu = menuService.query(menuid);
		List<TbMenu> mCList = new ArrayList<>();
		Integer parent;
		Integer child;
		String name;
		//判断传回的值的菜单属性是否是父菜单
		if (tbMenu.getParentmid() == 0) {
			parent = tbMenu.getMid();
			mCList = menuService.queryByParent(tbMenu.getMid());
			if (mCList==null) {
				name = null;
				child = null;
			}else {
				child = mCList.get(0).getMid();
			name = mCList.get(0).getEname();
			}
			
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


	/**
	 * 把每个音乐进行分类处理
	 * @return
	 */
	@ResponseBody
	@RequestMapping("/queryMcategoryAll")
	public List<TbMcategory> queryMcategoryAll(){
		List<TbMcategory> list = new ArrayList<>();
		List<TbMcategory> mcategories = musicClassifyService.mcategories(0);
		for(TbMcategory mcategory:mcategories) {
			list.add(mcategory);
			List<TbMcategory> child = musicClassifyService.mcategories(mcategory.getCid());
			if (child!=null) {
				for(TbMcategory tbMcategory:child)
				list.add(tbMcategory);
			}	
		}	
		return list;
	}

}
