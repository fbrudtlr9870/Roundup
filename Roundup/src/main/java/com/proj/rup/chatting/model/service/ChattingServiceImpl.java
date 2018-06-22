package com.proj.rup.chatting.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.proj.rup.chatting.model.dao.ChattingDAO;
import com.proj.rup.chatting.model.dao.ChattingDAOImpl;
import com.proj.rup.chatting.model.vo.Chatting;

@Service
public class ChattingServiceImpl implements ChattingService {

	@Autowired
	private ChattingDAO chattingDAO = new ChattingDAOImpl();
	
	@Override
	public List<Chatting> selectChattingList() {
		return chattingDAO.selectChattingList();
	}

	@Override
	public int connectCount() {
		return chattingDAO.connectCount();
	}

	@Override
	public int insertChat(Chatting chatting) {
		return chattingDAO.insertChat(chatting);
	}



}
