package cn.qst.service;

import java.util.List;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.comman.pojo.EasyUiTreeNode;
import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbUser;

public interface AdminService {

	//获取菜单
	List<EasyUiTreeNode> getMenubyParentId(int id);

	//增加菜单
	AdminResult addMenu(Integer parentId, String name);

	//修改菜单
	AdminResult updateMenu(Integer id, String name);

	//删除菜单
	void deleteMenu(Integer id);

	//判断菜单是否是父类
	AdminResult isParent(Integer parentId);

	//查询菜单内容
	EasyUiDataGridResult getMenuConten(Integer page, Integer rows, Integer mid);

	//修改菜单内容
	AdminResult updateContent(TbMenuContent content);

	//查询用户
	EasyUiDataGridResult selectUser(Integer page, Integer rows, TbUser user);
	
	//修改用户冻结状态
	AdminResult updateUserStatus(String[] ids,boolean status);
}
