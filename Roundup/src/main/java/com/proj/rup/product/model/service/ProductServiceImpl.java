package com.proj.rup.product.model.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.product.model.dao.ProductDAO;
import com.proj.rup.product.model.vo.Category;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.vo.ProductCategoryLevel;
import com.proj.rup.product.model.vo.Product_File;
@Service
public class ProductServiceImpl<ProductVO> implements ProductService {

    
    @Autowired
	private ProductDAO productDAO;

    //상품목록 
    @Override
	public List<Product> productSearch(String searchKeyword) {
		return productDAO.productSearch(searchKeyword); //여기를 어떻게 고쳐야할지...고민이 됨.
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

	@Override
	public int insertProduct(Product p, Product_File pf) {
		int result = 0;
		int categoryLevel=0;
		try {
			result = productDAO.insertProduct(p);
			
			int productNo = p.getProductNo();
			
			if(p.getCategoryNo()>0) {
				categoryLevel = productDAO.selectCategoryLevel(p.getCategoryNo());
	
				Map<String,Integer> map = new HashMap<>();
				
				map.put("productNo", productNo);
				map.put("categoryNo", p.getCategoryNo());
				map.put("categoryLevel", categoryLevel);
				
				if(categoryLevel>0) {
					result = productDAO.insertProductCategory(map);
				}
			}
			
			if(pf!=null) {
				pf.setProductNo(productNo);
				result = productDAO.insertProductFile(pf);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;
	}

	@Override
	public List selectNewProduct() {
		return productDAO.selectNewProduct();
	}

	@Override
	public List selectBrandList() {
		return productDAO.selectBrandList();
	}

	@Override
	public List selectCategoryList() {
		return productDAO.selectCategoryList();
	}

	@Override
	public List selectChildCategory(int categoryNo) {
		return productDAO.selectChildCategory(categoryNo);
	}


	@Override
	public List selectHotProduct() {
		return productDAO.selectHotProduct();
	}
	
	@Override
	public int rowprice(String searchKeyword) {
		return productDAO.rowprice(searchKeyword);
	}

	@Override
	public int avgprice(String searchKeyword) {
		return productDAO.avgprice(searchKeyword);
	}

	@Override
	public Product popmenu(String searchKeyword) {
		return productDAO.popmenu(searchKeyword);
	}

	@Override
	public Product repopmenu(Map map) {
		return productDAO.repopmenu(map);
	}

	@Override
	public int rerowprice(Map map) {
		return productDAO.rerowprice(map);
	}

	@Override
	public int reavgprice(Map map) {
		return productDAO.reavgprice(map);
	}

	@Override
	public List selecteAllCategoryList() {
		return productDAO.selecteAllCategoryList();
	}

	@Override
	public List categoryLevelOneSearch(Map map) {
		return productDAO.categoryLevelOneSearch(map);
	}
	
	@Override
	public List<ProductCategoryLevel> selectCategory(String searchKeyword) {
		return productDAO.selectCategory(searchKeyword);
	}

	@Override
	public Category selectParentCategory(int parent_category) {
		return productDAO.selectParentCategory(parent_category);
	}

	@Override
	public List productSearch(String[] keyword) {
		return productDAO.productSearch(keyword);
	}

	@Override
	public int rowprice(Map map) {
		return productDAO.rowprice(map);
	}

	@Override
	public int avgprice(Map map) {
		return productDAO.avgprice(map);
	}

	@Override
	public Product popmenu(Map map) {
		return productDAO.popmenu(map);
	}

	@Override
	public List selectAllProductList(int cPage, int numPerPage) {
		return productDAO.selectAllProductList(cPage,numPerPage);
	}

	@Override
	public int selectTotalProduct() {
		// TODO Auto-generated method stub
		return productDAO.selectTotalProduct();
	}



}
