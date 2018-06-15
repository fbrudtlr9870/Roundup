package com.proj.rup.product.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
	
	@RequestMapping("/product/productSearch.do")
	public ModelAndView productSearch(@RequestParam String searchKeyword) {
		ModelAndView mav=new ModelAndView();
		logger.info(searchKeyword);
		System.out.println(searchKeyword);
		mav.addObject("searchKeyword", searchKeyword);
		return mav;
	}
}
