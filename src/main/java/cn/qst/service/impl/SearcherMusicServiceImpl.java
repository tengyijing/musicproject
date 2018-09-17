package cn.qst.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;

import cn.qst.mapper.TbMusicMapper;
import cn.qst.pojo.TbMusic;
import cn.qst.pojo.TbMusicExample;
import cn.qst.pojo.TbMusicExample.Criteria;
import cn.qst.service.SeacherMusicService;

@Service
public class SearcherMusicServiceImpl implements SeacherMusicService {

	@Autowired
	private TbMusicMapper musicMapper;

	@Override
	public Map<String, Object> searcherByStr(String str) {
		// TODO Auto-generated method stub
		Map<String, Object> map = new HashMap<>();
		StringBuilder strmname = new StringBuilder() ;
		StringBuilder strsname = new StringBuilder() ;
			/**
			 * 按照音乐名称查询
			 */
			TbMusicExample example = new TbMusicExample();
			example.setOrderByClause("playsum DESC");	
			Criteria criteria = example.createCriteria();	
			for (int i = 0; i < str.length(); i++) {
				if(i==str.length()-1) {
					strmname.append("%"+str.charAt(i)+"%");
				}else {
					strmname.append("%"+str.charAt(i));
				}
				
			}	
			criteria.andMnameLike(strmname.toString());
			List<TbMusic> searchers = musicMapper.selectByExample(example);
			map.put("song", searchers);

			/**
			 * 按照歌手查询
			 */
			TbMusicExample example1 = new TbMusicExample();
			Criteria criteria1 = example1.createCriteria();
			for (int i = 0; i < str.length(); i++) {
				if(i==str.length()-1) {
					strsname.append("%"+str.charAt(i)+"%");
				}else {
					strsname.append("%"+str.charAt(i));
				}	
			}		
				criteria1.andSnameLike(strsname.toString());
			List<TbMusic> searchers1 = musicMapper.selectByExample(example1);
			List<String> stringSnames = new ArrayList<>();
			for (TbMusic tbMusic : searchers1) {
				stringSnames.add(tbMusic.getSname());
			}
			map.put("songer", stringSnames);
		
		return map;
	}



}
