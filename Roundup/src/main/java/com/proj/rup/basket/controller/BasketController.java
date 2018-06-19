package com.proj.rup.basket.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	//@RequestParam(value="memberId")String memberId
	public ModelAndView selectBasketList() {
		
		ModelAndView mav = new ModelAndView();
			
		List<Basket> list = basketService.selectBasketList("dfd");
		logger.debug("list@freeboardController="+list);
		System.out.println("장바구니----------------" + list);
		

		mav.addObject("list", list);
		mav.setViewName("/basket/basket");
		return mav;
	}
	
}
