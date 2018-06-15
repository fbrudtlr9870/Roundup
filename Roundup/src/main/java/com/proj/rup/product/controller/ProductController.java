package com.proj.rup.product.controller;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/product/productSearch.do")
	public ModelAndView productSearch(@RequestParam String searchKeyword) {
		ModelAndView mav=new ModelAndView();
		logger.info("검색 키워드 : "+searchKeyword);
		mav.addObject("searchKeyword", searchKeyword);
		
		String clientId = "vbEkw23fbdDmfyg_CYg9";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "iTpsbroJuP";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchKeyword, "UTF-8");
            String apiURL = "https://openapi.naver.com/v1/search/blog?query="+ text+"&display=5&start=1"; // json 결과
            //String apiURL = "https://openapi.naver.com/v1/search/blog.xml?query="+ text; // xml 결과
            URL url = new URL(apiURL);
            HttpURLConnection con = (HttpURLConnection)url.openConnection();
            con.setRequestMethod("GET");
            con.setRequestProperty("X-Naver-Client-Id", clientId);
            con.setRequestProperty("X-Naver-Client-Secret", clientSecret);
            int responseCode = con.getResponseCode();
            BufferedReader br;
            if(responseCode==200) { // 정상 호출
                br = new BufferedReader(new InputStreamReader(con.getInputStream()));
            } else {  // 에러 발생
                br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
            }
            String inputLine;
            StringBuffer response = new StringBuffer();
            while ((inputLine = br.readLine()) != null) {
                response.append(inputLine);
            }
            br.close();
            System.out.println(response.toString());
            mav.addObject("bloginfo", response);
        } catch (Exception e) {
            System.out.println(e);
        }
		
		return mav;
	}
}
