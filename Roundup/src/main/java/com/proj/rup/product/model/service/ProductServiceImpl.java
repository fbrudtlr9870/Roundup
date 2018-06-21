package com.proj.rup.product.model.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.member.model.dao.MemberDAO;
import com.proj.rup.product.model.dao.ProductDAO;
import com.proj.rup.product.model.vo.Product;
@Service
public class ProductServiceImpl<ProductVO> implements ProductService {

    
    @Autowired
	private ProductDAO productDAO;

    //상품목록 
    @Override
	public List<Product> productSearch(String searchKeyword) {
		return productDAO.productSearch(searchKeyword); //여기를 어떻게 고쳐야할지...고민이 됨.
	}



    //상품추가
    @Override
    public void insertProduct(Product vo) {
    	productDAO.insertProduct(vo);
    }
    //상품수정
    @Override
    public void updateProduct(Product vo) {
    	productDAO.updateProduct(vo);
    }
    //상품삭제
    @Override
    public void deleteProduct(int productId) {
    	productDAO.deleteProduct(productId);
    }
    //상품이미지 삭제를 위한 이미지파일 정보
    @Override
    public String fileInfo(int productId) {
        return productDAO.fileInfo(productId);
    }



	@Override
	public List reSearch(Map map) {
		return productDAO.reSearch(map);
	}



}
