package lrcCrawTest;

import org.junit.Test;

import cn.qst.comman.utils.DownloadLyric;

public class TestClass {
	
	@Test
	public void test01() {
		String temp = DownloadLyric.startDownload("消愁", "毛不易");
		System.out.println(temp);
	}
}
