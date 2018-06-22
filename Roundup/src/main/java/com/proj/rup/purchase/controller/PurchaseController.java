package com.proj.rup.purchase.controller;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;

@Controller
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@RequestMapping("/purchase/purchase.do")
	public ModelAndView purchase(@RequestParam(value="basketNo") String basketNo) {
		ModelAndView mav = new ModelAndView();
		
		if(!basketNo.contains("/")) {
			BasketProduct purchase = purchaseService.selectPurchaseOne(Integer.parseInt(basketNo));
			mav.addObject("purchase", purchase);
		} else {
			String[] basketNoList = basketNo.split("/");
			List<BasketProduct> purchaseList = new ArrayList<BasketProduct>();
			
			for(int i=0; i<basketNoList.length; i++) {
				purchaseList.add(purchaseService.selectPurchaseOne(Integer.parseInt(basketNoList[i])));
			}
			System.out.println(purchaseList);
			mav.addObject("purchaseList", purchaseList);
		}
		
		mav.setViewName("/purchase/purchase");
		
		return mav;
	}
	
	@RequestMapping("/purchase/purchaseEnd.do")
	public void purchaseEnd(@RequestParam(value="amount") int amount, 
							@RequestParam(value="zip_code") String zip_code, 
							@RequestParam(value="userId") String userId,
							@RequestParam(value="addr") String addr,
							@RequestParam(value="addr_level") int addr_level) {
		System.out.println("구매했다!!!!!!!!!!!!!!");
		System.out.println(amount);
		System.out.println(zip_code);
		System.out.println(userId);		
		System.out.println(addr);		
		System.out.println(addr_level);		
	}
	
	@RequestMapping("/purchase/selectMemberInfo.do")
	@ResponseBody
	public MemberAddress selectMemberInfo(@RequestParam(value="memberId") String memberId) {
		MemberAddress m = purchaseService.selectMemberInfo(memberId);

		return m;
	}
	
	@RequestMapping("/purchase/selectAddrList.do")
	public ModelAndView selectAddrList(@RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView();
		
		List<Address> addrList = purchaseService.selectAddrList(memberId);
		
		mav.addObject("addrList", addrList);
		mav.setViewName("/purchase/selectAddrList");
		
		return mav;
	}
}
