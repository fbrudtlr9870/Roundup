package com.proj.rup.crawling.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.crawling.model.crawling.HeadlessCrawler;
import com.proj.rup.crawling.model.crawling.JavaWebCrawler;


@Controller
public class CrawlingController {
	
	@Autowired
	JavaWebCrawler javaWebCrawler;
	
	@Autowired
	HeadlessCrawler headlessCrawler;
	
	@RequestMapping("/crawling/7-eleven")
	public void crawlerFor7Eleven(Model model){
		List<Map<String,String>> data = null;
		try {
			
			data = javaWebCrawler.test("http://www.7-eleven.co.kr/event/eventList.asp");
		
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("data", data);
		
	}
	@RequestMapping("/crawlingEmart")
	public ModelAndView crawlerEmart() {
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> data = null;
		try {
			data = javaWebCrawler.emartTest("https://www.emart24.co.kr/service/event.asp");
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.addObject("emartCrawlingList",data);
		mav.setViewName("crawling/crawlingEmart");
		return mav;
	}
	@RequestMapping("/crawling/gs25")
	public void crawlerForGS25(Model model){
		List<Map<String,String>> data = null;
		
		data = headlessCrawler.getEventInfo("http://gs25.gsretail.com/gscvs/ko/customer-engagement/event/current-events");
		
		model.addAttribute("data", data);

	}
	
	@RequestMapping("/crawling/ministop")
	public ModelAndView crawlerForMinistop(){
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> data = null;
		
		try {
			data = javaWebCrawler.getMinistop("https://www.ministop.co.kr/MiniStopHomePage/page/event/completelist.do");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("ministopList",data);
		mav.setViewName("crawling/ministop");
		
		return mav;
	}
	
	@RequestMapping("/crawling/cu")
	public ModelAndView crawlerForCKU() {
		ModelAndView mav = new ModelAndView();
		List<Map<String,String>> data = null;
		try {
			data = javaWebCrawler.getCUInfo("http://membership.bgfretail.com/event/event/list.do?viewDiv=1");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.addObject("cuList",data);
		mav.setViewName("crawling/cu");
		return mav;
	}
	
	
}
