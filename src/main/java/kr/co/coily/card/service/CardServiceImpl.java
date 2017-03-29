package kr.co.coily.card.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.coily.repository.dao.CardDAO;
import kr.co.coily.repository.vo.PageResultVO;
import kr.co.coily.repository.vo.SearchVO;

@Service
public class CardServiceImpl implements CardService{

	@Autowired
	private CardDAO dao;
	
	@Override
	public Map<String, Object> list(SearchVO search) throws Exception {
		Map<String, Object> result = new HashMap<>();
		result.put("list", dao.selectCard(search));
		result.put("pageResult", new PageResultVO(search.getPageNo(), dao.selectCardCount(search)));
		return result;
	}
	
/*	@Override
	public void write(Map<String, Object> param) throws Exception {
		dao.insertCard((CardVO)param.get("card"));
		int no = ((CardVO)param.get("card")).getCardNo();
		
		
		System.out.println("글 번호 : " + no);
		
		
		List<fileVO> boardFile = (List<fileVO>)param.get("fileList");
		
		System.out.println("파일 개수 : " + cardFile.size());
		
		if (cardFile.size()!=0) {
			
			
			for(int i=0;i<boardFile.size();i++) {
				fileVO vo = boardFile.remove(i);
				vo.setNo(no);
				dao.insertBoardFile(vo);
			}*/
//			boardFile.setReviewNo(no);
//			dao.insertBoardFile(boardFile);
//			System.out.println(boardFile.getFilePath());
//			System.out.println(boardFile.getOriName());
//			System.out.println(boardFile.getSystemName());
			
/*		}
	}*/
}
