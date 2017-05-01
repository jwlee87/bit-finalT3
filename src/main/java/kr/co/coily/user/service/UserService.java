package kr.co.coily.user.service;

import java.util.List;

import kr.co.coily.repository.vo.UserVO;

public interface UserService {

	public void userJoin(UserVO user) throws Exception;

	public String emailCheck(String email) throws Exception;

	public String nickNameCheck(String nickName) throws Exception;

	public int getJoinNo(String userEmail) throws Exception ;

	public void updateConfStatus(String userEmail) throws Exception;
	
	public UserVO userLogin(UserVO user) throws Exception;

	public void updateUserStatus(UserVO user) throws Exception;

	public UserVO userInfo(UserVO user) throws Exception;

	public UserVO userInfoConfed(String userEmail) throws Exception;

	public void updatePassword(UserVO user) throws Exception;

	public void updateUser(UserVO user) throws Exception;

	public UserVO userImg(int userNo) throws Exception;

	public void choiceImg(UserVO user) throws Exception;

	public void userStatusLogout(int userNo) throws Exception;

	public List<UserVO> selectLoginUserList() throws Exception;


}
