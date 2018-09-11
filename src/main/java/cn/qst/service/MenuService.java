package cn.qst.service;

import java.util.List;

import cn.qst.pojo.TbMenu;
/**
 * 
 * @author daihong
 *
 */
public interface MenuService {
	
	/**
	 * 查询所有的一级菜单
	 * 
	 * @return 返回所有一级菜单
	 */
	public List<TbMenu> queryAll();
	/**
	 * 添加一个菜单选项
	 * @param tbMenu
	 * @return
	 */
	public int addMenu(TbMenu tbMenu);
	/**
	 * 通过父类id查询父类的子菜单
	 * @param parent 
	 * @return
	 */
	public List<TbMenu> queryByParent(Integer mid);
	/**
	 * 通过id查询菜单
	 * @param mid
	 * @return
	 */
	public TbMenu query(Integer mid);
}
