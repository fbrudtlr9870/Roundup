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

import com.proj.rup.basket.model.service.BasketService;
import com.proj.rup.basket.model.service.BasketServiceImpl;
import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;
import com.proj.rup.purchase.model.vo.Purchase;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

@Controller
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@Autowired
	private BasketService basketService = new BasketServiceImpl();
	
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
							@RequestParam(value="zip_code") String zip_code,
							@RequestParam(value="basketNo") String basketNo) {
		
		int result = 0;
		String returnMsg = "";
		
		if(!product_no.contains("/")) {
			// purchase 테이블에 값 넣기
			Purchase purchase = new Purchase(0, Integer.parseInt(product_no), member_id, null, Integer.parseInt(product_amount), address, zip_code);
			result = purchaseService.insertPurchase(purchase);
			
			// purchase_complete 테이블에 값 넣기
			PurchaseComplete purchaseComplete = new PurchaseComplete(0, purchase.getPurchase_no(), Integer.parseInt(product_no), member_id, null, Integer.parseInt(product_amount), address, zip_code);
			purchaseService.insertPurchaseComplete(purchaseComplete);
			
			// product_purchase 테이블에 값 넣기 / 프로시저 실행하기
			Map<String, Integer> map = new HashMap<>();
			map.put("product_no", Integer.parseInt(product_no));
			map.put("product_amount", Integer.parseInt(product_amount));
			purchaseService.updateProductPurchase(map);
			
			// 장바구니에서 바로 구매 시 장바구니 목록에서 삭제
			if(result > 0 && !basketNo.equals("")) {
				basketService.deleteBasket(Integer.parseInt(basketNo));
			}
		} else {			
			String[] productNoList = product_no.split("/");
			String[] amountList = product_amount.split("/");
			String[] basketList = basketNo.split("/");
			int count = 0;
			
			for(int i=0; i<productNoList.length; i++) {
				Purchase purchase = new Purchase(0, Integer.parseInt(productNoList[i]), member_id, null, Integer.parseInt(amountList[i]), address, zip_code);
				
				if(purchaseService.insertPurchase(purchase) > 0) {
					// purchase_complete 테이블에 값 넣기
					PurchaseComplete purchaseComplete = new PurchaseComplete(0, purchase.getPurchase_no(), Integer.parseInt(productNoList[i]), member_id, null, Integer.parseInt(amountList[i]), address, zip_code);
					purchaseService.insertPurchaseComplete(purchaseComplete);
					
					// product_purchase 테이블에 값 넣기 / 프로시저 실행하기
					Map<String, Integer> map = new HashMap<>();
					map.put("product_no", Integer.parseInt(productNoList[i]));
					map.put("product_amount", Integer.parseInt(amountList[i]));
					purchaseService.updateProductPurchase(map);
					
					// 장바구니에서 여러 개 구매 시 장바구니 목록에서 삭제
					basketService.deleteBasket(Integer.parseInt(basketList[i]));
					count++;
				}
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
	
	@RequestMapping("/purchase/buyNow.do")
	public ModelAndView buyNow(@RequestParam(value="productAmount") int productAmount,
							   @RequestParam(value="productNo") int productNo) {
		
		ModelAndView mav = new ModelAndView();
		
		Product buyNow = purchaseService.buyNow(productNo);

		mav.addObject("productAmount", productAmount);
		mav.addObject("buyNow", buyNow);
		
		mav.setViewName("/purchase/purchase");
		
		return mav;
	}
	
}
