package cn.qst.service;



import java.util.List;
import java.util.Map;



public interface SeacherMusicService {
	
	/**
	 * 模糊查询
	 * @param str
	 * @return
	 */
	Map<String,Object> searcherByStr(String str);
	
	

	
}
