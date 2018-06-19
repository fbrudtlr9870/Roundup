package com.proj.rup.product.model.service;

import java.util.List;

import com.proj.rup.product.model.vo.Product;

public interface ProductService<ProductVO> {

	List<Product> productSearch(String searchKeyword);

	void insertProduct(Product vo);

	void updateProduct(Product vo);

	void deleteProduct(int productId);

	String fileInfo(int productId);
}



