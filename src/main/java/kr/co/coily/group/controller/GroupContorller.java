package kr.co.coily.group.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.group.service.GroupServiceImpl;
import kr.co.coily.repository.vo.GroupDetailVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UserVO;

@Controller
@RequestMapping("/group")
public class GroupContorller {

	@Autowired
	private GroupServiceImpl service;
	
	
	// 수정 ajax 호출
	@RequestMapping("/groupUpdate.do")
	@ResponseBody
	public String updateGroup(String groupHeaderName, int groupHeaderNo) throws Exception {
		GroupHeaderVO header = new GroupHeaderVO();
		header.setGroupHeaderName(groupHeaderName);
		header.setGroupHeaderNo(groupHeaderNo);
		service.updateGroup(header);
		return "";
	};
	
	
	// 삭제 ajax 호출
		@RequestMapping("/groupDelete.do")
		@ResponseBody
		public String deleteGroup(int groupHeaderNo) throws Exception {
			service.deleteGroup(groupHeaderNo);
			return "";
		}
	
	// 상세 조회 url 호출 (페이지 이동)
	@RequestMapping("/groupDetail.do")
	public String locationDetail() throws Exception {
		return "group/groupDetail";
	};
	
	// 상세 조회 url 호출 (페이지 이동)
	@RequestMapping("/selectizeTest.do")
	public String locationDetail2() throws Exception {
		return "group/selectizeTest";
	};
	
	// 상세 조회 ajax 호출
	@ResponseBody
	@RequestMapping("/groupDetailList.do")
	public Map<String, Object> retrieveDetail(int groupHeaderNo) throws Exception {
		//테스트중=================
		//테스트중=================
		//테스트중=================
		//테스트중=================
		GroupHeaderVO header = service.retriveGroupHeader(groupHeaderNo);
		System.out.println(header.getGroupHeaderNo());
		System.out.println(header.getGroupHeaderName());
		List<GroupDetailVO> detail = service.retriveGroupDetail(groupHeaderNo);
		List<UserVO> userList = service.retriveUserList();
		Map<String, Object> mRslt = new HashMap<>();
		mRslt.put("name", header.getGroupHeaderName());
		mRslt.put("userList", detail);
		mRslt.put("allUserList", userList);
		return mRslt;
		
		//원래거==============
		//원래거==============
		//원래거==============
		//원래거==============
		/*	GroupHeaderVO header = service.retriveGroupHeader(groupHeaderNo);
		System.out.println(header.getGroupHeaderNo());
		System.out.println(header.getGroupHeaderName());
		List<GroupDetailVO> detail = service.retriveGroupDetail(groupHeaderNo);

		Map<String, Object> mRslt = new HashMap<>();
		mRslt.put("name", header.getGroupHeaderName());
		mRslt.put("userList", detail);
		return mRslt;*/
	}
	
	// 리스트 조회
	@RequestMapping("/groupList.do")
	public String retrieveGroupList(SearchVO search, Model model, HttpSession session) throws Exception {
		//테스트중================
		//테스트중================
		//테스트중================
//		System.out.println("컨트롤러1");
			UserVO userInfo = (UserVO)session.getAttribute("user");
			System.out.println("그룹리스트 userNo : " + userInfo.getUserNo());
			search.setUserNo(userInfo.getUserNo());
			Map<String, Object> map = service.retrieveGroupList(search);
			model.addAttribute("list", map.get("list"));
			model.addAttribute("pageResult", map.get("pageResult"));		
			return "group/groupList";
		
		//원래거===========
		//원래거===========
		//원래거===========
		//원래거===========
		/*//	System.out.println("컨트롤러1");
		Map<String, Object> map = service.retrieveGroupList(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		
		return "group/groupList";*/
	};
	
	// 등록
	@ResponseBody
	@RequestMapping("/groupHeaderWrite.do")
	public Map<String, String> insertGroup(HttpSession session) throws Exception {
		
		//테스트중~~!!==========
		//테스트중~~!!==========
		//테스트중~~!!==========
		//테스트중~~!!==========
		UserVO user = (UserVO)session.getAttribute("user");
		System.out.println("얍얍얍 : " + user.getUserNo());
		GroupHeaderVO headerVO = service.insertGroup(session);
		
		Map<String, String> mRslt = new HashMap<>(); 
		mRslt.put("groupHeaderNo", String.valueOf(headerVO.getGroupHeaderNo()));
		mRslt.put("groupHeaderName", headerVO.getGroupHeaderName());
		return mRslt;		
		
		
		//원래거===========
		//원래거===========
		//원래거===========
		//원래거===========
		/*GroupHeaderVO headerVO = service.insertGroup();
		Map<String, String> mRslt = new HashMap<>(); 
		mRslt.put("groupHeaderNo", String.valueOf(headerVO.getGroupHeaderNo()));
		mRslt.put("groupHeaderName", headerVO.getGroupHeaderName());
		return mRslt;*/
	};
	
}
