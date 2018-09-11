package cn.qst.mapper;


public interface TbMusic_MusicListMapper {
	// 添加音乐到歌单
	int save(int mlid, int mid);
	// 从歌单中删除音乐
	int delete(int mlid, int mid);
}
