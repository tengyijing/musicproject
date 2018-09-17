package cn.qst.service;

import java.util.List;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.comman.pojo.EasyUiTreeNode;
import cn.qst.pojo.TbMenuContent;

public interface AdminService {

	List<EasyUiTreeNode> getMenubyParentId(int id);

	AdminResult addMenu(Integer parentId, String name);

	AdminResult updateMenu(Integer id, String name);

	void deleteMenu(Integer id);

	AdminResult isParent(Integer parentId);

	EasyUiDataGridResult getMenuConten(Integer page, Integer rows, Integer mid);

	AdminResult updateContent(TbMenuContent content);


}
