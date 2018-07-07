package com.proj.rup.crawling.model.crawling;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.http.client.ClientProtocolException;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.nodes.Element;
import org.jsoup.select.Elements;
import org.springframework.stereotype.Component;

@Component
public class JavaWebCrawler {


	public List<Map<String,String>> test(String url) throws ClientProtocolException, IOException {
		String result = "";

		
		/*
		//#1. apache 라이브러리를 사용
		// 1. 가져올 HTTP 주소 세팅
	    HttpPost http = new HttpPost(url);
	    // 2. 가져오기를 실행할 클라이언트 객체 생성
	    HttpClient httpClient = HttpClientBuilder.create().build();
	    // 3. 실행 및 실행 데이터를 Response 객체에 담음
	    HttpResponse response = httpClient.execute(http);
	    // 4. Response 받은 데이터 중, DOM 데이터를 가져와 Entity에 담음
	    HttpEntity entity = response.getEntity();
	    // 5. Charset을 알아내기 위해 DOM의 컨텐트 타입을 가져와 담고 Charset을 가져옴 
	    ContentType contentType = ContentType.getOrDefault(entity);
        Charset charset = contentType.getCharset();
        // 6. DOM 데이터를 한 줄씩 읽기 위해 Reader에 담음 (InputStream / Buffered 중 선택은 개인취향) 
	    BufferedReader br = new BufferedReader(new InputStreamReader(entity.getContent(), charset));
	    // 7. 가져온 DOM 데이터를 담기위한 그릇
	    StringBuffer sb = new StringBuffer();
	    // 8. DOM 데이터 가져오기
	    String line = "";
	    while((line=br.readLine()) != null){
	    	sb.append(line+"\n");
	    }
	    // 9. 가져온 아름다운 DOM을 보자
	    result  = sb.toString();
	    //System.out.println(result);
		// 10. Jsoup으로 파싱해보자.
		//Document doc = Jsoup.parse(sb.toString());
	    */
	    
		//#2.Jsoup라이브러리 사용
	    Document doc = Jsoup.connect(url).get();
	    result = doc.data();
	    
	    //특정엘레먼트 찾기
	    Elements elems = doc.select("ul#listUl li");
//	    System.out.println("elems="+elems);
//	    System.out.println("elems="+elems.size());
	    List<Map<String,String>> eventList = new ArrayList<>();
	    
	    //elems의 마지막요소는 +(More)이라 건너뜀.
	    for(int i=0; i<elems.size()-1; i++){
	    	Element e = elems.get(i);
	    	Element a = e.select("a").get(0);
	    	//System.out.println("a="+a);
	    	Element dl = e.select("div.event_over").get(0).select("dl").get(0);
	    	//System.out.println("div="+div);
	    	
	    	Map<String,String> map = new HashMap<>();
	    	map.put("a.href", a.attr("href"));
	    	map.put("img.src", a.select("img").get(0).attr("src"));
	    	map.put("dt", dl.select("dt").get(0).text());
	    	map.put("dd", dl.select("dd.date").get(0).text());
	    	eventList.add(map);
	    }
	    System.out.println("eventList="+eventList);

	    return eventList;
	}
	
	public List<Map<String, String>> emartTest(String url) throws IOException {
		String result = "";
		//#2.Jsoup라이브러리 사용
	    Document doc = Jsoup.connect(url).get();
	    result = doc.data();
	    
	    //특정엘레먼트 찾기
	    Elements elems = doc.select("table.listTable tbody tr");
//	    System.out.println("elems="+elems);
//	    System.out.println("elems="+elems.size());
	    List<Map<String,String>> eventList = new ArrayList<>();
	    
	    //elems의 마지막요소는 +(More)이라 건너뜀.
	    for(int i=0; i<elems.size()-1; i++){
	    	Element e = elems.get(i);
	    	Element a = e.select("a").get(0);
	    	Elements td = e.select("td");
	    	
	    	System.out.println("td="+td);
	    	String title = td.get(2).select("a").html();
	    	String date = td.get(3).html();
	    	System.out.println("title:"+title);
	    	System.out.println("date"+date);
	    	
	    	String href = a.attr("href");
	    	
	    	System.out.println(href.substring(1));
	    	
//	    	Element dl = e.select("div.event_over").get(0).select("dl").get(0);
	    	//System.out.println("div="+div);
	    	
	    	Map<String,String> map = new HashMap<>();
	    	map.put("date", date);
	    	map.put("title", title);
	    	map.put("href", href.substring(1));
	    	map.put("img.src", a.select("img").get(0).attr("src"));
//	    	map.put("dt", dl.select("dt").get(0).text());
//	    	map.put("dd", dl.select("dd.date").get(0).text());
	    	eventList.add(map);
	    }
	    System.out.println("eventList="+eventList);

	    return eventList;
	}

