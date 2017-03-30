package kr.co.coily.repository.dao;

import kr.co.coily.repository.vo.UserVO;

public interface UserDAO {

	public void userJoin(UserVO user) throws Exception;

	public String emailCheck(String email) throws Exception;

	public String nickNameCheck(String nickName) throws Exception;

}
