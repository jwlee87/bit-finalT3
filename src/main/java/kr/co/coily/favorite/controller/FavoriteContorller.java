package kr.co.coily.favorite.controller;

import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.coily.favorite.service.FavoriteServiceImpl;
import kr.co.coily.repository.vo.CardVO;
import kr.co.coily.repository.vo.FavoriteVO;
import kr.co.coily.repository.vo.GroupHeaderVO;
import kr.co.coily.repository.vo.SearchVO;
import kr.co.coily.repository.vo.UserVO;

@Controller
@RequestMapping("/favorite")
public class FavoriteContorller  {
	
	@Autowired
	private FavoriteServiceImpl service;
	@Autowired
	private JavaMailSender mailSender;
	
	// 등록
	@ResponseBody
	@RequestMapping("/favoriteInsert.do")
	public String insertFavorite(HttpServletRequest request, HttpSession session) throws Exception {
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		UserVO user = (UserVO)session.getAttribute("user");
		FavoriteVO favorite = new FavoriteVO();
		favorite.setCardNo(Integer.parseInt(request.getParameter("cardNo")));
		favorite.setUserNo(user.getUserNo());
		favorite.setGroupHeaderNo(group.getGroupHeaderNo());
		
		
		service.insertFavorite(favorite);
		return "";
	}
	
	// 삭제
	@RequestMapping("/favoriteDelete.do")
	@ResponseBody
	public String deleteFavorite(int cardNo) throws Exception {
		service.deleteFavorite(cardNo);
		return "";
	}
	
	// 리스트 조회
	@RequestMapping("/favoriteList.do")
	public String retrieveFavorite(SearchVO search, Model model, HttpSession session) throws Exception {
		GroupHeaderVO group = (GroupHeaderVO)session.getAttribute("groupInfo");
		UserVO user = (UserVO)session.getAttribute("user");
		search.setUserNo(user.getUserNo());
		search.setGroupHeaderNo(group.getGroupHeaderNo());
		Map<String, Object> map = service.retreiveFavorite(search);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageResult", map.get("pageResult"));
		return "favorite/favoriteList";
	}
	
