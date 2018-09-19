package cn.qst.service;




import java.util.Map;




public interface SeacherMusicService {
	
	/**
	 * 模糊查询
	 * @param str
	 * @return
	 */
	Map<String,Object> searcherByStr(String str);
	
	
	/**
	 * 添加音乐到歌单中
	 * @param mid
	 * @param mlid
	 * @return
	 */
	Boolean addMusic(Integer mlid,Integer mid);
	
	
}
