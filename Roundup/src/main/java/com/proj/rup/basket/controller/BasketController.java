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
import com.proj.rup.member.model.service.MemberService;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;

@Controller
public class BasketController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private BasketService basketService = new BasketServiceImpl();
	@Autowired
	private MemberService memberService;
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@RequestMapping("/basket/selectBasketList.do")
	public ModelAndView selectBasketList(@RequestParam(value="memberId") String memberId) {
		
		ModelAndView mav = new ModelAndView();
			
		List<BasketProduct> basketList = basketService.selectBasketList(memberId);
		Member m = memberService.selectOneMember(memberId);
		MemberAddress ma = purchaseService.selectMemberInfo(memberId);
		logger.debug("list@BasketController="+basketList);

		mav.addObject("member",m);
		mav.addObject("memberAddress",ma);
		mav.addObject("basketList", basketList);
		mav.setViewName("/basket/basket");
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
