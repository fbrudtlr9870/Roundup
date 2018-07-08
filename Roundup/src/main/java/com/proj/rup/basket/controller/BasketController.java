package com.proj.rup.basket.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.basket.model.service.BasketService;
import com.proj.rup.basket.model.service.BasketServiceImpl;
import com.proj.rup.basket.model.vo.BasketProduct;

@Controller
public class BasketController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BasketService basketService = new BasketServiceImpl();
	
	@RequestMapping("/basket/selectBasketList.do")
	public ModelAndView selectBasketList(@RequestParam(value="memberId") String memberId) {
		
		ModelAndView mav = new ModelAndView();
			
		List<BasketProduct> basketList = basketService.selectBasketList(memberId);
		logger.debug("list@BasketController="+basketList);

		mav.addObject("basketList", basketList);
		mav.setViewName("/member/test2");
		return mav;
	}
	
	@RequestMapping("/basket/deleteBasket.do")
	@ResponseBody
	public String deleteBasket(@RequestParam(value="basketNo") String basketNo) {
		
		if(!basketNo.contains("/")) {
			basketService.deleteBasket(Integer.parseInt(basketNo));
		}
		else {
			String[] basketNoList = basketNo.split("/");
			for(int i=0; i<basketNoList.length; i++) {
				basketService.deleteBasket(Integer.parseInt(basketNoList[i]));
			}
		}
			
		return "redirect:/";
	}
	
	
	@RequestMapping("/basket/updateBasket.do")
	@ResponseBody
	public String updateBasket(@RequestParam(value="basketNo") int basketNo, @RequestParam(value="productAmount") int productAmount) {
		
		Map<String, Integer> map = new HashMap<String, Integer>();
		
		map.put("basketNo", basketNo);
		map.put("productAmount", productAmount);
		
		basketService.updateBasket(map);
		
		return "redirect:/";
	}
	
	@RequestMapping("/basket/insertBasket.do")
	public String insertBasket(@RequestParam(value="productNo") int productNo,
							   @RequestParam(value="productAmount") int productAmount,
							   @RequestParam(value="memberId") String memberId) {
		Map<String, Object> map = new HashMap<String, Object>();
		
		map.put("productNo", productNo);
		map.put("productAmount", productAmount);
		map.put("memberId", memberId);

		basketService.insertBasket(map);
		
		return "redirect:/";
	}
	
}
