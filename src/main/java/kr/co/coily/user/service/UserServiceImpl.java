package kr.co.coily.user.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.UserDAO;
import kr.co.coily.repository.vo.UserVO;

@Service
public class UserServiceImpl implements UserService  {
	
		@Autowired
		UserDAO dao;

		@Override
		public void userJoin(UserVO user) throws Exception {
			dao.userJoin(user);
		}

		@Override
		public String emailCheck(String email) throws Exception {
			return dao.emailCheck(email);
		}

		@Override
		public String nickNameCheck(String nickName) throws Exception {
			return dao.nickNameCheck(nickName);
		}

		@Override
		public int getJoinNo(String userEmail) throws Exception {
			return dao.getJoinNo(userEmail);
		
		}

}
