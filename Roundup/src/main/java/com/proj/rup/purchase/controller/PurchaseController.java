package com.proj.rup.purchase.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;

@Controller
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@RequestMapping("/purchase/purchase.do")
	public void purchase() {
		System.out.println("구매한다");
	}
	
	@RequestMapping("/purchase/purchaseEnd.do")
	public void purchaseEnd(@RequestParam int amount) {
		//hyelin
		System.out.println("구매했다!!!!!!!!!!!!!!");
		System.out.println(amount);
	}
}
