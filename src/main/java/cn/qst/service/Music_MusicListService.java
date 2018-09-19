package cn.qst.service;

public interface Music_MusicListService {
	
	boolean save(int mlid, int mid);
	
	boolean del(int mlid, int mid);
	
	int countByMlidAndMid(int mlid, int mid);

	int delAll(int mlid);
	
}
