package cn.qst.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import cn.qst.comman.pojo.AdminResult;
import cn.qst.comman.pojo.EasyUiDataGridResult;
import cn.qst.comman.pojo.EasyUiTreeNode;
import cn.qst.mapper.TbMenuContentMapper;
import cn.qst.mapper.TbMenuMapper;
import cn.qst.mapper.TbUserMapper;
import cn.qst.pojo.TbMenu;
import cn.qst.pojo.TbMenuContent;
import cn.qst.pojo.TbMenuContentExample;
import cn.qst.pojo.TbMenuExample;
import cn.qst.pojo.TbMenuExample.Criteria;
import cn.qst.pojo.TbUser;
import cn.qst.pojo.TbUserExample;
import cn.qst.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private TbMenuMapper tbMenuMapper;
	
	@Autowired
	private TbMenuContentMapper tbMenuContentMapper;
	
	@Autowired
	private TbUserMapper tbUserMapper;
	//根据父类id查询菜单
	@Override
	public List<EasyUiTreeNode> getMenubyParentId(int id) {
			TbMenuExample example = new TbMenuExample();
			//根据parentId查询分类
			//创建条件添加对象
			Criteria criteria = example .createCriteria();
			//添加条件
			criteria.andParentmidEqualTo(id);
			//执行返回数据
			List<TbMenu> list = tbMenuMapper.selectByExample(example);
			//创建返回Tree节点集
			List<EasyUiTreeNode> nodes = new ArrayList<>();
			//循环遍历itemCatlist创建EasyUiTreeNode
			for(TbMenu node : list) {
				EasyUiTreeNode treeNode = new EasyUiTreeNode();
				//添加id
				treeNode.setId(node.getMid());
				//添加父类id
				treeNode.setParentId(node.getParentmid());
				//添加text
				treeNode.setText(node.getMname());
				//判断state
				treeNode.setState(node.getIsparent()?"closed":"open");
				nodes.add(treeNode);
			}
			return nodes;
	}
	
	//添加菜单
	@Override
	public AdminResult addMenu(Integer parentId, String name) {
		//创建菜单对象
		TbMenu menu = new TbMenu();
		//补全属性
		menu.setMname(name);
		menu.setParentmid(parentId);
		menu.setStatus(true);
		menu.setIsparent(false);
		//插入数据，返回id属性
		tbMenuMapper.insert(menu);
		System.out.println(menu.getMid());
		//判断父节点原来是否是父类目
		TbMenu tbMenu = tbMenuMapper.selectByPrimaryKey(parentId);
		if(!tbMenu.getIsparent()) {//如果不是则修改为父节点
			tbMenu.setIsparent(true);
			//保存
			tbMenuMapper.updateByPrimaryKey(tbMenu);
		}
		return AdminResult.ok(menu);
	}

	//修改菜单
	@Override
	public AdminResult updateMenu(Integer id, String name) {
		TbMenu menu = new TbMenu();
		menu.setMid(id);
		menu.setMname(name);
		tbMenuMapper.updateByPrimaryKeySelective(menu );
		return AdminResult.ok();
	}
	
	//删除菜单
	@Override
	public void deleteMenu(Integer id) {
		//获取其子菜单
		TbMenuExample example = new TbMenuExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentmidEqualTo(id);
		List<TbMenu> songs = tbMenuMapper.selectByExample(example);
		//如果存在子菜单
		if(songs!=null&&songs.size()>0) {
			//递归删除
			for (TbMenu tbMenu : songs) {
				this.deleteMenu(tbMenu.getMid());
			}
		}
		//删除改菜单
		tbMenuMapper.deleteByPrimaryKey(id);
	}
	
	//判断是否还有子类
	@Override
	public AdminResult isParent(Integer parentId) {
		TbMenuExample example = new TbMenuExample();
		Criteria criteria = example.createCriteria();
		criteria.andParentmidEqualTo(parentId);
		List<TbMenu> songs = tbMenuMapper.selectByExample(example);
		//不存在子类
		if(songs==null||songs.isEmpty()) {
			//修改其父类状态
			TbMenu menu = new TbMenu();
			menu.setMid(parentId);
			menu.setIsparent(false);
			tbMenuMapper.updateByPrimaryKeySelective(menu);
		}
		return AdminResult.ok();
	}
	
	//查询菜单内容
	@Override
	public EasyUiDataGridResult getMenuConten(Integer page, Integer rows, Integer mid) {
		//初始化分页插件
		PageHelper.startPage(page, rows);
		//查询出数据
		TbMenuContentExample example = new TbMenuContentExample();
		example.setOrderByClause("playsum desc");
		cn.qst.pojo.TbMenuContentExample.Criteria criteria = example.createCriteria();
		criteria.andMidEqualTo(mid);
		
		List<TbMenuContent> contents = tbMenuContentMapper.selectByExample(example);
		//获取分页数据
		PageInfo<TbMenuContent> info = new PageInfo<>(contents);
		//创建返回结果对象
		EasyUiDataGridResult result = new EasyUiDataGridResult();
		result.setRows(contents);
		result.setTotal(info.getTotal());
		return result;
	}
	
	//修改菜单内容
	@Override
	public AdminResult updateContent(TbMenuContent content) {
		tbMenuContentMapper.updateByPrimaryKeySelective(content);
		return AdminResult.ok();
	}

	//查询用户
	@Override
	public EasyUiDataGridResult selectUser(Integer page, Integer rows, TbUser user) {
		if(page==null) {
			page=1;
		}
		if(rows==null) {
			rows=20;
		}
		//初始化分页插件
		PageHelper.startPage(page, rows);
		//查询用户
		TbUserExample example =  new TbUserExample();
		cn.qst.pojo.TbUserExample.Criteria criteria = example.createCriteria();
		if(user.getUname()!=null&&!"".equals(user.getUname().trim())) {
			criteria.andUnameLike("%"+user.getUname()+"%");
		}
		if(user.getSex()!=null) {
			criteria.andSexEqualTo(user.getSex());
		}
		if(user.getPhone()!=null&&!"".equals(user.getPhone().trim())) {
			criteria.andUnameLike(user.getPhone());
		}
		if(user.getEmail()!=null&&!"".equals(user.getEmail().trim())) {
			criteria.andEmailEqualTo(user.getEmail());
		}
		List<TbUser> userList = tbUserMapper.selectByExample(example);
		PageInfo<TbUser> info = new PageInfo<>(userList);
		EasyUiDataGridResult result = new EasyUiDataGridResult();
		result.setTotal(info.getTotal());
		result.setRows(userList);
		return result;
	}

	//冻结用户
	@Override
	public AdminResult updateUserStatus(String[] ids , boolean status) {
		for (String uid : ids) {
			TbUser user = new TbUser();
			user.setUid(uid);
			user.setStatus(status);
			tbUserMapper.updateByPrimaryKeySelective(user);
		}
		return AdminResult.ok();
	}
}
