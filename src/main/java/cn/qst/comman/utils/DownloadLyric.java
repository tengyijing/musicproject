package cn.qst.comman.utils;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLEncoder;
import java.nio.charset.Charset;
import java.util.Iterator;
import java.util.Vector;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import cn.qst.comman.utils.StringUtil;
import info.monitorenter.cpdetector.io.ASCIIDetector;
import info.monitorenter.cpdetector.io.CodepageDetectorProxy;
import info.monitorenter.cpdetector.io.JChardetFacade;
import info.monitorenter.cpdetector.io.UnicodeDetector;


// 待完善
public class DownloadLyric {
	private static HttpRequest request = new HttpRequest();
	public final static String LRC_EXT = ".lrc";
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
		// 获取下载歌词链接
		String downloadHref = downloadHref(BASE_URL+lrcEnterUrl);
		if( downloadHref == null || "".equals(downloadHref.trim())  ) {
			System.err.println("sorry,未找到【" + name + "】的歌词......");
			return null;
		}
		StringBuffer strBuff = new StringBuffer();
		CodepageDetectorProxy detector = CodepageDetectorProxy.getInstance();
		//JChardetFacade封装了由Mozilla组织提供的JChardet，它可以完成大多数文件的编码测定
		detector.add(JChardetFacade.getInstance());
		// ASCIIDetector用于ASCII编码测定
		detector.add(ASCIIDetector.getInstance());
		// UnicodeDetector用于Unicode家族编码的测定
		detector.add(UnicodeDetector.getInstance());
		try {
			URL urlTmp = new URL(BASE_URL+downloadHref);
			Charset charset = detector.detectCodepage(urlTmp);
			charset = detector.detectCodepage(urlTmp);
			detector = null;
			String charsetName = charset.name();
			charset = null;
			HttpResponse response2 = request.sendGet(BASE_URL+downloadHref,charsetName);
			Vector<String> contentVector = response2.getContentCollection();
			response2 = null;
			for (Iterator<String> iterator = contentVector.iterator(); iterator.hasNext();) {
				String string = (String) iterator.next();
				strBuff.append(string+"\r\n");
			}
			contentVector = null;
			if(!StringUtil.isEmpty(strBuff.toString())) {
				// 设置文件保存位置
				String lrcPath = artist+"-"+name+LRC_EXT;
				File lrcFile = new File(lrcPath);
				if(!lrcFile.exists()) {
					System.err.println("正在创建["+lrcPath+"]文件......");
					lrcFile.createNewFile();
				}
				BufferedWriter writer = new BufferedWriter(new FileWriter(lrcFile));
				writer.write(strBuff.toString());
				writer.close();
				writer = null;
				strBuff = null;
				System.err.println("【"+name+"】的歌词下载完成...");
				return lrcPath;
			}
		} catch (MalformedURLException e) {
			return null;
		} catch (IOException e) {
			return null;
		}
		return null;
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
		String rexName = "(.*)href(.*)点击下载LRC歌词</a>";
		return getHref(url, rexName);
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
					// return string;
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
	
}
