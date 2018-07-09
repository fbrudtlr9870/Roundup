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
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.basket.model.service.BasketService;
import com.proj.rup.basket.model.service.BasketServiceImpl;
import com.proj.rup.basket.model.vo.BasketProduct;
import com.proj.rup.member.model.service.MemberService;
import com.proj.rup.member.model.vo.Address;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.purchase.iamport.IamportClient;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;
import com.proj.rup.purchase.model.vo.Purchase;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

import com.siot.IamportRestClient.request.CancelData;

@Controller
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@Autowired
	private BasketService basketService = new BasketServiceImpl();

	@Autowired
	private MemberService memberService;
	
	@RequestMapping("/purchase/purchase.do")
	public ModelAndView purchase(@RequestParam(value="basketNo") String basketNo,
								 @RequestParam(value="memberId") String memberId) {
		ModelAndView mav = new ModelAndView();
		
		Member m = memberService.selectOneMember(memberId);
		mav.addObject("member",m);
		
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
							@RequestParam(value="basketNo", required=false) String basketNo,
							@RequestParam(value="membership") int membership,
							@RequestParam(value="total_price") int total_price,
							@RequestParam(value="imp_uid", required=false) String imp_uid) {
		
		// total_price 상품 금액 + 배송비 - 적립금 => 최종 결제 금액
		logger.debug(product_no+","+member_id+","+product_amount+","+address+","+zip_code+","+basketNo+","+membership+","+total_price+","+imp_uid);
		int result = 0;
		String returnMsg = "";

		if(!product_no.contains("/")) {
			// purchase 테이블에 값 넣기
			Purchase purchase = new Purchase(0, Integer.parseInt(product_no), member_id, null, Integer.parseInt(product_amount), address, zip_code, imp_uid);
			result = purchaseService.insertPurchase(purchase);
			logger.debug("result@purchaseEnd : "+result);
			// purchase_complete 테이블에 값 넣기
			PurchaseComplete purchaseComplete = new PurchaseComplete(0, purchase.getPurchase_no(), Integer.parseInt(product_no), member_id, null, Integer.parseInt(product_amount), address, zip_code, imp_uid, total_price, membership);
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
				Purchase purchase = new Purchase(0, Integer.parseInt(productNoList[i]), member_id, null, Integer.parseInt(amountList[i]), address, zip_code, imp_uid);
				
				if(purchaseService.insertPurchase(purchase) > 0) {
					// purchase_complete 테이블에 값 넣기
					PurchaseComplete purchaseComplete = new PurchaseComplete(0, purchase.getPurchase_no(), Integer.parseInt(productNoList[i]), member_id, null, Integer.parseInt(amountList[i]), address, zip_code, imp_uid, total_price, membership);
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
		
		logger.debug("result@purchaseEnd : "+result);
		
		if(result > 0) {
			// membership 테이블에 값 넣기
			Map<String, Object> map = new HashMap<>();
			map.put("member_id", member_id);
			map.put("membership", membership);
			map.put("totalPrice", total_price-2000);	// 적립금은 배송비를 뺀 금액에서만 
			
			memberService.updateMembership(map);
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
							   @RequestParam(value="productNo") int productNo,
							   @RequestParam(value="memberId") String memberId) {
		
		ModelAndView mav = new ModelAndView();
		
		Product buyNow = purchaseService.buyNow(productNo);
		Member m = memberService.selectOneMember(memberId);

		mav.addObject("productAmount", productAmount);
		mav.addObject("buyNow", buyNow);
		mav.addObject("member",m);
		
		mav.setViewName("/purchase/purchase");
		
		return mav;
	}
	
	@RequestMapping(value="/purchase/purchaseCancel.do", method = RequestMethod.POST)
	@ResponseBody
	public String purchaseCancel(@RequestParam(value="imp_uid") String imp_uid) {
		IamportClient ic = new IamportClient("5698549912038284", "m95q6GPCjLsPaoOhBUBu8rUtTGdKzL9WVfm1WbDfW657uTp6O0AXrvrlbE6LpfHku3mqfZFb6LjAEIHt");
		String returnmsg = "";
		
		System.out.println("###########################"+ic.cancelPaymentByImpUid(new CancelData(imp_uid, true)));
		if(ic.cancelPaymentByImpUid(new CancelData(imp_uid, true)) != null) {
			returnmsg = "success";
			purchaseService.deletePurchaseComplete(imp_uid);
			purchaseService.deletePurchase(imp_uid);
		} else {
			returnmsg = "fail";
		}
		
		return returnmsg;
	}
	
}
