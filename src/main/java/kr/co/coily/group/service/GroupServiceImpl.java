package kr.co.coily.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.GroupDAO;
import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDAO dao;
	
	/* 그룹 리스트 조회 */
	public Map<String, Object> retrieveGroupList(SearchVO search) {
	//	System.out.println("서비스 리스트");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dao.selectGroupList(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectGroupCnt(search)));
		return result;
	}
	
	/* 그룹 등록 */
	public GroupHeaderVO insertGroup() {
	//	System.out.println("서비스 등록");
		return dao.insertGroup();
	}
	
	/* 그룹 헤더 조회 */
	public GroupHeaderVO retriveGroupHeader(int grpNo) {
	//	System.out.println("그룹헤더조회");
		return dao.selectGrpHeader(grpNo);
	}
	
	/* 그룹 디테일 조회 */
	public List<GroupDetailVO> retriveGroupDetail(int grpNo) {
	//	System.out.println("그룹디테일조회");
		return dao.selectGrpDetail(grpNo);
	}

	/* 그룹 삭제 */
	public void deleteGroup(int grpNo) {
		dao.deleteGroupDetail(grpNo);
	}
	
}
