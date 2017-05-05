package kr.co.coily.group.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.GroupDAO;
import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UpdateAddUserVO;
import kr.co.coily.repository.vo.UserVO;

//===============테스트==============
//===============테스트==============
//===============테스트==============
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
	@Override
	public GroupHeaderVO insertGroup(HttpSession session) {
	//	System.out.println("서비스 등록");
		return dao.insertGroup(session);
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

	/* 그룹 수정 */
	public void updateGroup(GroupHeaderVO header, String[] userNickName) {
		System.out.println("갑ㄱ값 : " + userNickName);
		System.out.println("서비스 임플 그룹헤더넘버 : " + header.getGroupHeaderNo());
		
		System.out.println("값값값");
		UpdateAddUserVO addUser = new UpdateAddUserVO();
		addUser.setGroupHeaderNo(header.getGroupHeaderNo());
		dao.resetGroup(addUser);
		for (int i = 1; i < userNickName.length; i++) {
			int userNo =  dao.getUserNo(userNickName[i]);
			System.out.println("서비스임플 userNo 값 : " + userNo);
			addUser.setUserNo(userNo);
			addUser.setGroupHeaderNo(header.getGroupHeaderNo());
			addUser.setUserOrder(i);
			dao.updateAddUser(addUser);
			
		}
		
		dao.updateGroup(header);
		
		
	}

	public List<UserVO> retriveUserList() {
		return dao.retriveUserList();
	}

//	public void resetUser(GroupHeaderVO header) {
//		
//		UpdateAddUserVO resetUser = new UpdateAddUserVO();
//		header.setGroupHeaderNo(header.getGroupHeaderNo());
//		System.out.println("뜨나뜨나 : " + header.getGroupHeaderNo());
//		dao.resetGroup(resetUser);
//	}


	
}












//==================원래거====================
//==================원래거====================
//==================원래거====================
/*
@Service
public class GroupServiceImpl implements GroupService {

	@Autowired
	private GroupDAO dao;
	
	 그룹 리스트 조회 
	public Map<String, Object> retrieveGroupList(SearchVO search) {
	//	System.out.println("서비스 리스트");
		Map<String, Object> result = new HashMap<String, Object>();
		result.put("list", dao.selectGroupList(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectGroupCnt(search)));
		return result;
	}
	
	 그룹 등록 
	public GroupHeaderVO insertGroup() {
	//	System.out.println("서비스 등록");
		return dao.insertGroup();
	}
	
	 그룹 헤더 조회 
	public GroupHeaderVO retriveGroupHeader(int grpNo) {
	//	System.out.println("그룹헤더조회");
		return dao.selectGrpHeader(grpNo);
	}
	
	 그룹 디테일 조회 
	public List<GroupDetailVO> retriveGroupDetail(int grpNo) {
	//	System.out.println("그룹디테일조회");
		return dao.selectGrpDetail(grpNo);
	}

	 그룹 삭제 
	public void deleteGroup(int grpNo) {
		dao.deleteGroupDetail(grpNo);
	}

	 그룹 수정 
	public void updateGroup(GroupHeaderVO header) {
		dao.updateGroup(header);
	}
	
}
*/