	public List<Map<String, String>> getCUInfo(String url) throws IOException {
		String result = "";
		//#2.Jsoup라이브러리 사용
	    Document doc = Jsoup.connect(url).get();
	    result = doc.data();
	    
	    //특정엘레먼트 찾기
	    Elements elems = doc.select("div.list_style01 table tbody tr");
	    System.out.println("elems="+elems);
//	    System.out.println("elems="+elems.size());
	    List<Map<String,String>> eventList = new ArrayList<>();
	    
	    for(int i=0;i<elems.size();i++) {
	    	Element tr = elems.get(i);
	    	Element imgsrc = tr.select("td div a").get(0).select("img").get(0);
	    	Element href = tr.select("td div a").get(1);
	    	System.out.println("tr:"+tr);
	    	System.out.println("imgsrc : "+imgsrc.attr("src"));
	    	
	    	Element title = tr.select("td div a").get(1).select("a").get(0);
	    	System.out.println("title:"+title.html());
	    	
	    	Element date = tr.select("td").get(3);
	    	System.out.println("date:"+date.html());
	    	
	    	System.out.println("href:"+href.attr("href"));
	    	
	    	Map<String,String> map = new HashMap<>();
	    	
	    	map.put("imgsrc",imgsrc.attr("src"));
	    	map.put("title",title.html());
	    	map.put("date", date.html());
	    	map.put("href", href.attr("href"));
	    	
	    	eventList.add(map);
	    	
	    }

	    return eventList;
	}

	public List<Map<String, String>> getMinistop(String url) throws IOException {
		String result = "";
		//#2.Jsoup라이브러리 사용
	    Document doc = Jsoup.connect(url).get();
	    result = doc.data();
	    
	    //특정엘레먼트 찾기
	    Elements elems = doc.select("div.eventlist_li li a");
//	    System.out.println("elems="+elems);
//	    System.out.println("elems="+elems.size());
	    List<Map<String,String>> eventList = new ArrayList<>();
	    
	    for(int i=0;i<elems.size();i++) {
	    	Element li = elems.get(i);
	    	System.out.println("li"+"["+i+"]"+li);
	    	
	    	Element img = li.select("a").get(0).select("img").get(0);
	    	System.out.println("img:"+img.attr("src").substring(2));
	    	
	    	Element title = li.select("ul").get(0).select("li").get(0).select("strong").get(0);
	    	System.out.println("title:"+title.html());
	    	
	    	Element date = li.select("ul").get(0).select("li").get(1).select("li").get(0);
	    	System.out.println("date:"+date.html());
	    	
	    	Element href = li.select("a").get(0);
	    	System.out.println("href:"+href.attr("href"));
//	    	Element img = li.select("img").get(0);
//	    	Element title = li.select("ul").get(0).select("li").get(0).select("strong").get(0); 
//	    	Element date = li.select("ul").get(0).select("li").get(1).select("li").get(0); 
//	    	String imgsrc = img.attr("src");
//	    	
//	    	
//	    	System.out.println("img : "+img);
//	    	System.out.println("mini li:"+li);
//	    	System.out.println("imgsrc: "+imgsrc.substring(2));
//	    	System.out.println("title : "+title.html());
//	    	System.out.println("date:"+date.html());
//	    	
	    	Map<String,String> map = new HashMap<>();
	    	
	    	map.put("imgsrc", img.attr("src").substring(2));
	    	map.put("title",title.html());
	    	map.put("date", date.html());
	    	map.put("href", href.attr("href"));
	    	
	    	eventList.add(map);
	    	
	    }

	    return eventList;
	}

}



