package com.proj.rup.product.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Repository;

import com.proj.rup.product.model.vo.Product;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Inject
    SqlSession sqlSession;

	@Autowired
	private SqlSessionTemplate session;
    
	//상훈 오빠가 추가한것
	@Override
	public List<Product> productSearch(String searchKeyword) {
		return session.selectList("product.productSearch", searchKeyword);
	}

    //상품추가
    @Override
    public void insertProduct(Product vo) {
        sqlSession.insert("product.insertProduct", vo);
    }
    //상품수정
    @Override
    public void updateProduct(Product vo) {
        sqlSession.update("product.updateProduct", vo);
    }
    //상품삭제
    @Override
    public void deleteProduct(int productId) {
        sqlSession.delete("product.deleteProduct", productId);
    }
    //상품이미지 삭제를 위한 이미지파일 정보
    @Override
    public String fileInfo(int productId) {
        return sqlSession.selectOne("product.fileInfo",productId);
    }

	@Override
	public List<Product> getallProduct(String getAllProduct) {
		//아직 여기에 뭘 삽입할지 모르겠음
		return null;
	}

	

}
