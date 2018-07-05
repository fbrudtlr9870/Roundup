package com.proj.rup.product.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Repository;

import com.proj.rup.product.model.vo.Brand;
import com.proj.rup.product.model.vo.Category;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.ProductCategoryLevel;
import com.proj.rup.product.model.vo.Product_File;

@Repository
public class ProductDAOImpl implements ProductDAO {

	@Autowired
	private SqlSessionTemplate session;
    
    //상품목록
	@Override
	public List<Product> productSearch(String searchKeyword) {
		return session.selectList("product.productSearch", searchKeyword);
	}


	@Override
	public List<Product> reSearch(Map<String, Object> map) {
		return session.selectList("product.reSearch", map);
	}

    
    //상품수정
    @Override
    public void updateProduct(Product vo) {
    	session.update("product.updateProduct", vo);
    }
    //상품삭제
    @Override
    public void deleteProduct(int productId) {
    	session.delete("product.deleteProduct", productId);
    }
    //상품이미지 삭제를 위한 이미지파일 정보
    @Override
    public String fileInfo(int productId) {
        return session.selectOne("product.fileInfo",productId);
    }


	@Override
	public int insertProduct(Product p) {
		return session.insert("product.insertProduct",p);
	}


	@Override
	public int insertProductFile(Product_File pf) {
		return session.insert("product.insertProductFile",pf);
	}


	@Override
	public int selectCategoryLevel(int categoryNo) {
		return session.selectOne("product.selectCategoryLevel",categoryNo);
	}


	@Override
	public int insertProductCategory(Map<String, Integer> map) {
		return session.insert("product.insertProductCategory",map);
	}

	//메인에 나오는 상품리스트는 반복적이고 값이 일정한 조회. 따라서 캐시처리해서 서버부하 줄임
	@Cacheable("SelectCache")
	@Override
	public List<Product> selectNewProduct() {
		return session.selectList("product.selectNewProduct");
	}


	@Override
	public List<Brand> selectBrandList() {
		return session.selectList("product.selectBrandList");
	}


	@Override
	public List<Category> selectCategoryList() {
		return session.selectList("product.selectCategoryList");
	}


	@Override
	public List<Category> selectChildCategory(int categoryNo) {
		return session.selectList("product.selectChildCategory",categoryNo);
	}

	@Override
	public List selectHotProduct() {
		return session.selectList("product.selectHotProduct");
	}
	
	@Override
	public int rowprice(String searchKeyword) {
		return session.selectOne("product.rowprice",searchKeyword);
	}


	@Override
	public int avgprice(String searchKeyword) {
		return session.selectOne("product.avgprice",searchKeyword);
	}


	@Override
	public Product popmenu(String searchKeyword) {
		return session.selectOne("product.popmenu",searchKeyword);
	}


	@Override
	public Product repopmenu(Map<String, Object> map) {
		return session.selectOne("product.repopmenu",map);
	}


	@Override
	public int rerowprice(Map map) {
		return session.selectOne("product.rerowprice",map);
	}


	@Override
	public int reavgprice(Map map) {
		return session.selectOne("product.reavgprice",map);
	}


	@Override
	public List selecteAllCategoryList() {
		return session.selectList("product.selecteAllCategoryList");
	}


	@Override
	public List categoryLevelOneSearch(Map map) {
		return session.selectList("product.categoryLevelOneSearch",map);
	}

	@Override
	public List<ProductCategoryLevel> selectCategory(String searchKeyword) {
		return session.selectList("product.selectCategory", searchKeyword);
	}


	@Override
	public Category selectParentCategory(int parent_category) {
		return session.selectOne("product.selectParentCategory", parent_category);
	}

	

}
