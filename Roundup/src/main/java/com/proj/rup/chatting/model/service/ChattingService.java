package com.proj.rup.chatting.model.service;

import java.util.List;

import com.proj.rup.chatting.model.vo.Chatting;

public interface ChattingService {

	List<Chatting> selectChattingList();

	int connectCount();

}
