package com.proj.rup.common.util;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.proj.rup.chatting.model.vo.Chatting;

public class EchoHandler extends TextWebSocketHandler {
   private Logger logger = LoggerFactory.getLogger(getClass());
   private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
   
   
     @Autowired  
     private SqlSessionTemplate sqlSession; 
    
   
   @Override
   public void afterConnectionEstablished(WebSocketSession session) throws Exception {
       if(session.getPrincipal()!=null){       
            for(WebSocketSession sess : sessionList){       
              if(sess.getPrincipal()!=null&&session.getPrincipal().getName().equals(sess.getPrincipal().getName())){       
                //첫 접속자에게 메세지를 전달 후 소켓연결 끊기       
                sess.sendMessage(new TextMessage("로그인감지로 인해 접속이 끊어집니다.|"));       
              }       
            }       
            sessionList.add(session);       
            logger.info("연결확인="+session.getId());       
          }else{       
             sessionList.add(session);       
            logger.info("연결확인="+session.getId());       
          }       
   }

   @Override
   public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
       logger.info(message.toString());
       String role=session.getPrincipal().toString().substring(session.getPrincipal().toString().length()-5);
          if(message.getPayloadLength()==0){       
             //전체유저가 볼수있도록 보냄(접속자 수)    
            for(WebSocketSession sess : sessionList){       
              sess.sendMessage(new TextMessage("|"+sessionList.size()));    
            }    
          }else if(role.equals("ADMIN")&&message.getPayload().toString().contains("[공지사항]")){
             Chatting chatting = new Chatting(session.getPrincipal().getName(),message.getPayload().toString());
              sqlSession.insert("chatting.insertChat",chatting);
              for(WebSocketSession sess : sessionList){
                 if(sess.getPrincipal()!=null&&session.getPrincipal().getName().equals(sess.getPrincipal().getName())) {
                    System.out.println("관리자 제외");
                 }else {
                    sess.sendMessage(new TextMessage("관리자공지|"+message.getPayload()));
                 }
               }           
          }else {
             //db insert            
              Chatting chatting = new Chatting(session.getPrincipal().getName(),message.getPayload().toString());
              sqlSession.insert("chatting.insertChat",chatting);
         
             //전체유저가 볼수있도록 보냄       
            for(WebSocketSession sess : sessionList){       
              sess.sendMessage(new TextMessage(session.getPrincipal().getName()+"|"+message.getPayload()));       
            }
          }
      
   }
   
   @Override
   public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
      sessionList.remove(session);
      
      logger.info("연결끊김="+session.getId());
   }
}