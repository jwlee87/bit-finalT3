package kr.co.coily.group.service;

import java.util.List;
import java.util.Map;

import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;

public interface GroupService {
	
	/* 그룹 리스트 조회 */
	public Map<String, Object> retrieveGroupList(SearchVO search);
	
	/* 그룹 등록 */
	public GroupHeaderVO insertGroup();
	
	/* 그룹 헤더 조회 */
	public GroupHeaderVO retriveGroupHeader(int grpNo);
	
	/* 그룹 디테일 조회 */
	public List<GroupDetailVO> retriveGroupDetail(int grpNo);
	
	/* 그룹 삭제 */
	public void deleteGroup(int grpNo);
}
