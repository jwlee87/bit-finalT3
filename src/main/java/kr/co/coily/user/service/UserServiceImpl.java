package kr.co.coily.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

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

		@Override
		public void updateConfStatus(String userEmail) throws Exception {
			dao.updateConfStatus(userEmail);
			
		}

		@Override
		public UserVO userLogin(UserVO user) throws Exception {
			return dao.login(user);
		}

		@Override
		public void updateUserStatus(UserVO user) throws Exception {
			dao.updateUserStatus(user);
			
		}

		@Override
		public UserVO userInfo(UserVO user) throws Exception {
			return dao.userInfo(user);
		}

		@Override
		public UserVO userInfoConfed(String userEmail) throws Exception {
			return dao.userInfoConfed(userEmail);
					
		}

		@Override
		public void updatePassword(UserVO user) throws Exception {
			dao.updatePassword(user);
		}

		@Override
		public void updateUser(UserVO user) throws Exception {
			dao.updateUser(user);
			
		}

		@Override
		public UserVO userImg(int userNo) throws Exception {
			return dao.userImg(userNo);
		}

		@Override
		public void choiceImg(UserVO user) throws Exception {
			dao.choiceImg(user);
		}

		@Override
		public void userStatusLogout(int userNo) throws Exception {
			dao.userStatusLogout(userNo);
			
		}

		@Override
		public List<UserVO> selectLoginUserList() throws Exception {
			return dao.selectLoginUserList();
		}



}
