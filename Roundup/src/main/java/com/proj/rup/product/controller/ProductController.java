package com.proj.rup.product.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

import com.proj.rup.product.model.service.ProductService;

@Controller
public class ProductController {
	@Autowired
	private ProductService productService;
	
	private Logger logger=LoggerFactory.getLogger(getClass());
}
