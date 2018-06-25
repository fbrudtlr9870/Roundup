package com.proj.rup.purchase.controller;

import java.util.ArrayList;
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
	@ResponseBody
	public String purchaseEnd(@RequestParam(value="product_no") String product_no,
							@RequestParam(value="member_id") String member_id,
							@RequestParam(value="product_amount") String product_amount,
							@RequestParam(value="address") String address, 
							@RequestParam(value="zip_code") String zip_code) {

		Map<String, Object> map = new HashMap<>();	
		int result = 0;
		int count = 0;
		String returnMsg = "";
		
		if(!product_no.contains("/")) {
			map.put("product_no", Integer.parseInt(product_no));
			map.put("member_id", member_id);
			map.put("product_amount", Integer.parseInt(product_amount));
			map.put("address", address);
			map.put("zip_code", zip_code);			

			result = purchaseService.insertPurchase(map);
		}
		else {			
			String[] productNoList = product_no.split("/");
			String[] amountList = product_amount.split("/");
			
			for(int i=0; i<productNoList.length; i++) {
				map = new HashMap<>();
				map.put("product_no", Integer.parseInt(productNoList[i]));
				map.put("member_id", member_id);
				map.put("product_amount", Integer.parseInt(amountList[i]));
				map.put("address", address);
				map.put("zip_code", zip_code);	
				
				if(purchaseService.insertPurchase(map)>0);
					count++;
			}
			
			if(count==productNoList.length) {
				result = 1;
			}
		}
		
		if(result > 0) {
			returnMsg = "success";
		} else {
			returnMsg = "fail";
		}

		return returnMsg;
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
