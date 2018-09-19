package cn.qst.pojo;

import java.util.List;

/**
 * 播放页面异步请求的返回类型
 * @author Administrator
 *
 */
public class PlaySynchResult {
	
	private Integer nowMid;
	
	private List<TbMusic> musics;
	
	private List<Integer> loves;

	public List<TbMusic> getMusics() {
		return musics;
	}

	public void setMusics(List<TbMusic> musics) {
		this.musics = musics;
	}

	public List<Integer> getLoves() {
		return loves;
	}

	public void setLoves(List<Integer> loves) {
		this.loves = loves;
	}

	public Integer getNowMid() {
		return nowMid;
	}

	public void setNowMid(Integer nowMid) {
		this.nowMid = nowMid;
	}
}
