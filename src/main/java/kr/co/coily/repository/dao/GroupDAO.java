package kr.co.coily.repository.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;

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
	public GroupHeaderVO insertGroup() {
		
		
		GroupHeaderVO headerVO = new GroupHeaderVO();
		sqlSessionTemplate.insert("kr.co.coily.repository.dao.GroupDAO.insertGroupHeader", headerVO);
		int headerNo = headerVO.getGroupHeaderNo();
//		System.out.println("headerNo : " + headerNo);
		
		GroupDetailVO detail = new GroupDetailVO();
		detail.setGroupHeaderNo(headerNo);
		detail.setUserNo(1);
		
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
	
	/*기본 등록된 그룹 업데이트
	 *headerName/ userNo 추가등록 ******************************/
	/*
	@Transactional(rollbackFor=Exception.class)
	public String updateGroup(GroupDetailVO detail) {
		sqlSessionTemplate.update("kr.co.coily.repository.dao.GroupDAO.updateGroupDetail", detail);
	}
	*/
}