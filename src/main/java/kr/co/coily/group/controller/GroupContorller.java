package kr.co.coily.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.group.service.GroupServiceImpl;
import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;

@Controller
@RequestMapping("/group")
public class GroupContorller {

	@Autowired
	private GroupServiceImpl service;
	
	// 상세 조회 url 호출 (페이지 이동)
	@RequestMapping("/groupDetail.do")
	public String locationDetail() throws Exception {
		return "group/groupDetail";
	};
	
	// 상세 조회 ajax 호출
	@ResponseBody
	@RequestMapping("/groupDetailList.do")
	public Map<String, Object> retrieveDetail(int groupHeaderNo) throws Exception {
		GroupHeaderVO header = service.retriveGroupHeader(groupHeaderNo);
		System.out.println(header.getGroupHeaderNo());
		System.out.println(header.getGroupHeaderName());
		List<GroupDetailVO> detail = service.retriveGroupDetail(groupHeaderNo);

		Map<String, Object> mRslt = new HashMap<>();
		mRslt.put("name", header.getGroupHeaderName());
		mRslt.put("userList", detail);
		return mRslt;
	}
	
	
	// 리스트 조회
	@RequestMapping("/groupList.do")
	public String retrieveGroupList(SearchVO search, Model model) throws Exception {
	//	System.out.println("컨트롤러1");
		Map<String, Object> map = service.retrieveGroupList(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		
		return "group/groupList";
	};
	
	// 등록
	@ResponseBody
	@RequestMapping("/groupHeaderWrite.do")
	public Map<String, String> insertGroup() throws Exception {
		GroupHeaderVO headerVO = service.insertGroup();
		
		Map<String, String> mRslt = new HashMap<>(); 
		mRslt.put("groupHeaderNo", String.valueOf(headerVO.getGroupHeaderNo()));
		mRslt.put("groupHeaderName", headerVO.getGroupHeaderName());
		return mRslt;
	};
	
	// 수정
//	@RequestMapping("/groupUpdate.do")
//	public String insertGroupDetail(HttpServletRequest request, int groupHeaderNo) throws Exception {
//		GroupHeaderVO header = new GroupHeaderVO();
//		header.setGroupHeaderNo(groupHeaderNo);
//		header.setGroupHeaderName(request.getParameter("groupHeaderName"));
//		GroupDetailVO detail = new GroupDetailVO();
//		detail.setGroupHeaderNo(groupHeaderNo);
//		detail.setUserNo(1);
//		service.updateGroupHeader(header);
//		service.updateGroupDetail(detail);
//		
//		return "group/groupList";
//	};
	
}
