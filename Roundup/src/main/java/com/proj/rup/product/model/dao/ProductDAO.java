
package com.proj.rup.product.model.dao;

import java.util.List;
import java.util.Map;

import com.proj.rup.product.model.vo.Brand;
import com.proj.rup.product.model.vo.Category;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.ProductCategoryLevel;
import com.proj.rup.product.model.vo.Product_File;

public interface ProductDAO {

	String fileInfo(int productId);


	List<Product> reSearch(Map<String, Object> map);


	List<Product> productSearch(String searchKeyword);
	
	
	
	void deleteProduct(int productId);


	int insertProduct(Product p);


	int insertProductFile(Product_File pf);


	int selectCategoryLevel(int categoryNo);


	int insertProductCategory(Map<String, Integer> map);


	List<Product> selectNewProduct();


	List<Brand> selectBrandList();


	List<Category> selectCategoryList();


	List selectHotProduct();

	int rowprice(String searchKeyword);


	int avgprice(String searchKeyword);


	Product popmenu(String searchKeyword);


	Product repopmenu(Map<String, Object> map);


	int rerowprice(Map map);


	int reavgprice(Map map);

	List selecteAllCategoryList();


	List categoryLevelOneSearch(Map map);


	List<Category> selectChildCategory(int categoryNo);


	List<ProductCategoryLevel> selectCategory(String searchKeyword);


	Category selectParentCategory(int parent_category);

	List productSearch(String[] keyword);


	int rowprice(Map map);


	int avgprice(Map map);


	Product popmenu(Map map);


	List selectAllProductList(int cPage, int numPerPage);


	int selectTotalProduct();


	Map<String,Object> selectProductFileOne();


	Product productView(int product_no);


	int updateProduct(Product p);


	int updateProductCategory(Map<String, Integer> map);


	int updateProductFile(Product_File pf);



}

