
package com.proj.rup.product.model.service;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Brand;
import com.proj.rup.product.model.vo.Category;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.ProductCategoryLevel;
import com.proj.rup.product.model.vo.Product_File;

public interface ProductService<ProductVO> {

	List<Product> productSearch(String searchKeyword);


	List<Product> reSearch(Map<String, Object> map);

	void updateProduct(Product vo);

	void deleteProduct(int productId);

	String fileInfo(int productId);

	int insertProduct(Product p, Product_File pf);

	List<Product> selectNewProduct();


	List<Brand> selectBrandList();


	List<Category> selectCategoryList();


	List<Category> selectChildCategory(int categoryNo);

	List<Product> selectHotProduct();

	int rowprice(String searchKeyword);


	int avgprice(String searchKeyword);


	Product popmenu(String searchKeyword);


	Product repopmenu(Map<String, Object> map);


	int rerowprice(Map<String, Object> map);


	int reavgprice(Map<String, Object> map);


	List<Category> selecteAllCategoryList();


	List<Product> categoryLevelOneSearch(Map<String, Object> map);



	List<ProductCategoryLevel> selectCategory(String searchKeyword);


	Category selectParentCategory(int parent_category);


	List<Product> productSearch(String[] keyword);


	int rowprice(Map<String, Object> map);


	int avgprice(Map<String, Object> map);


	Product popmenu(Map<String, Object> map);


	List<Map<String, String>> selectAllProductList(int cPage, int numPerPage);


	int selectTotalProduct();


}



