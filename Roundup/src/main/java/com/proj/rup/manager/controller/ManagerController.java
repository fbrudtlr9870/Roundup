package com.proj.rup.manager.controller;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.proj.rup.manager.model.service.ManagerService;
import com.proj.rup.manager.model.service.ManagerServiceImpl;
import com.proj.rup.member.model.vo.Member;
import com.proj.rup.member.model.vo.MemberAddress;
import com.proj.rup.product.model.vo.Product;
import com.proj.rup.product.model.service.ProductService;
import com.proj.rup.product.model.service.ProductServiceImpl;
import com.proj.rup.purchase.model.service.PurchaseService;
import com.proj.rup.purchase.model.service.PurchaseServiceImpl;
import com.proj.rup.purchase.model.vo.PurchaseComplete;

@Controller
public class ManagerController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@Autowired
	ProductService productService = new ProductServiceImpl();
	@Autowired
	ManagerService managerService = new ManagerServiceImpl();
	@Autowired
	private PurchaseService purchaseService = new PurchaseServiceImpl();
	
	@RequestMapping("/manager/managerPage.do")
	public ModelAndView member() {
		if(logger.isDebugEnabled()) logger.debug("관리자페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		/*mav.setViewName("/manager/memberManagement");*/
		return mav;
		
	}
	
	@RequestMapping("/manager/managerView.do")
	public ModelAndView managerView(@RequestParam String member_id) {
		ModelAndView mav = new ModelAndView();
		System.out.println("member_id@myPage.do:"+member_id);
		Member m = managerService.selectOneMember(member_id);
		System.out.println("member@myPage:"+m);
		MemberAddress ma = purchaseService.selectMemberInfo(member_id);
		//List<PurchaseComplete> pc = purchaseService.selectPCList(memberId);
		//logger.debug("purchaseComplete@memberController pc:"+pc);
		
		mav.addObject("member",m);
		mav.addObject("memberAddress",ma);
		//mav.addObject("purchaseComplete",pc);
		mav.setViewName("manager/managerView");

		return mav;
	}
	
	@RequestMapping("/manager/managerPurchaseComplete.do")
	public ModelAndView managerPurchaseComplete() {
		ModelAndView mav = new ModelAndView();
		List<PurchaseComplete> pc = purchaseService.selectAPCList();
		mav.addObject("completeList",pc);
		mav.setViewName("manager/managerPurchaseComplete");
 
		return mav;
	}
	
	@RequestMapping("/product/allProductList.do")
	public ModelAndView allProductList() {
		ModelAndView mav = new ModelAndView();
		List<Product> p = productService.selectProductList();
		mav.addObject("productList",p);
		mav.setViewName("/product/allProductList");

		return mav;
	}
	
	@RequestMapping("/manager/memberManagement.do")
	public ModelAndView memberManagement(@RequestParam(value="cPage", 
											  required=false, 
											  defaultValue="1") 
											  int cPage) {
		if(logger.isDebugEnabled()) logger.debug("회원관리페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = managerService.selectListMember(cPage, numPerPage);
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/manager/memberManagement");
		return mav;
		
	}
	
	
	@RequestMapping("/manager/deletedMember.do")
	public ModelAndView deletedMember(@RequestParam(value="cPage", 
											  required=false, 
											  defaultValue="1") 
											  int cPage) {
		if(logger.isDebugEnabled()) logger.debug("회원관리페이지 요청");
		ModelAndView mav = new ModelAndView();
		int numPerPage = 10;
		
		//1. 현재페이지 컨텐츠 구하기
		List<Map<String,String>> list = managerService.selectDeletedListMember(cPage, numPerPage);
		
		//2. 페이지바처리를 위한 전체컨텐츠수 구하기
		int totalContents = managerService.selectManagerTotalMember();
		
		mav.addObject("list", list);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.setViewName("/manager/deletedMember");
		return mav;
		
	}
	
}