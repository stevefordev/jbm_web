package com.jbm.mmp.util;

import java.net.URL;

import org.jdom2.Document;
import org.jdom2.Element;
import org.jdom2.input.SAXBuilder;

public class WordCheckUtil {
	
	public static boolean checkWord(String word) {
		
		int num = 0;

		//한글 우리말샘 API를 활용하여 한글 단어인지 확인
		try {

			//한글 우리말샘 API는 json이 아니라
			//XML만 지원
			URL url = new URL("https://opendict.korean.go.kr/api/search?key=7536F9CCB1568B348CE80E00E8D9FE46&q=" + word
					+ "&part=word&advanced=y&method=exact");

			//JDOM 라이브러리를 이용하여 xml을 파싱
			SAXBuilder builder = new SAXBuilder();

			Document doc = builder.build(url.openStream());

			Element xmlRoot = doc.getRootElement();

			//그 단어로 검색하여 total이 0이면 단어가 없는 것
			num = Integer.parseInt(xmlRoot.getChild("total").getText());

		} catch (Exception e) {
			System.out.println("에러~");
			return false;
		}
		
		return num>0;
	}

}
