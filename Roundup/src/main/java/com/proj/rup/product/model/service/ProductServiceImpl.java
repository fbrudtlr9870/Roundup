package com.proj.rup.product.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.proj.rup.product.model.dao.ProductDAO;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;
}
