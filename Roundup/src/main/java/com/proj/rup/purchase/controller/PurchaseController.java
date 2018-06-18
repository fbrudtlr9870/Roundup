package com.proj.rup.purchase.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;

@Controller
public class PurchaseController {

	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	
	/*@RequestMapping()*/
}
