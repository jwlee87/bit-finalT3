package kr.co.coily.group.service;

import java.util.List;
import java.util.Map;

import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;

public interface GroupService {

	public Map<String, Object> retrieveGroupList(SearchVO search);
	
	public GroupHeaderVO insertGroup();
	
	public GroupHeaderVO retriveGroupHeader(int grpNo);
	
	public List<GroupDetailVO> retriveGroupDetail(int grpNo);
}
