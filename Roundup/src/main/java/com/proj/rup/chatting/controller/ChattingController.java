package com.proj.rup.chatting.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.proj.rup.chatting.model.service.ChattingService;
import com.proj.rup.chatting.model.service.ChattingServiceImpl;
import com.proj.rup.chatting.model.vo.Chatting;

@Controller
public class ChattingController {

	@Autowired
	private ChattingService chattingService = new ChattingServiceImpl();
	
	private Logger logger = LoggerFactory.getLogger(getClass());
	
	@RequestMapping(value="/chatting/showChat.do",method=RequestMethod.POST,produces="application/json; charset=utf8")
	@ResponseBody
	public Map<String,Object> showChat(){
		Map<String,Object> map = new HashMap<>();
		
		List<Chatting> list = chattingService.selectChattingList();
		int connectCount = chattingService.connectCount(); 
		
		map.put("list", list);
		map.put("connectCount", connectCount);
		
		logger.debug("map="+map);
		
		return map;	
	}
	
	@RequestMapping(value="/chatting/insertChat.do",method=RequestMethod.GET,produces="application/json; charset=utf8")
	@ResponseBody
	public Map<String,Object> insertChat(@RequestParam(value="member_id")String member_id,
						   @RequestParam(value="chat_content")String chat_content) {
		
		Chatting chatting = new Chatting(0,member_id,chat_content,null);
		
		int insertChat = chattingService.insertChat(chatting);
		
		Map<String,Object> map = new HashMap<>();
		int connectCount = chattingService.connectCount();
		map.put("connectCount", connectCount);
		return map;	
	}
		
}
