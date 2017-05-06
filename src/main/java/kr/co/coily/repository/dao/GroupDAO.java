package kr.co.coily.repository.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UpdateAddUserVO;
import kr.co.coily.repository.vo.UserVO;

@Repository
public class GroupDAO {
	
	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	/*그룹 리스트 조회********************************************/
	public List<GroupDetailVO> selectGroupList(SearchVO search) {
		return sqlSessionTemplate.selectList("kr.co.coily.repository.dao.GroupDAO.selectGroupList", search);
	}
	
	/*그룹 리스트 전체 수 조회***************************************/
	public int selectGroupCnt(SearchVO search) {
		return sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.GroupDAO.selectGroupCnt", search);
	}
	
	/*초기 기본 그룹 등록(Header+Detail)***************************/
	@Transactional(rollbackFor=Exception.class)
	public GroupHeaderVO insertGroup(HttpSession session) {
		GroupHeaderVO headerVO = new GroupHeaderVO();
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.GroupDAO.insertGroupHeader", headerVO);
		int headerNo = headerVO.getGroupHeaderNo();
//		System.out.println("headerNo : " + headerNo);
		
		GroupDetailVO detail = new GroupDetailVO();
		UserVO userInfo = (UserVO)session.getAttribute("user");
		detail.setGroupHeaderNo(headerNo);
		detail.setUserNo(userInfo.getUserNo());
		System.out.println("dao#####################" + userInfo.getUserNo());
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.GroupDAO.insertGroupDetail", detail);
		return sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.GroupDAO.selectOneHeader", headerNo);
	}
	
	/*그룹 번호에 해당하는 그룹헤더 정보 조회 ****************************/
	public GroupHeaderVO selectGrpHeader(int grpNo) {
		GroupHeaderVO header = sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.GroupDAO.selectOneHeader", grpNo);
		return header;
	}

	/*그룹 번호에 해당하는 그룹디테일 정보 조회 ****************************/
	public List<GroupDetailVO> selectGrpDetail(int grpNo) {
		List<GroupDetailVO> detail = sqlSessionTemplate.selectList("kr.co.coily.repository.dao.GroupDAO.selectOneDetail", grpNo);
		return detail;
	}
	
	/*그룹 번호에 해당하는 그룹 정보 삭제 ********************************/
	@Transactional(rollbackFor=Exception.class)
	public void deleteGroupDetail(int grpNo) {
		sqlSessionTemplate.delete("kr.co.coily.repository.dao.GroupDAO.deleteGroupDetail", grpNo);
		sqlSessionTemplate.delete("kr.co.coily.repository.dao.GroupDAO.deleteGroupHeader", grpNo);
	}
	
	/*그룹 수정
	 *headerName 변경 / userNo 추가등록 **************************/
	@Transactional(rollbackFor=Exception.class)
	public void updateGroup(GroupHeaderVO header) {
		sqlSessionTemplate.update("kr.co.coily.repository.dao.GroupDAO.updateGroupHeader", header);
	}
	
	//그룹 구성원 추가할때  
	//모든회원 닉네임 검색, 조회
	public List<UserVO> retriveUserList() {
		return sqlSessionTemplate.selectList("kr.co.coily.repository.dao.GroupDAO.retriveUserList");
	}
	

	//userNickName으로 userNo 가져오기
	public int getUserNo(String userNick) {
		return sqlSessionTemplate.selectOne("kr.co.coily.repository.dao.GroupDAO.getUserNo", userNick);
	}

	
	//그룹 구성원 추가&삭제
	public void updateAddUser(UpdateAddUserVO addUser) {
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.GroupDAO.updateAddUser", addUser);
		
	}

	//그룹 구성원 추가&삭제 할떄 한번 리셋 약간 야매같음
	public void resetGroup(UpdateAddUserVO addUser) {
		sqlSessionTemplate.delete("kr.co.coily.repository.dao.GroupDAO.resetGroup", addUser);
		
	}
}

