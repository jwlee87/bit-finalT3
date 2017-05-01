package kr.co.coily.webSocket.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.repository.vo.UserVO;

@Controller
public class UserListController {

	static List<String> joinUserList = new ArrayList<>();
	
	@ResponseBody
	@RequestMapping("/user/userList.do")
	public Map<String, Object> userList(HttpSession session) throws Exception {
		
		
		
		Map<String, Object> param = new HashMap<>();
		
		UserVO user = (UserVO)session.getAttribute("user");
		param.put("user", user);
//		List<UserVO> usList = (List<UserVO>) session.getAttribute("user");
		System.out.println("우아아아아아ㅏ아아아아아아아ㅏ아아아아아아아아");
//		joinUserList.set(joinUserList.size()==0?1:joinUserList.size()+1, user.getUserNickName());
//		param.put("joinList", joinUserList);
		
		return param;
		
		
		
	}
}

