package com.proj.rup.product.model.service;

import java.util.List;
import javax.inject.Inject;

import org.springframework.stereotype.Service;
import com.proj.rup.product.model.dao.ProductDAO;
import com.proj.rup.product.model.vo.Product;

@Service
public class ProductServiceImpl<ProductVO> implements ProductService {

    @Inject
    ProductDAO productDao;
    
    
    @Override
	public List<Product> productSearch(String searchKeyword) {
		return productDao.productSearch(searchKeyword); //productDAO가 아니라 productDao 아닌가요?
	}

    //상품추가
    @Override
    public void insertProduct(Product vo) {
        productDao.insertProduct(vo);
    }
    
    //상품수정
    @Override
    public void updateProduct(Product vo) {
        productDao.updateProduct(vo);
    }
    //상품삭제
    @Override
    public void deleteProduct(int productId) {
        productDao.deleteProduct(productId);
    }
    
    //상품이미지 삭제를 위한 이미지파일 정보
    @Override
    public String fileInfo(int productId) {
        return productDao.fileInfo(productId);
    }


}
