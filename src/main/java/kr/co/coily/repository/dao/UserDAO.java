package kr.co.coily.repository.dao;

import kr.co.coily.repository.vo.UserVO;

public interface UserDAO {

	public void userJoin(UserVO user) throws Exception;

	public String emailCheck(String email) throws Exception;

	public String nickNameCheck(String nickName) throws Exception;

	public int getJoinNo(String userEmail) throws Exception;

	public void updateConfStatus(String userEmail) throws Exception;

	public UserVO login(UserVO user) throws Exception;

	public void updateUserStatus(UserVO user) throws Exception;

}
