package kr.co.coily.webSocket.controller;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import kr.co.coily.repository.vo.UserVO;

public class UserSocketHandler extends TextWebSocketHandler {

	private final Logger logger = LogManager.getLogger(SocketHandler.class);
	private Set<WebSocketSession> sessionSet = new HashSet<WebSocketSession>();
	private List<WebSocketSession> connectedUsers;
	static List<UserVO> userList;
	static WebSocketSession ses;
	String str = "";

	public UserSocketHandler() {
		super();
		this.logger.info("create SocketHandler instance!!!!!!!!!!!!!!!!!!!!!!!!!");
		connectedUsers = new ArrayList<WebSocketSession>();
		userList = new ArrayList<>();

	}

	// WebSocket 연결이 닫혔을 때 호출
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		super.afterConnectionClosed(session, status);
		sessionSet.remove(session);
		this.logger.info("remove session!");

		// Iterator<String> itr = userList.iterator();
		// while (itr.hasNext()) {
		// String list = itr.next();
		// // //유저명이 다를때
		// System.out.println("현재접속자 : " + list.toString());
		// // if(!userInfo.getUserNickName().equals(userInfo.getUserNickName()))
		// {
		// session.sendMessage(new TextMessage(list));
		// }else {
		// session.sendMessage(new TextMessage(list));
		//
		// }
		// }
		connectedUsers.remove(session);
		// 일단 목록은 나오는거
		logger.info(session.getId() + "님 접속 종료");
		Map<String, Object> user = session.getAttributes();
		UserVO userInfo = (UserVO) user.get("user");
		//세션 꺼졌을때 닉네임 이메일 이미지경로 지움
		userList.remove(userInfo);
//		userList.remove(userInfo.getUserEmail());
//		userList.remove(userInfo.getUserImgPath());
		//세션 꺼졌을때 닉네임 이메일 이미지경로 지움
		logger.info(userInfo.getUserNickName() + "님 접속 종료");
		// System.out.println("핫핫핫핫 : " + userList.listIterator().toString());
		// for (int i = 0; i < userList.size(); i++) {
		// String strr = userList.get(i);
		// System.out.println("남은인간들 : " + strr);
		//// session.sendMessage(new TextMessage(strr));
		//// ses.sendMessage(new TextMessage("도와주썜~~ : " + strr));;
		// }

		// Iterator<String> itr = userList.iterator();
		// while (itr.hasNext()) {
		// str = itr.next();
		// ses.sendMessage(new TextMessage(userInfo.getUserNickName()));
		// System.out.println("푸드드드득[!!!");
		// }

		// Iterator<WebSocketSession> itr = connectedUsers.iterator();
		// while (itr.hasNext()) {
		// str = itr.next();
		// }
		// System.out.println("남은자들 : " + dddd);

		// if (status.getCode() == 1001) {
		// for (WebSocketSession ses : connectedUsers) {
		// System.out.println("남은사람들 뜨는곳");
		// Iterator<WebSocketSession> itr = connectedUsers.iterator();
		// while (itr.hasNext()) {
		// ses = itr.next();
		// System.out.println("이러면 뭐가뜨지?? : " + userInfo.getUserNickName());
		// ses.sendMessage(new TextMessage("뜨는게 이건가?? : " + ses));
		// }
		// }
		//
		// }
//================되는거======================================
//		if (status.getCode() == 1001) {
//			for (WebSocketSession ses : connectedUsers) {
//				for (String str : userList) {
//					System.out.println("남은 접속자들 : " + str);
////					ses.sendMessage(new TextMessage(userInfo.getUserNickName() + "님이 나갔습니다."));
//					ses.sendMessage(new TextMessage("남은접속자들 : " + userList));
//				}
//			}
//
//		}

		
		//==============가장 최근에 수정한거========================================
		if (status.getCode() == 1001) {
			for (WebSocketSession ses : connectedUsers) {
				String result = "";
				for (UserVO responseUser : userList) {
					result += responseUser.getUserNickName() + ","
							   + responseUser.getUserEmail() + ","
							   + responseUser.getUserImgPath() + ";";
					System.out.println("남은 접속자들 : " + result);
//					ses.sendMessage(new TextMessage(userInfo.getUserNickName() + "님이 나갔습니다."));
//					ses.sendMessage(new TextMessage(""+userList));
					ses.sendMessage(new TextMessage("ul" + result));
				}
			}
			
		}

		// for (WebSocketSession ses : connectedUsers) {
		// Map<String, Object> us = ses.getAttributes();
		// UserVO userdd = (UserVO) us.get("us");
		// System.out.println("뜨나뜨나 : " + userdd.getUserNickName());
		// if(!userInfo.getUserNickName().equals(userdd.getUserNickName())){
		// ses.sendMessage(new TextMessage("갓익ㄹ정 : " +
		// userInfo.getUserNickName()));
		// }
		// }

		// handleTextMessage(session, new TextMessage("갓익ㄹ정 : " +
		// userInfo.getUserNickName()));

