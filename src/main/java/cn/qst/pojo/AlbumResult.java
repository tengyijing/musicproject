package cn.qst.pojo;
/**
 * 专辑类
 * 将歌手的歌曲等封装起来
 * @author daihong
 *
 */

import java.util.List;

import cn.qst.pojo.TbMusic;

public class AlbumResult {
	private String sname;
	private Integer songs;
	private Integer tryListening;

	public String getSname() {
		return sname;
	}

	public void setSname(String sname) {
		this.sname = sname;
	}

	public Integer getSongs() {
		return songs;
	}

	public void setSongs(Integer songs) {
		this.songs = songs;
	}

	public Integer getTryListening() {
		return tryListening;
	}

	public void setTryListening(Integer tryListening) {
		this.tryListening = tryListening;
	}

	@Override
	public String toString() {
		return "AlbumResult [sname=" + sname + ", songs=" + songs + ", tryListening=" + tryListening + 
				 "]";
	}

}