	// 보관함 카드 메일 공유
	@ResponseBody
	@RequestMapping("/favoriteSend.do")
	public String sendFavorite(HttpServletRequest request, SearchVO search, HttpSession session) throws Exception {
		System.out.println("메일 전송 들어오니");
		search.setCardNo(Integer.parseInt(request.getParameter("cardNo")));
		UserVO user = (UserVO)session.getAttribute("user");
		search.setUserNo(user.getUserNo());
		
		CardVO card = service.sendFCard(search);
		
		String userNickName = user.getUserNickName();
		String cardNickName = card.getUserNickName();
		String cardContent = card.getCardContent();
		String setfrom = "coilyteam@gmail.com";
		String tomail = user.getUserEmail();
		String title = "[coily 보관함 카드] 글쓴이 : " + cardNickName;
		String content = ""
				+ "<div style='font-size:10pt; font-family:Gulim;'>"
				+ "  <meta http-equiv='Content-Type' content='text/html; charset=UTF-8'>"
				+ "<table class='wrapper' width='100%' height='100%' style='border-spacing: 0; background-size: 64px 64px !important; background: #333333 url(data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAAIAAAACACAQAAABpN6lAAAAD40lEQVR42u2aQU9UVxTHH2CIG0zA4EphWvUDVLqo/aUVayJrF5aUJk1MpB+gpd2KX6CpkkZM3RhJMbZVSO2minVBk2KqUXdG3YERqhQoLkR0upm5c970zjgjtMl5/n9vd+49J/ecmXffPeeeJBFCCCGEEEIIIYQQQgghhBBCCCGEEEIIIYQQ6wWNdDHAGa4xwwJ5Fpjmd07zGW/RmHXn32aIP8lXfB7yNbuy6vw+rlZx3T6X6M6a8x1cqNH54nOejuy4/zGLERefcJsrXOIKt3kSGV/kYBacb+J4mWMrjNPPThrMrAZ20s84K2Vzv3K+LdLM9ymH5jnKlirzt3CU+ZTGWZo9//rnjSsvOElbDVptDPPc6H1Hk9cADBk35thfh+Z+5ozucZ/uf2RcuEOuTu0cd4z+h/7cz7EUln+32ntfZT+4GywssNVbAC6Gxc/yxivaeNO8CD/4cv8Ds/X1rMFODy+CJU+nQybCsk+u0dJwsHTZU8pTXPRfbDbyPqa4x0il95mtjHCPKfqMbLM5F3hJk8znb9BIjwTpIzojWp0mTzxi5IPOPoc0hq1rhfYgbeWp+aydqPpnz/O0dGSiPRyQ51wcjNkV3Bg30t2pA+5kRO+31IzdZmTc1UvAQFhuv5FuS7l3LqJ3LjVjmxnpD9LPPQRgNCx3e0peqgis8n5E7z1Ww4wLqZHtpbzAQwCuFxa7bBPeJKGFM6ySZ6ZSns9BZsizygibUvIGlgs2r3sIwMPCYm9GxjbRWW0jo5HOtPMF+c2CzRkPASju2VfX0WaxmrjkIQDF9/Xif5FZ6B/gew94ZZuu9oAb8a/AGiyWvgI3PATgbPwcsAaLpXPAqIcAfBk9CXbzR11Pd/Qk+IWHALwTzQU2cL+Oe6H7bIjmAu96CEBTSGtNNpgkHKgjAAeMXnvII+ecFMjj9YAk4dsa3T+V0hp0Vx43FaF5exVCsymVVn5+tndBtJmKUJefotivYdHDKXkzp17266evwjgRRiYSP7CvclWYXqYrOD9Nb9ncHnNJtjfxROpeoKwCyEYOMckz4/ozJjnExrJ5OWbDjB8TX5Dj7+o3Q7Swhz4+pY89tETG7c3Qoq0QeQnBJ+t4N9ibeIRvXuvb4SShKdUZ9JxhWmvQai3rDxh12x8Q6RB5/NIOkUEeZ6ZDpPAv+HeP0BiH2VE2bweHGctcj1DBuXiX2DK3mOAXJrgV8v3sdYkVQtDBWJ19gj/F7g99B6H2TtHLzk59daVJQzyq4vosxzLbK2y2xS4GGOEaD1gizyIPmHpNusWFEEIIIYQQQgghhBBCCCGEEEIIIYQQQgjxP/IPFfE4uP4K424AAAAASUVORK5CYII=); padding: 100px 0 0; border: 0;'>"
				+ "<tbody><tr><td align='center' style='vertical-align: top; padding: 0;'>"
				+ "<table class='main welcome' style='border-spacing: 0; max-width: 560px; border-radius: 5px; background: white; padding: 0; border: 0;'>"
				+ "<thead><tr><td align='center' style='vertical-align: top; height: 26px; color: white; border-top-left-radius: 5px; border-top-right-radius: 5px; background: #4A90BE; padding: 20px;'>"
				+ "<img width='80' height='80' alt='Smile' src='http://tryhelloworld.co.kr/assets/icons/ic_smile-45a284c191283d76d502592026377b66f71c85e0c5b3b4e768c82682e834b07f.png'>"
				+ "</td></tr></thead>"
				+ "<tbody><tr><td style='vertical-align: top; padding: 40px;'>"
				+ "<h5 style='font-weight: 400; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0 0 10px;'>" + userNickName+"님의 보관함에 있는 카드입니다.</h5> "
				+ "<ul style='margin-bottom: 100px;'><li>글쓴이 : "+ cardNickName + "</li><li>내용 : " + cardContent  +"</li></ul>"
				+ "</td></tr></tbody>"
				+ "</table>"
				+ "</td></tr><tr><td align='center' height='100%' style='vertical-align: top; color: white; font-weight: 500; padding: 20px 0 40px;'>"
				+ "<h4 style='font-weight: 400; font-size: 18px; line-height: 28px; word-spacing: -0.5px; margin: 0;'>coily</h4>"
				+ "</td></tr></tbody></table>"
				+ "<img src='https://u2556246.ct.sendgrid.net/wf/open?upn=PudMd-2BtIr3P-2FVBE9OmzCkfswsIJK2FuaFsi8jZjVHVVtKnR8gDq5kc0aJLWj-2F3XtdV-2FnrTNvW0LUUwTuLHN-2Fk1OFkFezRHQekkMY3IQ5iJ4-2FOgd7Y-2Fg4fbMblMHcJ9jXk2PuaAu5HtATN6Nxa3KfjEj3cOtUD0kcTHxEeOdSPmv7zQNmOv9mpPF0I6ZGk083pc1oYMul9YW1TIhgnEC38nh7N1JGNFE4M4MTWMcKZAz5XtNaIYBUpXzJNu-2FT6kJW8XkS854LDlEXzsML2Xv8lw-3D-3D' alt='' width='1' height='1' border='0' style='height:1px !important;width:1px !important;border-width:0 !important;margin-top:0 !important;margin-bottom:0 !important;margin-right:0 !important;margin-left:0 !important;padding-top:0 !important;padding-bottom:0 !important;padding-right:0 !important;padding-left:0 !important;'>"
				+ "</meta>"
				+ "</div>";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(setfrom); // 보내는사람 생략하거나 하면 정상작동을 안함
			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content, true); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}
		
		return "ok";
	};
}
