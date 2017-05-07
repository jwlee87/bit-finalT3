package kr.co.coily.webSocket.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;




public class SocketHandler extends TextWebSocketHandler {
	 
    private final Logger logger = LogManager.getLogger(SocketHandler.class);
    private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
    private List<WebSocketSession> connectedUsers;
   
    public SocketHandler (){
          super();
          this.logger.info("create SocketHandler instance!");
          connectedUsers = new ArrayList<WebSocketSession>();
    }
    
    //WebSocket 연결이 닫혔을 때 호출
    @Override
    public void afterConnectionClosed(WebSocketSession session,
                 CloseStatus status) throws Exception {
          super.afterConnectionClosed(session, status);

//          sessionSet.remove(session);
//          this.logger.info("remove session!");
          logger.info(session.getId() + "님 접속 종료");
          connectedUsers.remove(session);
          
    }
    
    
    //WebSocket 연결이 열리고 사용이 준비될 때 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session)
                 throws Exception {
          super.afterConnectionEstablished(session);

         connectedUsers.add(session);
         logger.info(session.getId() + "님 접속");
         logger.info("연결 IP :" + session.getRemoteAddress().getHostName());
         System.out.println(session.getRemoteAddress().getHostName());
    }
    
//    클라이언트로부터 메시지가 도착했을 때 호출
    @Override
    public void handleMessage(WebSocketSession session,
                 WebSocketMessage<?> message) throws Exception {
          super.handleMessage(session, message);
         
          this.logger.info("receive message:"+message.toString());
          
    }
    
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        logger.info(session.getId() + "님이 메세지 전송" + message.getPayload());
        System.out.println(session.getId());
        
        for(WebSocketSession webSocketSession : connectedUsers) {
            System.out.println(webSocketSession);
            if(!session.getId().equals(webSocketSession.getId())) {
                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
            }
        }
    }
    
    //전송 에러 발생할 때 호출
    @Override
    public void handleTransportError(WebSocketSession session,
                 Throwable exception) throws Exception {
          this.logger.error("web socket error!", exception);
    }
    
//      WebSocketHandler가 부분 메시지를 처리할 때 호출
    @Override
    public boolean supportsPartialMessages() {
          this.logger.info("call method!");
          return super.supportsPartialMessages();
    }

}

//
//    @Override
//    public void afterPropertiesSet() throws Exception {
//
//          Thread thread = new Thread(){
//
//                 int i=0;
//                 @Override
//                 public void run() {
//                        while (true){
//
//                              try {
//                                     sendMessage ("send message index "+i++);
//                                     Thread.sleep(1000);
//                              } catch (InterruptedException e) {
//                                     e.printStackTrace();
//                                     break;
//                              }
//                        }
//                 }
//
//          };
//
//          thread.start();
//    }

