package com.proj.rup.product.model.service;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.proj.rup.product.model.dao.ProductDAO;

public interface ProductService {
	@Service
	public class ProductServiceImpl implements ProductService {

	    @Inject
	    ProductDAO productDao;

	    //상품목록
	    
	    
	    //상품상세 
	    
	    

	    //상품추가
	    @Override
	    public void insertProduct(ProductVO vo) {
	        productDao.insertProduct(vo);
	    }
	    //상품수정
	    @Override
	    public void updateProduct(ProductVO vo) {
	        productDao.updateProduct(vo);
	    }
	    //상품삭제
	    @Override
	    public void deleteProduct(int productId) {
	        productDao.deleteProduct(productId);
	    }
	    //삭제를 위한 이미지파일 정보
	    @Override
	    public String fileInfo(int productId) {
	        return productDao.fileInfo(productId);
	    }

	}

	void deleteProduct(int productId);

	String fileInfo(int productId);
}
