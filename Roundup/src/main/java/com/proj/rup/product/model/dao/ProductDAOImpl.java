package com.proj.rup.product.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.proj.rup.product.model.vo.Product;

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

    //상품추가
    @Override
    public void insertProduct(Product vo) {
    	session.insert("product.insertProduct", vo);
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


	

}