		// for (WebSocketSession ses : connectedUsers) {
		// if(!ses.getId().equals(session.getId())) {
		// ses.sendMessage(new TextMessage(ses.getId()));
		//
		// }
		// }

		// session.sendMessage(new TextMessage(userInfo.getUserNickName()));
		// if (status.getCode() == 1001) {
		// System.out.println("접속종료 :" + userInfo.getUserNickName());
		// System.out.println("접속종료 :" + userInfo.getUserNickName());
		// System.out.println("접속종료 :");
		// System.out.println("접속종료 :");
		// }

		// Iterator<String> itr = userList.iterator();
		// while (itr.hasNext()) {
		// str = itr.next();
		// ses.sendMessage(new TextMessage(userInfo.getUserNickName()));
		// System.out.println("푸드드드득[!!!");
		// }

		// for (String userL : userList) {
		// if(!userInfo.getUserNickName().equals(userInfo.getUserNickName())) {
		// session.sendMessage(new TextMessage("나옴?? : " +
		// userInfo.getUserNickName()));
		// }
		// }
		//
		// if (!userInfo.getUserNickName().equals(userInfo.getUserNickName())) {
		// session.sendMessage(new TextMessage("깔깔ㄲ딸 : " +
		// userInfo.getUserNickName()));
		// }

	}
	// WebSocket 연결이 열리고 사용이 준비될 때 호출

	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		super.afterConnectionEstablished(session);

		connectedUsers.add(session);

		logger.info(session.getId() + "님 접속");
		logger.info("연결 IP :" + session.getRemoteAddress().getHostName());
		System.out.println(session.getRemoteAddress().getHostName());
		System.out.println("session : " + session.getAttributes());
		Map<String, Object> user = session.getAttributes();

		// user.put("user", user);
		// System.out.println(user);
		UserVO userInfo = (UserVO) user.get("user");
		System.out.println(user.get("user"));
		System.out.println("유저별명 : " + userInfo.getUserNickName());
		System.out.println("이메일 : " + userInfo.getUserEmail());
		userList.add(userInfo);
		
		System.out.println("##################### 닉네임 : " + userInfo.getUserNickName());
		System.out.println("##################### 이메일 : " + userInfo.getUserEmail());
		System.out.println("##################### 패쓰 : " + userInfo.getUserImgPath());
		
		
		//사진 추가중, 이메일도 추가중
//		userList.add(userInfo.getUserEmail());
//		userList.add(userInfo.getUserImgPath());
		//사진 추가중, 이메일도 추가중
//		logger.info(userInfo.getUserEmail());
//		logger.info(userInfo.getUserNickName() + "님이 접속했습니다.");
//		logger.info("이미지경로 : " + userInfo.getUserImgPath());
		System.out.println("이미지경로입니다 : " + userInfo.getUserImgPath());
		System.out.println("userList : " + userList);
		
//		param.put("userInfo", userInfo);
		
		// for(WebSocketSession webSocketSession : connectedUsers) {
		// System.out.println("접속자리스트 : " + webSocketSession);
		// }

		// session.setAttribute("user", loginUser);
		// param.put("userNo", loginUser.getUserNo());

	}

	// 클라이언트로부터 메시지가 도착했을 때 호출
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		super.handleMessage(session, message);

		this.logger.info("receive message:" + message.toString());

	}

	@Override
	protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
		Map<String, Object> user = session.getAttributes();
		UserVO userInfo = (UserVO) user.get("user");
		
