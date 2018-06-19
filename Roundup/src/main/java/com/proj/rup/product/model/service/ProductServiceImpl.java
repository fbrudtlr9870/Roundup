package com.proj.rup.product.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.proj.rup.product.model.dao.ProductDAO;
import com.proj.rup.product.model.vo.Product;
@Service
public class ProductServiceImpl implements ProductService {
	@Autowired
	private ProductDAO productDAO;

	@Override
	public List<Product> productSearch(String searchKeyword) {
		return productDAO.productSearch(searchKeyword);
	}
}
