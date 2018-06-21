package com.proj.rup.chatting.model.dao;

import java.util.List;

import com.proj.rup.chatting.model.vo.Chatting;

public interface ChattingDAO {

	List<Chatting> selectChattingList();

	int connectCount();

}