//		UserVO userUu = (UserVO)param.get("userInfo");
//		System.out.println("파람값 : " + userUu.getUserNickName());
		
		logger.info(userInfo.getUserNickName() + "님이 메세지 전송 : " + message.getPayload());
		
		System.out.println("이거뭐고 : " + userInfo.getUserNickName());

		// List<String> userList = new ArrayList<>();

		// for(Iterator<E> itr = list.ite)

		System.out.println("뭐나올까??" + connectedUsers.iterator());
		System.out.println("유저리스트~~~~~~~~~~~~ : " + userList.listIterator());

		// for(Iterator<String> itr = userList.iterator(); itr.hasNext();){
		// if(!userInfo.getUserNickName().equals(userInfo.getUserNickName())) {
		// String str = itr.next();
		// session.sendMessage(new TextMessage(str));
		// }else {
		// session.sendMessage(new TextMessage("뜨긴뜸?"));
		// }
		// }
		// ListIterator<String> list = userList.listIterator();
		// System.out.println("새로운거 : " + list);

		//

		// ===================이거 되는거 ======================
		// Iterator<String> itr = userList.iterator();
		// while (itr.hasNext()) {
		// str = itr.next();
		// // 유저명이 다를때
		// if (!userInfo.getUserNickName().equals(userInfo.getUserNickName())) {
		// session.sendMessage(new TextMessage(str));
		//
		// } else {
		// session.sendMessage(new TextMessage(str));
		//
		// }
		// }
		// ===================이거 되는거 ======================
		
		//채팅
		String msg = "";
		if (message.getPayload().startsWith("chat:")) {
			String[] payloadMsg = message.getPayload().split(":");
			
			for (WebSocketSession socketSession : connectedUsers) {
				// 남일 경우
				if (!socketSession.getId().equals(session.getId())) {
					System.out.println("요새킹 : " + socketSession.getId());
					System.out.println("이새킹 : " + session.getId());
					String chatMsg = "";
					chatMsg += userInfo.getUserNickName() + "," + userInfo.getUserImgPath() + "," + payloadMsg[1];
					socketSession.sendMessage(new TextMessage("chat:" + chatMsg));
				}
				// }else {
				// System.out.println("이쪽에는 오도안하나??");
				// String chatMsg = "";
				// chatMsg += userInfo.getUserNickName() + ","
				// + userInfo.getUserImgPath() + ","
				// + message.getPayload();
				// socketSession.sendMessage(new TextMessage("chat:" + chatMsg));
				// }
			}
			
		} else if (message.getPayload().startsWith("zcodeChat:")) {
			String[] codeChatMsg = message.getPayload().split(":");
			System.out.println("codeChatMsg : " + codeChatMsg[0]);
			System.out.println("codeChatMsg : " + codeChatMsg[1]);
			for (WebSocketSession socketSession : connectedUsers) {
				//남일 경우
				if (!socketSession.getId().equals(session.getId())) {
					System.out.println("요요요요요요요 : " + socketSession.getId());
					System.out.println("기기기기기기기: " + session.getId());
					String chatMsg = "";
					chatMsg += userInfo.getUserNickName()+ "," + codeChatMsg[1];
					socketSession.sendMessage(new TextMessage("zcodeChat:" + chatMsg));
				}
			}

		} else if (message.getPayload().startsWith("t:")) {
			 for(WebSocketSession webSocketSession : connectedUsers) {
		            System.out.println(webSocketSession);
		            if(!session.getId().equals(webSocketSession.getId())) {
		                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
		            }
		        }
			
		} else if (message.getPayload().startsWith("f:")) {
			 for(WebSocketSession webSocketSession : connectedUsers) {
		            System.out.println(webSocketSession);
		            if(!session.getId().equals(webSocketSession.getId())) {
		                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
		            }
		        }
			
		} else if (message.getPayload().startsWith("e:")) {
			 for(WebSocketSession webSocketSession : connectedUsers) {
		            System.out.println(webSocketSession);
		            if(!session.getId().equals(webSocketSession.getId())) {
		                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
		            }
		        }
		} else if (message.getPayload().startsWith("c:")) {
			for(WebSocketSession webSocketSession : connectedUsers) {
	            System.out.println(webSocketSession);
	            if(!session.getId().equals(webSocketSession.getId())) {
	                webSocketSession.sendMessage(new TextMessage(message.getPayload()));
	            }
	        }
		}else {
			//===========가장 최근에 수정한거=========================
			for (WebSocketSession webSocketSession : connectedUsers) {
				String result = "";
				if (!webSocketSession.getId().equals(session.getId())) {
					
					for (UserVO responseUser : userList) {
						result += responseUser.getUserNickName() + ","
								+ responseUser.getUserEmail() + ","
								+ responseUser.getUserImgPath() + ";";
						System.out.println("########################################## result " + result);
						webSocketSession.sendMessage(new TextMessage("ul:" + result));
					}
					
				}else {
//				webSocketSession.sendMessage(new TextMessage("내가접속할때 : " + userInfo.getUserNickName()));
					for (UserVO responseUser: userList) {
						result += responseUser.getUserNickName() + ","
								+ responseUser.getUserEmail() + ","
								+ responseUser.getUserImgPath() + ";";
//					webSocketSession.sendMessage(new TextMessage(""+userList));
						System.out.println("11111111111111111111111111111111111111111111 result " + result);
						webSocketSession.sendMessage(new TextMessage("ul:" + result));
					}
				}
				
			}
			
		}
		
		

		// ===================이거 되는거 ======================
		// for (WebSocketSession webSocketSession : connectedUsers) {
		// System.out.println("접속자 리스트 : " + webSocketSession);
		// if (!session.getId().equals(webSocketSession.getId())) {
		// // webSocketSession.sendMessage(new
		// // TextMessage(message.getPayload()));
		// webSocketSession.sendMessage(new TextMessage(message.getPayload()));
		// }
		// }
		// ===================이거 되는거 ======================
	}

	// 전송 에러 발생할 때 호출
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		this.logger.error("web socket error!", exception);
	}

	// WebSocketHandler가 부분 메시지를 처리할 때 호출
	@Override
	public boolean supportsPartialMessages() {
		this.logger.info("call method!");

		return super.supportsPartialMessages();
	}

	//
	// @Override
	// public void afterPropertiesSet() throws Exception {
	//
	// Thread thread = new Thread(){
	//
	// int i=0;
	// @Override
	// public void run() {
	// while (true){
	//
	// try {
	// sendMessage ("send message index "+i++);
	// Thread.sleep(1000);
	// } catch (InterruptedException e) {
	// e.printStackTrace();
	// break;
	// }
	// }
	// }
	//
	// };
	//
	// thread.start();
	// }

}
