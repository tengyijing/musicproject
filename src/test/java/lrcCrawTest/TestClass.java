package lrcCrawTest;

import org.junit.Test;

import cn.qst.comman.utils.DownloadLyric;

public class TestClass {
	
	@Test
	public void test01() {
		/*
		   <li>歌词名称：<a href="/85764/%E6%B5%AA%E4%BA%BA%E7%90%B5%E7%90%B6"><b>浪人琵琶</b></a></li>
		 */
		DownloadLyric.startDownload("浪人琵琶", "胡66");
	}
}
