package com.proj.rup.product.model.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class ProductDAOImpl implements ProductDAO {

    @Inject
    SqlSession sqlSession;

    //상품목록
    
    
    //상품상세
    

    //상품추가
    @Override
    public void insertProduct(ProductVO vo) {
        sqlSession.insert("product.insertProduct", vo);
    }
    //상품수정
    @Override
    public void updateProduct(ProductVO vo) {
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

}
