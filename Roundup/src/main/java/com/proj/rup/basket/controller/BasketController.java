package com.proj.rup.basket.controller;

import java.util.List;

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
import com.proj.rup.basket.model.vo.Basket;

@Controller
public class BasketController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BasketService basketService = new BasketServiceImpl();
	
	@RequestMapping("/basket/selectBasketList.do")
	public ModelAndView selectBasketList(@RequestParam(value="memberId") String memberId) {
		
		ModelAndView mav = new ModelAndView();
			
		List<Basket> basketList = basketService.selectBasketList(memberId);
		logger.debug("list@BasketController="+basketList);
		System.out.println("Controller장바구니----------------" + basketList);

		mav.addObject("basketList", basketList);
		mav.setViewName("/basket/basket");
		return mav;
	}
	
	@RequestMapping("/basket/deleteBasket.do")
	@ResponseBody
	public String deleteBasket(@RequestParam(value="basketNo") int basketNo) {
		
		basketService.deleteBasket(basketNo);

		return "success";
		/*return "redirect:/";*/
	}
}
