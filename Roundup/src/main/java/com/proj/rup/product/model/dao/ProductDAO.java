package com.proj.rup.product.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Brand;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.Product_File;

public interface ProductDAO {

	String fileInfo(int productId);


	List<Product> reSearch(Map<String, Object> map);


	List<Product> productSearch(String searchKeyword);
	
	void updateProduct(Product vo);
	
	void deleteProduct(int productId);


	int insertProduct(Product p);


	int insertProductFile(Product_File pf);


	int selectCategoryLevel(int categoryNo);


	int insertProductCategory(Map<String, Integer> map);


	List<Product> selectNewProduct();


	List selectBrandList();


	List seleceCategoryList();


	List selectChildCategory(int categoryNo);




	


	
	

}
