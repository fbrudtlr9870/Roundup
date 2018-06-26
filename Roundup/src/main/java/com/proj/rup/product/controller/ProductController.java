package com.proj.rup.product.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.proj.rup.product.model.service.ProductService;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.Product_File;

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
		//-------------------------------------------------------------------------------------키워드로 네이버 블로그 검색------------------------------
		String clientId = "vbEkw23fbdDmfyg_CYg9";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "iTpsbroJuP";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchKeyword+" 후기", "UTF-8");
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
		//-------------------------------------------------------------------------------------키워드로 네이버 블로그 검색 끝------------------------------
        List<Product> list=productService.productSearch(searchKeyword);
        mav.addObject("searchList", list);
		return mav;
	}
	@RequestMapping("/product/reSearch.do")
	public ModelAndView reSearch(@RequestParam String searchKeyword,@RequestParam String[] brand,@RequestParam int categoryselect,@RequestParam int price1,@RequestParam int price2) {
		ModelAndView mav=new ModelAndView();
		System.out.println("검색키워드="+searchKeyword);
		for(String s:brand) {
			System.out.println("브랜드="+s);
		}
		System.out.println(categoryselect);
		System.out.println(price1+"~"+price2+"범위");
		if(brand.length<2)
			brand=new String[] {"CU","GS25","7ELEVEN","MINISTOP","EMART24"};
		Map<String,Object> map=new HashMap<String, Object>();
		int categoryArr[]= {};
		if(categoryselect==1) {
			categoryArr= new int[]{1,7,8,9,10,27,28,29,30};			
		}else if(categoryselect==2) {
			 categoryArr= new int[]{2,11,12,13,14,31,32,33,34,35,36,37,38,39};
		}else if(categoryselect==3) {
			 categoryArr= new int[]{3,15,16,17};
		}else if(categoryselect==4) {
			 categoryArr= new int[]{4,18,19,20};
		}else if(categoryselect==5) {
			 categoryArr= new int[]{5,21,22};
		}else if(categoryselect==6) {
			 categoryArr= new int[]{6,23,24,25,26};
		}else if(categoryselect==7) {
			 categoryArr= new int[]{7,27,28};
		}else if(categoryselect==8) {
			 categoryArr= new int[]{8,29,30};
		}else if(categoryselect==9) {
			 categoryArr= new int[]{9};
		}else if(categoryselect==10) {
			 categoryArr= new int[]{10};
		}else if(categoryselect==11) {
			 categoryArr= new int[]{11};
		}else if(categoryselect==12) {
			 categoryArr= new int[]{12,31,32};
		}else if(categoryselect==13) {
			 categoryArr= new int[]{13,33,34,35,36};
		}else if(categoryselect==14) {
			 categoryArr= new int[]{14,37,38,39};
		}else if(categoryselect==15) {
			 categoryArr= new int[]{15};
		}else if(categoryselect==16) {
			 categoryArr= new int[]{16};
		}else if(categoryselect==17) {
			 categoryArr= new int[]{17};
		}else if(categoryselect==18) {
			 categoryArr= new int[]{18};
		}else if(categoryselect==19) {
			 categoryArr= new int[]{19};
		}else if(categoryselect==20) {
			 categoryArr= new int[]{20};
		}else if(categoryselect==21) {
			 categoryArr= new int[]{21};
		}else if(categoryselect==22) {
			 categoryArr= new int[]{22};
		}else if(categoryselect==23) {
			 categoryArr= new int[]{23};
		}else if(categoryselect==24) {
			 categoryArr= new int[]{24};
		}else if(categoryselect==25) {
			 categoryArr= new int[]{25};
		}else if(categoryselect==26) {
			 categoryArr= new int[]{26};
		}else if(categoryselect==27) {
			 categoryArr= new int[]{27};
		}else if(categoryselect==28) {
			 categoryArr= new int[]{28};
		}else if(categoryselect==29) {
			 categoryArr= new int[]{29};
		}else if(categoryselect==30) {
			 categoryArr= new int[]{30};
		}else if(categoryselect==31) {
			 categoryArr= new int[]{31};
		}else if(categoryselect==32) {
			 categoryArr= new int[]{32};
		}else if(categoryselect==33) {
			 categoryArr= new int[]{33};
		}else if(categoryselect==34) {
			 categoryArr= new int[]{34};
		}else if(categoryselect==35) {
			 categoryArr= new int[]{35};
		}else if(categoryselect==36) {
			 categoryArr= new int[]{36};
		}else if(categoryselect==37) {
			 categoryArr= new int[]{37};
		}else if(categoryselect==38) {
			 categoryArr= new int[]{38};
		}else if(categoryselect==39) {
			 categoryArr= new int[]{39};
		}else {
			categoryArr= new int[]{1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31,32,33,34,35,36,37,38,39};
		}
		map.put("searchKeyword", searchKeyword);
		map.put("brand", brand);
		map.put("categoryArr", categoryArr);
		map.put("price1", price1);
		map.put("price2", price2);
		//-------------------------------------------------------------------------------------키워드로 네이버 블로그 검색------------------------------
		String clientId = "vbEkw23fbdDmfyg_CYg9";//애플리케이션 클라이언트 아이디값";
        String clientSecret = "iTpsbroJuP";//애플리케이션 클라이언트 시크릿값";
        try {
            String text = URLEncoder.encode(searchKeyword+" 후기", "UTF-8");
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
		//-------------------------------------------------------------------------------------키워드로 네이버 블로그 검색 끝------------------------------
        List<Product> list=productService.reSearch(map);
        mav.addObject("searchList", list);
        mav.setViewName("product/productSearch");
		return mav;
	}

	//상품등록
	@RequestMapping("/product/productEnroll.do")
	public ModelAndView pruductEnroll() {
		ModelAndView mav = new ModelAndView();
		
		
		mav.setViewName("product/productEnroll");
		return mav;
	}
	
	@RequestMapping("/product/autoComplete.do")
	@ResponseBody
	public List<Product> autoCompleate(@RequestParam String autoKeyword) {
		logger.debug("오토키워드 ajax시작"+autoKeyword);
		List<Product> list=productService.productSearch(autoKeyword);
		return list;

	}
	
	@RequestMapping("/product/productEnrollEnd.do")
	public ModelAndView productEnrollEnd(Product p,@RequestParam(value="upFile") MultipartFile upFile,HttpServletRequest request) {
		ModelAndView mav = new ModelAndView();
		logger.debug("상품등록요청");
		logger.debug("upFile : "+upFile.getOriginalFilename());
		try {	
			//첨부파일 이름 설정/upload폴더에 저장로직
			String saveDirectory = request.getSession().getServletContext().getRealPath("/resources/upload/productFile");
			
			String originalFileName = upFile.getOriginalFilename();
			String ext = originalFileName.substring(originalFileName.lastIndexOf(".")+1);
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMdd_HHmmssSSS");
			int rndNum = (int)(Math.random()*1000);
			String renamedFileName = sdf.format(new Date(System.currentTimeMillis()))+"_"+rndNum+"."+ext;
			
			try {
				upFile.transferTo(new File(saveDirectory+"/"+renamedFileName));
			} catch (IllegalStateException | IOException e) {
				e.printStackTrace();
			}
			
			Product_File pf = new Product_File();
			pf.setOriginalFilename(originalFileName);
			pf.setRenamedFilename(renamedFileName);
			
			logger.debug("productFile@productController : "+pf);
			logger.debug("product@productController : "+p);
			
			//비지니스 로직
			int result = productService.insertProduct(p,pf);
			
			//view단 분기
			String loc = "/";
			String msg = "";
			
			if(result>0) {
				msg="상품등록 성공!";
			}else {
				msg="상품등록 실패!";
			}
			
			mav.addObject("msg",msg);
			mav.addObject("loc",loc);
			mav.setViewName("common/msg");
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return mav;
	}
	

	//메일테스트
	@RequestMapping("/product/mailTest.do")
	public ModelAndView mailTest() {
		ModelAndView mav = new ModelAndView();
		return mav;
	}

	@RequestMapping("/product/selectNewProduct.do") 
	@ResponseBody
	public Map<String, Object> selectNewProduct(HttpServletResponse response) {
		List<Product> productList = productService.selectNewProduct();
	    System.out.println("productList" + productList);
	    
		Map<String, Object> map = new HashMap<>();
		map.put("productList", productList);
		
		return map;
	}

}
