package com.proj.rup.product.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.Product_File;

public interface ProductService<ProductVO> {

	List<Product> productSearch(String searchKeyword);


	List<Product> reSearch(Map<String, Object> map);

	void updateProduct(Product vo);

	void deleteProduct(int productId);

	String fileInfo(int productId);

	int insertProduct(Product p, Product_File pf);

	List<Product> selectNewProduct();

}



