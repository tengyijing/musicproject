package cn.qst.comman.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import info.monitorenter.cpdetector.io.ASCIIDetector;
import info.monitorenter.cpdetector.io.CodepageDetectorProxy;
import info.monitorenter.cpdetector.io.JChardetFacade;
import info.monitorenter.cpdetector.io.UnicodeDetector;
/**
 * 
 * @author Asimple
 * @Description 歌词获取类
 */
public class DownloadLyric {
	private static HttpRequest request = new HttpRequest();
	public final static String LRC_EXT = "lrc";
	public final static String BASE_URL="http://www.90lrc.cn";
	
	
	public static String startDownload(String name, String artist) {
		// 先精确查找歌曲+歌手
		String lryKey = name+" "+artist;
		String encodeLryKey = "";
		// 请求编码
		try {
			encodeLryKey = URLEncoder.encode(lryKey, "UTF-8");
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
		String urlSearch = BASE_URL+"/so.php?wd="+encodeLryKey;
		// 获取查看歌词页面
		String lrcEnterUrl = getShowLrcUrl(urlSearch);
		if( lrcEnterUrl == null || "".equals(lrcEnterUrl.trim())  ) {
			// 去掉歌手再找一次
			lrcEnterUrl = getShowLrcUrl(BASE_URL+"/so.php?wd="+name);
			if( lrcEnterUrl == null || "".equals(lrcEnterUrl.trim())) {
				System.err.println("sorry,未找到【" + name + "】的歌词......");
				return null;
			}
		}
		// 获取歌词
		String lrc = downloadHref(BASE_URL+lrcEnterUrl);
		return lrc;
	}
	
	/**
	 * 获取显示歌词下载链接
	 * @param urlSearch
	 * @return
	 */
	private static String getShowLrcUrl(String urlSearch) {
		String rexName = "<li>歌词名称：<a href=\"/(.*)";
		return getHref(urlSearch, rexName);
	}
	
	/**
	 * 获取歌词下载链接
	 * @param url
	 * @return
	 */
	private static String downloadHref(String url) {
		String lrcString = "";
		String beginTag = "<li id=\"lrc\">";
		String endTag = "(.*)</li>";
		Pattern beginPatter = Pattern.compile(beginTag);
		Pattern endPatter = Pattern.compile(endTag);
		HttpResponse response;
		try {
			response = request.sendGet(url);
			Vector<String> content = response.getContentCollection();
			for (Iterator<String> iterator = content.iterator(); iterator.hasNext();) {
				String string = iterator.next();
				Matcher beginMatche = beginPatter.matcher(string);
				if( beginMatche.find() ) { // 找到开始标签
					string = iterator.next();
					Matcher endMatcher = endPatter.matcher(string);
					while( endMatcher.find() == false ) {// 寻找到结束标签
						lrcString = lrcString + string.trim()+"\n";
						string = iterator.next();
						endMatcher = endPatter.matcher(string);
					}
				}
			}
		} catch (IOException e) {
			System.err.println("歌词获取错误");
			return null;
		}
		return lrcString;
	}
	
	/**
	 * 获取HTML文本中包含想要的链接的一行
	 * @param url
	 * @param rexName
	 * @return
	 */
	private static String getHref(String url, String rexName) {
		HttpResponse response;
		try {
			response = request.sendGet(url);
			Vector<String> content = response.getContentCollection();
			for (Iterator<String> iterator = content.iterator(); iterator.hasNext();) {
				String string = iterator.next();
				Pattern patter = Pattern.compile(rexName);
				Matcher matche = patter.matcher(string);
				if( matche.find() ) {
					for( String temp: string.split("\"") ) {
						if( temp.startsWith("/") ) {// 查找地址
							return temp;
						}
					}
				}
			}
		} catch (IOException e) {
			return null;
		}
		return null;
	}
	
	/**
	 * 从url中获取歌词
	 * @param url
	 * @return 歌词字符串
	 */
	public static String download(String url) {
		try {
			StringBuffer strBuff = new StringBuffer();
			CodepageDetectorProxy detector = CodepageDetectorProxy.getInstance();
			//JChardetFacade封装了由Mozilla组织提供的JChardet，它可以完成大多数文件的编码测定
			detector.add(JChardetFacade.getInstance());
			// ASCIIDetector用于ASCII编码测定
			detector.add(ASCIIDetector.getInstance());
			// UnicodeDetector用于Unicode家族编码的测定
			detector.add(UnicodeDetector.getInstance());
			Charset charset = null;
			URL urlTmp = new URL(url);
			charset = detector.detectCodepage(urlTmp);
			detector = null;
			String charsetName = charset.name();
			charset = null;
			HttpResponse response = request.sendGet(url,charsetName);
			Vector<String> contentVector = response.getContentCollection();
			response = null;
			for (Iterator<String> iterator = contentVector.iterator(); iterator.hasNext();) {
				String string = iterator.next();
				strBuff.append(string+"\n");
			}
			return strBuff.toString();
		}
		catch (Exception e) {
			return null;
		}
	}
	
}
