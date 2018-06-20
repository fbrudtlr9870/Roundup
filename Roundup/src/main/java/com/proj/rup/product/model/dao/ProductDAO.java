package com.proj.rup.product.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Product;

public interface ProductDAO {

	String fileInfo(int productId);


	List<Product> reSearch(Map<String, Object> map);


	List<Product> productSearch(String searchKeyword);
	
	void updateProduct(Product vo);
	void insertProduct(Product vo);
	void deleteProduct(int productId);
	
	

}
