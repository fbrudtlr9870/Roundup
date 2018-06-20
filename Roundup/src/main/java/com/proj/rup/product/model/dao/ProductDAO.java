package com.proj.rup.product.model.dao;

import java.util.List;

import com.proj.rup.product.model.vo.Product;

public interface ProductDAO {

	String fileInfo(int productId);

	List<Product> productSearch(String searchKeyword);
	
	void updateProduct(Product vo);
	void insertProduct(Product vo);
	void deleteProduct(int productId);

	List<Product> getallProduct(String getAllProduct);
	
	
}
