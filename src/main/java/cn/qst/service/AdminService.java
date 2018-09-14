package cn.qst.service;

import java.util.List;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiTreeNode;

public interface AdminService {

	List<EasyUiTreeNode> getMenubyParentId(int id);

	AdminResult addMenu(Integer parentId, String name);

	AdminResult updateMenu(Integer id, String name);

	void deleteMenu(Integer id);

	AdminResult isParent(Integer parentId);

}
